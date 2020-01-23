; homeall.g
; called to home all axes
;
; 

G91                     ; relative positioning
G1 H2 Z5 F900          ; lift Z relative to current position
G1 H1 X-240 Y-240 F3000 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 Y5 F6000       ; go back a few mm
G1 H1 X-240 Y-240 F240  ; move slowly to X and Y axis endstops once more (second pass)
G1 H1 Z-265 F240        ; move Z down stopping at the endstop
G90                     ; absolute positioning
G92 Z0                  ; set Z position to axis minimum (you may want to adjust this)

; Uncomment the following lines to lift Z after probing
G90                    ; absolute positioning
G1 X100 Y100 Z50 F900             ; lift Z relative to current position



