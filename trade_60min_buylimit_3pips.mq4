
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   //int startime=Minute();
   int startime=Seconds();
   
   string symbol=Symbol(); // symbol
   int o_buy=OP_BUYLIMIT; // operation OP_BUY
   int o_sell=OP_SELLLIMIT
   double vol=0.02; // volume
   //double price=Ask; // price
   double p_buy=1.15760;
   double p_sell=1.15760;
   int SLP=2; // slippage
   double sl_buy=p_buy-0.0006; // stop loss
   double sl_sell=p_sell-0.0006;
   double tp_buy=p_buy+0.0002; // take profit
   double tp_sell=p_sell+0.0002;
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color arrow_color=Green; // color

   int total = OrdersTotal();
            int OpenBuyOrders=0,
      int OpenSellOrders=0;
      
   do {

      
      
      if(total<2){

 
//Count Pending Stop Orders
   for(int i=0;i<OrdersTotal(); i++ )
   {
      if(OrderSelect(i, SELECT_BY_POS)==true)
         {
         if (OrderType()==OP_BUYLIMIT)
            OpenBuyOrders++;
         if (OrderType()==OP_SELLLIMIT)
            OpenSellOrders++;   
         }
   }
   
   
      
         //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
      } 
   }
   while (startime<1800);
    
   //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
  }
//+------------------------------------------------------------------+
