//+------------------------------------------------------------------+
//|                                                         Test.mq4 |
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
   //double info=MarketInfo(OrderSymbol(),MODE_TICKSIZE);
   //double high=iHigh(OrderSymbol(),PERIOD_M5,3);
   //double low=iLow(OrderSymbol(),PERIOD_M5,3);
   //Alert("M5 low: ",low);
   //Alert("M5 high: ",high);
   //info=MarketInfo(OrderSymbol(),MODE_ASK);
   //Alert("Info ask: ",info);
   //double candle=high-low;
   //Alert("Longueur de la bougie: ",candle);
   //Alert("Current time: ",TimeCurrent());
   //Alert("m5: ",PERIOD_M5);
   //Alert("Expiration time: ",TimeCurrent()+10);
   datetime future=TimeCurrent()+120;
   Alert("Time to int: ",TimeSeconds(TimeCurrent()));
   Alert("Time to int in 2 minutes: ",future);
   Alert("Time to int in 2 minutes: ",TimeSeconds(future));
   
   
 }
//+------------------------------------------------------------------+
