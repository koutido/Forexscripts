
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   //int startime=Minute();
   int startime=Seconds();
   // résultat de ordersend
   int res_sell;
   int res_buy;
   
   string symbol=Symbol(); // symbol
   int o_buy=OP_BUYLIMIT; // operation OP_BUY   
   int o_sell=OP_SELLLIMIT;
   
   double vol=0.02; // volume
   //double price=Ask; // price
   
   double p_buy=1.15790;   
   double p_sell=1.15820;
   
   int SLP=2; // slippage
   
   double sl_buy=p_buy-0.0006; // stop loss
   double tp_buy=p_buy+0.0003; // take profit 
   
   double sl_sell=p_sell+0.0006; 
   double tp_sell=p_sell-0.0003;
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color buy_color=Green; // color  
   color sell_color=Red; // color  

   //int total = OrdersTotal();
   
   // initialisation
   //int PendingBuyLimitOrders=0;
   //int PendingSellLimitOrders=0;    
   //OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
   //OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
   
   //MessageBox(total,"Total orders");
   
       
   do {
      int total = OrdersTotal();
      if(total<2){
         //Count Pending BuyLimit Orders
         
         if(total==0){
            res_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration);
            res_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);  
            if(res_buy==-1)
               MessageBox("Impossible to send this buy order","Ordersend result"); 
            if(res_sell==-1)
               MessageBox("Impossible to send this sell order","Ordersend result");   
         }
         if(total==1){
            int order_type;
            //MessageBox(total,"Total orders"); 
            for(int i=0;i<total; i++ )
            {
               if(OrderSelect(i, SELECT_BY_POS)==true)
                  order_type=OrderType();
               if(order_type==0 || order_type==2 || order_type==4)
               // buy order existed, send sell order
                  res_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration);
                  if(res_sell==-1)
                     MessageBox("Impossible to send this sell order","Ordersend result");
               if(order_type==1 || order_type==3 || order_type==5)
               // sell order existed, send buy order
                  res_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
                  if(res_buy==-1)
                     MessageBox("Impossible to send this buy order","Ordersend result");
            }
         }
         
   /*     
         for(int i=0;i<total; i++ )
         {
            if(OrderSelect(i, SELECT_BY_POS)==true){
               //MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");               
               if (OrderType()==OP_BUYLIMIT)
                  //PendingBuyLimitOrders=PendingBuyLimitOrders+1;
                  PendingBuyLimitOrders++;
                  //MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");
               if (OrderType()==OP_SELLLIMIT)
                  PendingSellLimitOrders++; 
                  //MessageBox(PendingSellLimitOrders,"Total pending sellelimit orders");  
                  
            }
         }
      
         if (PendingSellLimitOrders==0)
            {
            OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);   
            // décrémenter cette valeur pour pouvoir lancer un nouveau ordre
            //PendingSellLimitOrders--;
            //MessageBox(PendingSellLimitOrders,"Total pending sellelimit orders");
            }
      
         if (PendingBuyLimitOrders==0)
            {
            OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
            // décrémenter cette valeur pour pouvoir lancer un nouveau ordre
            //PendingBuyLimitOrders--;
            //MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");
            } 
        
        
         //MessageBox(PendingBuyLimitOrders, "Total pending buylimit orders");
         //MessageBox(PendingSellLimitOrders, "Total pending selllimit orders");
         
   
      
         //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
     
     */
     
     }     
   }
   while (startime<1800);
    
   //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
   

  }
  
  
//+------------------------------------------------------------------+
