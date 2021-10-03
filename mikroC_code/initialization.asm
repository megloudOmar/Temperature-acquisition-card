
_initialization:

;initialization.c,2 :: 		void initialization(void)
;initialization.c,4 :: 		TRISA.B0 = 1;           // ADC Pin
	BSF        TRISA+0, 0
;initialization.c,5 :: 		TRISB = 0b00000000;     // LED PORT
	CLRF       TRISB+0
;initialization.c,6 :: 		TRISD = 0b00000000;     // LCD
	CLRF       TRISD+0
;initialization.c,7 :: 		PORTA.B0 = 0;
	BCF        PORTA+0, 0
;initialization.c,8 :: 		PORTB.B7 = 1;           // Allumer la Led verte si on n'a pas dépassé le seuil
	BSF        PORTB+0, 7
;initialization.c,9 :: 		PORTB.B6 = 0;           // Allumer la led rouge si on dépasse le seuil
	BCF        PORTB+0, 6
;initialization.c,10 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;initialization.c,12 :: 		ADC_Init();
	CALL       _ADC_Init+0
;initialization.c,13 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;initialization.c,14 :: 		UART1_Init(96000);
	MOVLW      4
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;initialization.c,15 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_initialization0:
	DECFSZ     R13+0, 1
	GOTO       L_initialization0
	DECFSZ     R12+0, 1
	GOTO       L_initialization0
	DECFSZ     R11+0, 1
	GOTO       L_initialization0
	NOP
;initialization.c,16 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;initialization.c,17 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;initialization.c,18 :: 		Lcd_Out(1,1,"GSEA2 2018-2019");    // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_initialization+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;initialization.c,19 :: 		Lcd_out(2,2,"Thermometre");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_initialization+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;initialization.c,20 :: 		Delay_ms(2000);                    // Retard de 2 secondes
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_initialization1:
	DECFSZ     R13+0, 1
	GOTO       L_initialization1
	DECFSZ     R12+0, 1
	GOTO       L_initialization1
	DECFSZ     R11+0, 1
	GOTO       L_initialization1
	NOP
;initialization.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;initialization.c,22 :: 		}
L_end_initialization:
	RETURN
; end of _initialization
