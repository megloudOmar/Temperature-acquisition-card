#include "display.h"

void display(unsigned int temperature)
{
     float mV;
     char tempStr[12];
     char tab[12];
     char newline = 0x0A;      // New line character
     mV = temperature*(5000.0/1024);
     mV /= 10.0;
     FloatToStr(mV, tab);
     tempStr[0] = tab[0];
     tempStr[1] = tab[1];
     tempStr[2] = tab[2];
     tempStr[3] = tab[3];
     tempStr[4] = tab[4];
     Lcd_Out(1,1,"Temperature:");
     Lcd_Out(2,1,tempStr);
     Lcd_Chr(2,6,223);
     Lcd_Chr(2,7,'C');
     UART1_Write_text(tempStr);
     //UART1_Write(newline);
     Delay_ms(100);
}