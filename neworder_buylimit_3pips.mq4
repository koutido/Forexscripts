void OnStart()
  {
   
   string symbol=Symbol(); // symbol
   int o_buy=OP_BUYLIMIT;   
   double vol=0.02; // volume
   double p_buy=1.16200;   
   int SLP=2; // slippage
   double sl_buy=p_buy-0.0006;   
   double tp_buy=p_buy+0.0003;
   
   string comment=NULL; // comment
   int magic=0; // magic number
   //datetime expiration=TimeCurrent()+30; // pending order expiration
   datetime exp_time=TimeCurrent()+700;
   color arrow_color=Green; // color 
   
   
   
   int ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,0,arrow_color);
   if(ticket_buy<0)
      {
         Alert("Buy order Error: ", GetLastError());
      }
      else
      {
         Alert("Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
      }
   

   
   
   
   }