
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
   
   int o_sell=OP_SELLLIMIT;
   double vol=0.02; // volume
   //double price=Ask; // price
   double p_buy=1.16305;
   
   double p_sell=1.16400;
   int SLP=2; // slippage
   double sl_buy=p_buy-0.0006; // stop loss
   
   double sl_sell=p_sell-0.0006;
   
   double tp_buy=p_buy+0.0003; // take profit
   
   double tp_sell=p_sell+0.0003;
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color arrow_color=Green; // color  

   //int total = OrdersTotal();
   int PendingBuyLimitOrders=0;
   int PendingSellLimitOrders=0; 
   int total = OrdersTotal();
   
   OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,arrow_color);
   OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,arrow_color);
   
   /*     
   do {
      
      if(OrdersTotal()<2){
         //Count Pending BuyLimit Orders
         for(int i=0;i<OrdersTotal(); i++ )
         {
            if(OrderSelect(i, SELECT_BY_POS)==true){
               //MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");               
               if (OrderType()==OP_BUYLIMIT)
                  PendingBuyLimitOrders++;
                  MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");
               if (OrderType()==OP_SELLLIMIT)
                  PendingSellLimitOrders++; 
                  MessageBox(PendingSellLimitOrders,"Total pending sellelimit orders");  
                  
            }
         }
      
         if (PendingSellLimitOrders==0)
            {
            //OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,arrow_color);            
            PendingSellLimitOrders++;
            //MessageBox(PendingSellLimitOrders,"Total pending sellelimit orders");
            }
      
         if (PendingBuyLimitOrders==0)
            {
            //OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,arrow_color);
            PendingBuyLimitOrders++;
            //MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");
            } 
         
        
         //MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");
         //MessageBox(PendingSellLimitOrders, "Total pending selllimit orders");
         
   
      
         //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
     } 
   }
   while (startime<1800);
    
   //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
   
 */
  }
  
  
//+------------------------------------------------------------------+
