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
   double profit;
   for(int i=0;i<OrdersTotal(); i++ )
   {
      int type   = OrderType();
      bool result = false;
      if(OrderSelect(i, SELECT_BY_POS)==true)
      {
         profit=OrderProfit();
         if(profit<0.15)
            switch(type)
            {
               //Close opened long positions
               case OP_BUY       : OrderClose( OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_BID), 2, Green );
                                   break;     
               //Close opened short positions
               case OP_SELL      : OrderClose( OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_ASK), 2, Red );
                                   break;
                          
            }
      }
        
   }
  }
//+------------------------------------------------------------------+
