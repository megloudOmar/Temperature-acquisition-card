#line 1 "C:/Users/DELL/Desktop/Portfolio/temperature_acquisition/initialization.c"
#line 1 "c:/users/dell/desktop/portfolio/temperature_acquisition/initialization.h"
void initialization(void);
#line 2 "C:/Users/DELL/Desktop/Portfolio/temperature_acquisition/initialization.c"
void initialization(void)
{
 TRISA.B0 = 1;
 TRISB = 0b00000000;
 TRISD = 0b00000000;
 PORTA.B0 = 0;
 PORTB.B7 = 1;
 PORTB.B6 = 0;
 PORTD = 0b00000000;

 ADC_Init();
 Lcd_Init();
 UART1_Init(96000);
 Delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"GSEA2 2018-2019");
 Lcd_out(2,2,"Thermometre");
 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
}
