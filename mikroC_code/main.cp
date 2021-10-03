#line 1 "C:/Users/DELL/Desktop/Portfolio/temperature_acquisition/main.c"
#line 1 "c:/users/dell/desktop/portfolio/temperature_acquisition/initialization.h"
void initialization(void);
#line 1 "c:/users/dell/desktop/portfolio/temperature_acquisition/display.h"
void display(unsigned int temperature);
#line 1 "c:/users/dell/desktop/portfolio/temperature_acquisition/alarm.h"
 void alarm(void);
#line 6 "C:/Users/DELL/Desktop/Portfolio/temperature_acquisition/main.c"
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


unsigned int temp;

void main() {
 initialization();
 while(1)
 {
 temp = ADC_Read(0);
 display(temp);
 Delay_ms(500);
 alarm();
 }
}
