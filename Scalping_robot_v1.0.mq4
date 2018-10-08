void OnStart()
{
   datetime starttime=TimeLocal();      
   datetime stoptime=starttime+1800;
   int stop=1;

   int ticket_sell;
   int ticket_buy;

   string symbol=SymbolName(0,true);
   int o_buy=OP_BUY;
   int o_sell=OP_SELL;   
   double vol=0.02;  
   int SLP=0; 
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color buy_color=Green; // color  
   color sell_color=Red; // color
   
   while(stop==1)
   {
      double support=1.1489; // support level
      double resistance=1.1491; // resistance level
      double price_buy=Bid;
      double price_sell=Ask;
      
      //stop programme if current time >= start time + 60s
      if(TimeLocal()>=stoptime)
      {
         stop=0;
         Alert("Time up");
         break;
      }
      Alert("price buy", price_buy);
      Alert("price sell", price_sell);
      if(price_sell<resistance)
         if(price_sell>=resistance-0.00010)
         {
            Alert("Sell order can be opened");
         }
      if(price_buy>support)
         if(price_buy<=support+0.00010)
         {
            Alert("Buy order can be opened");
         }
      
      Alert("Sleeping 15 secondes");     
      Sleep(15000); 

   }
}