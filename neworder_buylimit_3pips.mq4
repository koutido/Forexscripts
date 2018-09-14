void OnStart()
  {
   
   string symbol=Symbol(); // symbol
   int o_buy=OP_BUYLIMIT;   
   double vol=0.02; // volume
   double p_buy=1.16500;   
   int SLP=2; // slippage
   double sl_buy=p_buy-0.0006;   
   double tp_buy=p_buy+0.0003;
   
   string comment=NULL; // comment
   int magic=0; // magic number
   //datetime expiration=TimeCurrent()+30; // pending order expiration
   datetime exp_time=TimeCurrent()+700;
   color arrow_color=Green; // color 
   
   
   
   int ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,exp_time,arrow_color);
   if(ticket_buy<0)
      {
         Alert("Buy order Error: ", GetLastError());
      }
      else
      {
         Alert("Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
      }
   
   // Test fermeture ordre
   
   int total = OrdersTotal();
  
   int startime=Seconds();
   do
   {
      datetime open=TimeCurrent();
      datetime close=open+10;
      
      for(int i=0;i<total; i++ )
         {
            if(OrderSelect(i, SELECT_BY_POS)==true){
               int Ticket=OrderTicket();
               if (OrderType()==OP_BUYLIMIT)
                  //PendingBuyLimitOrders++;
                  if(open==close)
                     OrderDelete(Ticket);
               if (OrderType()==OP_SELLLIMIT)
                  //PendingSellLimitOrders++; 
                  if(open==close)
                     OrderDelete(Ticket);  
            }
         }
   
   }
   while(startime<60);
   
   
   
   
   }