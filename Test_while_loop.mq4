//+------------------------------------------------------------------+
//|                                              Test_while_loop.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
//---
   datetime starttime=TimeLocal();      
   datetime stoptime=starttime+5;
   int stop=1;
   Alert("starttime: ",starttime);
   Alert("stoptime: ",stoptime);
   while(stop==1)
   {
      if(TimeLocal()==stoptime)
      {
         stop=0;
      }
      Alert("la boucle continue");
   }

}
//+------------------------------------------------------------------+
