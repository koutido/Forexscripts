
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   //int startime=Minute();
   int startime=Seconds();
   
   string symbol=Symbol(); // symbol
   int OP=OP_BUYLIMIT; // operation OP_BUY
   double vol=0.01; // volume
   //double price=Ask; // price
   double price=1.15440;
   int SLP=2; // slippage
   double SL=price-0.0006; // stop loss
   double TP=price+0.0003; // take profit
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color arrow_color=Green; // color
<<<<<<< HEAD
   
   do {
      int total = OrdersTotal();
      if(total<2){
         OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
      } 
   }
   while (startime<30);
=======

   int total = OrdersTotal();
   int PendingBuyLimitOrders=0;
   int PendingSellLimitOrders=0;      
   do {
      if(total<2){
         //Count Pending BuyLimit Orders
         for(int i=0;i<OrdersTotal(); i++ )
         {
            if(OrderSelect(i, SELECT_BY_POS)==true){
               if (OrderType()==OP_BUYLIMIT)
                  PendingBuyLimitOrders++;
               if (OrderType()==OP_SELLLIMIT)
                  PendingSellLimitOrders++;   
            }
         }
        
         MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");
         MessageBox(PendingSellLimitOrders, "Total pending selllimit orders");
         
   
      
         //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
     } 
   }
   while (startime<2);
>>>>>>> parent of 02bf8a8... updated
    
   //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
  }
//+------------------------------------------------------------------+
