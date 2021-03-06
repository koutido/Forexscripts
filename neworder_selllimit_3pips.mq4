void OnStart()
  {
   
   string symbol=Symbol(); // symbol
   int o_sell=OP_SELLLIMIT;   
   double vol=0.02; // volume
   double p_sell=1.16060;   
   int SLP=2; // slippage
   double sl_sell=p_sell+0.0008;   
   double tp_sell=p_sell-0.0003;
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color arrow_color=Red; // color 
   
   //int res=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic);
   int ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,arrow_color);
   //int res=OrderSend(symbol,OP_SELLLIMIT,0.02,1.15600,0,1.15780,1.15560,comment,magic,expiration);
   
   if(ticket_sell<0)
   {
      Alert("Sell order Error: ", GetLastError());
   }
   else
   {
      Alert("Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
   }
   
 }