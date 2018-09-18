//+------------------------------------------------------------------+
//|                                                  Test_orders.mq4 |
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
   int ticket_sell;
   int ticket_buy;
   
   string symbol=Symbol(); // symbol
   int o_buy=OP_BUY; // operation OP_BUY   
   int o_sell=OP_SELL;
   
   double vol=0.02; // volume
   
   double p_buy=Ask;   
   double p_sell=Bid;
   
   int SLP=0; // slippage
   
   double sl_buy=p_buy-0.00080; // stop loss
   double tp_buy=p_buy+0.00025; // take profit 
   
   double sl_sell=p_sell+0.00080; 
   double tp_sell=p_sell-0.00025;
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color buy_color=Green; // color  
   color sell_color=Red; // color
   double high=iHigh(OrderSymbol(),PERIOD_M5,0);
   double low=iLow(OrderSymbol(),PERIOD_M5,0);

   ticket_buy=OrderSend(symbol,OP_BUYLIMIT,vol,low+0.00010,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
   if(ticket_buy<0)
   {
      Alert("Buy order Error: ", GetLastError());
   }
   else
   {
      Alert("Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
   }
   
  }
//+------------------------------------------------------------------+
