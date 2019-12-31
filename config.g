; Configuration file for Duet Maestro (firmware version 1.21)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v2 on Sun May 05 2019 17:25:17 GMT-0600 (Central Standard Time)

; General preferences
G90							; Send absolute coordinates...
M83							; ...but relative extruder moves

; Network
M550 P"Ender3ProMaestro"				; Set machine name
M552 P0.0.0.0 S1					; Enable network and acquire dynamic address via DHCP
M586 P0 S1						; Enable HTTP
M586 P1 S1						; Disable FTP
M586 P2 S0						; Disable Telnet

; Drives
M569 P0 S0						; Drive 0 goes backwards
M569 P1 S0						; Drive 1 goes backwards
M569 P2 S1						; Drive 2 goes forwards
M569 P3 S0						; Drive 3 goes backwards
M350 X16 Y16 Z16 E16 I1					; Configure microstepping with interpolation
M92 X80 Y80 Z1600 E97					; Set steps per mm
M350 X32 Y32 E128 I1					; Set steps per mm for the extruder to x128 (776 steps per mm) and X and Y to x32 (160 steps per mm)
M566 X800 Y800 Z60 E3000 P1				; Set maximum instantaneous speed changes (mm/min)
M203 X12000 Y12000 Z900 E6000				; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z200 E5000				; Set accelerations (mm/s^2)
M204 P600 T2000						; Set accelerations (mm/s^2) for print and travel moves
M906 X700 Y700 Z700 E800 I30				; Set motor currents (mA) and motor idle factor in per cent
M84 S30							; Set idle timeout

; Axis Limits
M208 X0 Y0 Z-0.5 S1					; Set axis minima
M208 X235 Y235 Z228 S0					; Set axis maxima

; Endstops
M574 X1 Y1 Z2 S1					; Set active high endstops

; Z-Probe
M558 P9 H3 F120 T6000 A10 S0.003 B1 R0.5		; BLTouch Z probe settings
M557 X5:190 Y5:215 S10					; Define mesh grid
G31 P25 X-44 Y-17 Z2.072				; Set BLTouch offsets

; Heaters
M305 P0 T98801 B4185 R2200				; Set thermistor + ADC parameters for heater 0
M143 H0 S80						; Set temperature limit for heater 0 to 80C
M305 P1 T98801 B4185 R2200				; Set thermistor + ADC parameters for heater 1
M143 H1 S250						; Set temperature limit for heater 1 to 250C

; Fans
M106 P0 S0 I0 H-1 B0.5 F60 L0.25			; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S0 I0 H1 T45 L1					; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S0 I0 H1:0:100:101:102 T25			; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on

; Tools
M563 P0 S"Hotend" D0 H1					; Define tool 0
G10 P0 X0 Y0 Z0						; Set tool 0 axis offsets
G10 P0 R0 S0						; Set initial tool 0 active and standby temperatures to 0C

; Pressure Advance
M572 D0 S0.35						

; Retraction
M207 S6.5 R0.0 F4800 T4800 Z0.0 

	; M207: Set retract length
	; Parameters
	; 	Snnn positive length to retract, in mm
	; 	Rnnn positive or negative additional length to un-retract, in mm, default zero
	; 	Fnnn retraction feedrate, in mm/min
	; 	Tnnn feedrate for un-retraction if different from retraction, mm/min (RepRapFirmware 1.16 and later only)
	; 	Znnn additional zlift/hop
	; Example: M207 S4.0 F2400 Z0.075

; FEEDRATE CONVERSIONS
	; 20mm/s = F1200
	; 35mm/s = F2100
	; 50mm/s = F3000
	; 70mm/s = F4200
	; 100mm/s = F6000
	; 120mm/s = F7200
	; 133mm/s = F8000

; Automatic power saving
M911 S21 R23 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"	; Set voltage thresholds and actions to run on power loss

; Custom settings
M918 P1 E4						; Enable 12864 LCD with 1 menu item per encoder click
M912 P0 S-13						; CPU temperature calibration

; Miscellaneous
M501							; Load saved parameters from non-volatile memory
T0							; Select first tool

; BLTouch startup
G4 S2							; Pause a couple seconds
M280 P64 S160						; Clear any alarms
G4 S2							; Pause a couple seconds
M402							; retract pin just in case

; Startup Tune
;
G4 S10
M98 P"0:/macros/Musical Tunes/Startup.g"

