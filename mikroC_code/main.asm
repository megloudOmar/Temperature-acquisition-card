
_main:

;main.c,22 :: 		void main() {
;main.c,23 :: 		initialization();
	CALL       _initialization+0
;main.c,24 :: 		while(1)
L_main0:
;main.c,26 :: 		temp = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;main.c,27 :: 		display(temp);
	MOVF       R0+0, 0
	MOVWF      FARG_display_temperature+0
	MOVF       R0+1, 0
	MOVWF      FARG_display_temperature+1
	CALL       _display+0
;main.c,28 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;main.c,29 :: 		alarm();
	CALL       _alarm+0
;main.c,30 :: 		}
	GOTO       L_main0
;main.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
