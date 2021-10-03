#include "alarm.h"

void alarm(void)
{
      char receive;
      Delay_ms(500);
      if(UART1_Data_Ready())  // Vérifier si les données sont prêtes
      {
       receive = UART1_read(); // Recevoir les données depuis l'UART
       if(receive == 'a')      // Si on reçoit la lettre 'a', on a dépassé le seuil
       {
        PORTB.B6 = 1;           // Dans ce cas, on allume la led rouge
        PORTB.B7 = 0;           // Et on éteint la led verte
       }
      }
}