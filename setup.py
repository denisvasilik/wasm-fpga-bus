import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

__tag__ = ""
__build__ = 0
__version__ = "{}".format(__tag__)
__commit__ = "0000000"

setuptools.setup(
    name="wasm-fpga-bus",
    version=__version__,
    author="Denis Vasilìk",
    author_email="contact@denisvasilik.com",
    url="https://github.com/denisvasilik/wasm-fpga-bus/",
    project_urls={
        "Bug Tracker": "https://github.com/denisvasilik/wasm-fpga/",
        "Documentation": "https://wasm-fpga.readthedocs.io/en/latest/",
        "Source Code": "https://github.com/denisvasilik/wasm-fpga-bus/",
    },
    description="WebAssembly FPGA Bus",
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3.6",
        "Operating System :: OS Independent",
    ],
    dependency_links=[],
    package_dir={},
    package_data={},
    data_files=[
        ("wasm-fpga-bus/package", ["package/component.xml"]),
        ("wasm-fpga-bus/package/bd", ["package/bd/bd.tcl"]),
        ("wasm-fpga-bus/package/xgui", ["package/xgui/wasm_fpga_bus_v1_0.tcl"]),
        (
            "wasm-fpga-bus/resources",
            [
                "resources/wasm_fpga_bus_header.vhd",
                "resources/wasm_fpga_bus_direct.vhd",
                "resources/wasm_fpga_bus_indirect.vhd",
                "resources/wasm_fpga_bus_wishbone.vhd",
            ],
        ),
        ("wasm-fpga-bus/src", ["src/WasmFpgaBus.vhd"]),
        (
            "wasm-fpga-bus/tb",
            [
                "tb/tb_pkg_helper.vhd",
                "tb/tb_pkg.vhd",
                "tb/tb_std_logic_1164_additions.vhd",
                "tb/tb_Types.vhd",
                "tb/tb_FileIo.vhd",
                "tb/tb_WasmFpgaBus.vhd",
            ],
        ),
        ("wasm-fpga-bus", ["CHANGELOG.md", "AUTHORS", "LICENSE"]),
    ],
    setup_requires=[],
    install_requires=[],
    entry_points={},
)
