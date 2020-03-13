# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}


proc update_MODELPARAM_VALUE.SimFast { MODELPARAM_VALUE.SimFast } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "SimFast". Setting updated value from the model parameter.
set_property value false ${MODELPARAM_VALUE.SimFast}
}

proc update_MODELPARAM_VALUE.LedCountMax500ms { MODELPARAM_VALUE.LedCountMax500ms } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "LedCountMax500ms". Setting updated value from the model parameter.
set_property value 1000 ${MODELPARAM_VALUE.LedCountMax500ms}
}

proc update_MODELPARAM_VALUE.LedDutyCycle500ms { MODELPARAM_VALUE.LedDutyCycle500ms } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "LedDutyCycle500ms". Setting updated value from the model parameter.
set_property value 500 ${MODELPARAM_VALUE.LedDutyCycle500ms}
}

proc update_MODELPARAM_VALUE.LedCountMax100ms { MODELPARAM_VALUE.LedCountMax100ms } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "LedCountMax100ms". Setting updated value from the model parameter.
set_property value 200 ${MODELPARAM_VALUE.LedCountMax100ms}
}

proc update_MODELPARAM_VALUE.LedDutyCycle100ms { MODELPARAM_VALUE.LedDutyCycle100ms } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "LedDutyCycle100ms". Setting updated value from the model parameter.
set_property value 100 ${MODELPARAM_VALUE.LedDutyCycle100ms}
}

