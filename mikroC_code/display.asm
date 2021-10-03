
_display:

;display.c,3 :: 		void display(unsigned int temperature)
;display.c,8 :: 		char newline = 0x0A;      // New line character
;display.c,9 :: 		mV = temperature*(5000.0/1024);
	MOVF       FARG_display_temperature+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_temperature+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      64
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
;display.c,10 :: 		mV /= 10.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
;display.c,11 :: 		FloatToStr(mV, tab);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      display_tab_L0+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;display.c,12 :: 		tempStr[0] = tab[0];
	MOVF       display_tab_L0+0, 0
	MOVWF      display_tempStr_L0+0
;display.c,13 :: 		tempStr[1] = tab[1];
	MOVF       display_tab_L0+1, 0
	MOVWF      display_tempStr_L0+1
;display.c,14 :: 		tempStr[2] = tab[2];
	MOVF       display_tab_L0+2, 0
	MOVWF      display_tempStr_L0+2
;display.c,15 :: 		tempStr[3] = tab[3];
	MOVF       display_tab_L0+3, 0
	MOVWF      display_tempStr_L0+3
;display.c,16 :: 		tempStr[4] = tab[4];
	MOVF       display_tab_L0+4, 0
	MOVWF      display_tempStr_L0+4
;display.c,17 :: 		Lcd_Out(1,1,"Temperature:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_display+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;display.c,18 :: 		Lcd_Out(2,1,tempStr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      display_tempStr_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;display.c,19 :: 		Lcd_Chr(2,6,223);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;display.c,20 :: 		Lcd_Chr(2,7,'C');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;display.c,21 :: 		UART1_Write_text(tempStr);
	MOVLW      display_tempStr_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;display.c,23 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_display0:
	DECFSZ     R13+0, 1
	GOTO       L_display0
	DECFSZ     R12+0, 1
	GOTO       L_display0
	DECFSZ     R11+0, 1
	GOTO       L_display0
	NOP
;display.c,24 :: 		}
L_end_display:
	RETURN
; end of _display
