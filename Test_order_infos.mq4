//+------------------------------------------------------------------+
//|                                             Test_order_infos.mq4 |
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
   int total = OrdersTotal();
   for(int i=0;i<total; i++ )
   {
      if(OrderSelect(i, SELECT_BY_POS)==true){
         //int Ticket=OrderTicket();
         Alert("open time for the order " + i + ": " ,OrderOpenTime()); 
      }
      else
         Alert("OrderSelect returned error of ",GetLastError());
   }

   
}
//+------------------------------------------------------------------+
