
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
   int o_buy=OP_BUY; // operation OP_BUY   
   int o_sell=OP_SELL;
   
   double vol=0.02; // volume
   
   double p_buy=Ask;   
   double p_sell=Bid;
   
   int SLP=0; // slippage
   
   double sl_buy=p_buy-0.00100; // stop loss
   double tp_buy=p_buy+0.00030; // take profit 
   
   double sl_sell=p_sell+0.00100; 
   double tp_sell=p_sell-0.00030;
   
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
                  ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
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

     
     } 
     // take profit
   double profit;
   for(int t=0;t<OrdersTotal(); t++ )
   {
      int type   = OrderType();
      bool result = false;
      if(OrderSelect(t, SELECT_BY_POS)==true)
      {
         profit=OrderProfit();
         if(profit>0.18000)
         {
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
     
         
   }
   while (startime<1800);
  }
  
  
//+------------------------------------------------------------------+
