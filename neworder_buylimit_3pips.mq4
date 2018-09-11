void OnStart()
  {
   
   string symbol=Symbol(); // symbol
   int o_buy=OP_BUYLIMIT;   
   double vol=0.02; // volume
   double p_buy=1.15810;   
   int SLP=2; // slippage
   double sl_buy=p_buy-0.0006;   
   double tp_buy=p_buy+0.0003;
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color arrow_color=Green; // color 
   
   OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,arrow_color);
   
   }