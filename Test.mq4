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
   double m5high=iHigh(OrderSymbol(),PERIOD_M5,0);
   double m5low=iLow(OrderSymbol(),PERIOD_M5,0);
   Alert("M5 low: ",m5low);
   Alert("M5 high: ",m5high);
   //info=MarketInfo(OrderSymbol(),MODE_ASK);
   //Alert("Info ask: ",info);
 }
//+------------------------------------------------------------------+
