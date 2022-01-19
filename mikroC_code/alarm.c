#include "alarm.h"

void alarm(void)
{
      char receive;
      Delay_ms(500);
      if(UART1_Data_Ready())  // V�rifier si les donn�es sont pr�tes
      {
       receive = UART1_read(); // Recevoir les donn�es depuis l'UART
       if(receive == 'a')      // Si on re�oit la lettre 'a', on a d�pass� le seuil
       {
        PORTB.B6 = 1;           // Dans ce cas, on allume la led rouge
        PORTB.B7 = 0;           // Et on �teint la led verte
       }
      }
}