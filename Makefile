PWD=$(shell pwd)

all: package

prepare:
	@mkdir -p work

project: prepare hxs
	@vivado -mode batch -source scripts/create_project.tcl -notrace -nojournal -tempDir work -log work/vivado.log

package:
	python3 setup.py sdist bdist_wheel

clean:
	@rm -rf .Xil vivado*.log vivado*.str vivado*.jou
	@rm -rf work \
		src-gen \
		hxs_gen

hxs:
	docker run -t \
               -v ${PWD}/hxs:/work/src \
               -v ${PWD}/hxs_gen:/work/gen \
               registry.build.aug:5000/docker/hxs_generator:latest
	cp hxs_gen/vhd_gen/header/wasm_fpga_bus_header.vhd resources/wasm_fpga_bus_header.vhd
	cp hxs_gen/vhd_gen/wishbone/wasm_fpga_bus_wishbone.vhd resources/wasm_fpga_bus_wishbone.vhd
	cp hxs_gen/vhd_gen/testbench/direct/wasm_fpga_bus_direct.vhd resources/wasm_fpga_bus_direct.vhd
	cp hxs_gen/vhd_gen/testbench/indirect/wasm_fpga_bus_indirect.vhd resources/wasm_fpga_bus_indirect.vhd

install-from-test-pypi:
	pip3 install --upgrade -i https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple wasm-fpga-bus

upload-to-test-pypi: package
	python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*

upload-to-pypi: package
	python3 -m twine upload --repository pypi dist/*

.PHONY: all prepare project package clean hxs
