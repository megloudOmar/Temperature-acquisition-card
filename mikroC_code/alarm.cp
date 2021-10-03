#line 1 "C:/Users/DELL/Desktop/Portfolio/temperature_acquisition/alarm.c"
#line 1 "c:/users/dell/desktop/portfolio/temperature_acquisition/alarm.h"
 void alarm(void);
#line 3 "C:/Users/DELL/Desktop/Portfolio/temperature_acquisition/alarm.c"
void alarm(void)
{
 char receive;
 Delay_ms(500);
 if(UART1_Data_Ready())
 {
 receive = UART1_read();
 if(receive == 'a')
 {
 PORTB.B6 = 1;
 PORTB.B7 = 0;
 }
 }
}
