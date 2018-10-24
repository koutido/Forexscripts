#property show_inputs
input double resistance;
input double support;

void OnStart()
{
   datetime starttime=TimeLocal();      
   datetime stoptime=starttime+1800;
   int stop=1;

   //int ticket_sell;
   int ticket_buy;

   string symbol=SymbolName(0,true);
   int o_buy=OP_BUY;
   //int o_sell=OP_SELL;   
   double vol=0.02;  
   int SLP=0; 
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color buy_color=Green; // color  
   //color sell_color=Red; // color
   
   while(stop==1)
   {
      //double resistance=1.14555; // resistance level
      //double support=1.14545; // support level
      int total = OrdersTotal();
      //double price_buy=NormalizeDouble(Ask,Digits);
      //double price_sell=NormalizeDouble(Bid,Digits);
      //double price_sell = MarketInfo("EURUSD",MODE_ASK);
      //double price_buy = MarketInfo("EURUSD",MODE_BID);
      
      double sl_buy=MarketInfo(symbol,MODE_ASK)-0.00040; // stop loss
      //double tp_buy=NormalizeDouble(p_buy+0.00035,Digits); // take profit    
      //double sl_sell=MarketInfo(symbol,MODE_BID)+0.00040; 
      //double tp_sell=NormalizeDouble(p_sell-0.00035,Digits);
      
      //stop programme if current time >= start time + 60s
      if(TimeLocal()>=stoptime)
      {
         stop=0;
         Alert("Time up");
         break;
      }     
      // current price is between resistance and support level
      if(MarketInfo(symbol,MODE_ASK)>= support)
      {
         if(total<1)
         {
            Alert("price buy: ", MarketInfo(symbol,MODE_ASK));
            Alert("price sell: ", MarketInfo(symbol,MODE_BID)); 
            Alert("resistance = ",resistance);  
            Alert("support = ",support);   
            if(MarketInfo(symbol,MODE_ASK)<=support+0.00010)
            {
               Alert("Open a buy order ...");
               ticket_buy=OrderSend(symbol,o_buy,vol,MarketInfo(symbol,MODE_ASK),SLP,sl_buy,resistance-0.00005,comment,magic,expiration,buy_color);
               if(ticket_buy<0)
               {
                  Alert("Buy order Error: ", GetLastError());
               }
               else
               {
                  Alert("Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
               }
            }            
            Alert("Sleeping 2 secondes");     
            Sleep(2000);    
         }
         else
         {
            Alert("Existed order, sleeping 2 secondes");
            Alert("price buy: ", MarketInfo(symbol,MODE_ASK));
            Alert("price sell: ",MarketInfo(symbol,MODE_BID));     
            Sleep(2000);    
         }
      }
      else
      {
         Alert("Market is out of rang");
         Alert("Sleeping 2 secondes");     
         Sleep(2000);  
      }             
   }
}