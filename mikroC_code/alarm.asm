
_alarm:

;alarm.c,3 :: 		void alarm(void)
;alarm.c,6 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_alarm0:
	DECFSZ     R13+0, 1
	GOTO       L_alarm0
	DECFSZ     R12+0, 1
	GOTO       L_alarm0
	DECFSZ     R11+0, 1
	GOTO       L_alarm0
	NOP
	NOP
;alarm.c,7 :: 		if(UART1_Data_Ready())  // Vérifier si les données sont prêtes
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_alarm1
;alarm.c,9 :: 		receive = UART1_read(); // Recevoir les données depuis l'UART
	CALL       _UART1_Read+0
;alarm.c,10 :: 		if(receive == 'a')      // Si on reçoit la lettre 'a', on a dépassé le seuil
	MOVF       R0+0, 0
	XORLW      97
	BTFSS      STATUS+0, 2
	GOTO       L_alarm2
;alarm.c,12 :: 		PORTB.B6 = 1;           // Dans ce cas, on allume la led rouge
	BSF        PORTB+0, 6
;alarm.c,13 :: 		PORTB.B7 = 0;           // Et on éteint la led verte
	BCF        PORTB+0, 7
;alarm.c,14 :: 		}
L_alarm2:
;alarm.c,15 :: 		}
L_alarm1:
;alarm.c,16 :: 		}
L_end_alarm:
	RETURN
; end of _alarm
