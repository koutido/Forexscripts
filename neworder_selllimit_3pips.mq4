void OnStart()
  {
   
   string symbol=Symbol(); // symbol
   int o_sell=OP_SELLLIMIT;   
   double vol=0.02; // volume
   double p_sell=1.15880;   
   int SLP=2; // slippage
   double sl_sell=p_sell+0.0006;   
   double tp_sell=p_sell-0.0003;
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color arrow_color=Red; // color 
   
   OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,arrow_color);
   
   }