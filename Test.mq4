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
   //datetime future=TimeCurrent()+120;
   //Alert("Time to int: ",TimeSeconds(TimeCurrent()));
   //Alert("Time to int in 2 minutes: ",future);
   //Alert("Time to int in 2 minutes: ",TimeSeconds(future));
   
   int total = OrdersTotal();
   //int startime=Seconds();

   datetime open=TimeCurrent();
   datetime close=open+10;
   int stop=1;
  
   //int startime=TimeMinute(TimeLocal());  
   int stoptime=TimeMinute(TimeLocal())+1;   
   //Alert("Stop in: ",stoptime +"minutes"); 
      
      //Alert("Stop time: ",close);
      //if(TimeCurrent()==close)
      //{
         //stop=0;
      //   Alert("stop time!"); 
      //}
  

 
      for(int i=0;i<total; i++ )
         {
            if(OrderSelect(i, SELECT_BY_POS)==true){
               int Ticket=OrderTicket();
               if (OrderType()==OP_BUYLIMIT)
                  Alert("Order open time: ",OrderOpenTime()+120);
                  //PendingBuyLimitOrders++;
                  //Alert("open time: ",open);
                  //Alert("close time: ",close);
                  //if(open==close)
                  //   OrderDelete(Ticket);
               if (OrderType()==OP_SELLLIMIT)
                  Alert("Order open time: ",OrderOpenTime()+120);
                  //PendingSellLimitOrders++; 
                  //Alert("open time: ",open);
                  //Alert("close time: ",close);
                  //if(open==close)
                  //   OrderDelete(Ticket);  
            }
         }
  

   
 }
//+------------------------------------------------------------------+
