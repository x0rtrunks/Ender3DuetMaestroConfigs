; homez.g
; called to home the Z axis
;
; 

M913 X35 Y35 Z70	; Reduce motor currents for homing

G91               ; relative positioning
G1 H2 Z5 F1200    ; lift Z relative to current position
G1 H1 Z-265 F300 ; move Z down until the endstop is triggered
G92 Z0            ; set Z position to axis minimum (you may want to adjust this)

; Uncomment the following lines to lift Z after probing
G91              ; relative positioning
G1 Z50 F900       ; lift Z relative to current position
G90              ; absolute positioning

M913 X100 Y100 Z100	; Return motor currents to normal