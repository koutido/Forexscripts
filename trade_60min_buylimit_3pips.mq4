
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   //int startime=Minute();
   int startime=Seconds();
   // résultat de ordersend
   int ticket_sell;
   int ticket_buy;
   
   string symbol=Symbol(); // symbol
   int o_buy=OP_BUYLIMIT; // operation OP_BUY   
   int o_sell=OP_SELLLIMIT;
   
   double vol=0.02; // volume
   //double price=Ask; // price
   
   double p_buy=1.15920;   
   double p_sell=1.15950;
   
   int SLP=2; // slippage
   
   double sl_buy=p_buy-0.008; // stop loss
   double tp_buy=p_buy+0.0003; // take profit 
   
   double sl_sell=p_sell+0.0008; 
   double tp_sell=p_sell-0.0003;
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color buy_color=Green; // color  
   color sell_color=Red; // color  
      
   do {
      int total = OrdersTotal();
      if(total<2){
         // quand il y a aucun ordre         
         if(total==0){
            ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);  
            ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
            
            if(ticket_buy<0)
            {
               Alert("Buy order Error: ", GetLastError());
            }
            else
            {
               Alert("Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
            }
 
            if(ticket_sell<0)
            {
               Alert("Sell order Error: ", GetLastError());
            }
            else
            {
               Alert("Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
            } 
         }
         // quand il y a déjà 1 ordre, ouvrir un 2ème
         if(total==1){
            int order_type;
            //MessageBox(total,"Total orders"); 
            for(int i=0;i<total; i++ )
            {
               if(OrderSelect(i, SELECT_BY_POS)==true)
                  order_type=OrderType();
               if(order_type==0 || order_type==2 || order_type==4)
               {
               // buy order existed, send sell order
                  ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration);
                  if(ticket_sell<0)
                  {
                     Alert("Sell order Error: ", GetLastError());
                  }
                  else
                  {
                     Alert("Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
                  }
               } 
               if(order_type==1 || order_type==3 || order_type==5)
               {
               // sell order existed, send buy order
                  ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
                  if(ticket_buy<0)
                  {
                     Alert("Buy order Error: ", GetLastError());
                  }
                  else
                  {
                     Alert("Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
                  }
               }
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
   while (startime<600);
    
   //OrderSend(symbol,OP,vol,price,SLP,SL,TP,comment,magic,expiration,arrow_color);  
   

  }
  
  
//+------------------------------------------------------------------+
