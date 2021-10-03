#include "initialization.h"
void initialization(void)
{
     TRISA.B0 = 1;           // ADC Pin
     TRISB = 0b00000000;     // LED PORT
     TRISD = 0b00000000;     // LCD
     PORTA.B0 = 0;
     PORTB.B7 = 1;           // Allumer la Led verte si on n'a pas dépassé le seuil
     PORTB.B6 = 0;           // Allumer la led rouge si on dépasse le seuil
     PORTD = 0b00000000;
     
     ADC_Init();
     Lcd_Init();
     UART1_Init(96000);
     Delay_ms(100);
     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
     Lcd_Out(1,1,"GSEA2 2018-2019");    // Write text in first row
     Lcd_out(2,2,"Thermometre");
     Delay_ms(2000);                    // Retard de 2 secondes
     Lcd_Cmd(_LCD_CLEAR);
}