#property show_inputs
input double resistance;
input double support;

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
      //double resistance=1.14555; // resistance level
      //double support=1.14545; // support level
      int total = OrdersTotal();
      double price_buy=Ask;
      double price_sell=Bid;
      //double price_sell = MarketInfo("EURUSD",MODE_BID);
      //double price_buy = MarketInfo("EURUSD",MODE_ASK);
      
      double sl_buy=NormalizeDouble(price_buy-0.00060,Digits); // stop loss
      //double tp_buy=NormalizeDouble(p_buy+0.00035,Digits); // take profit    
      double sl_sell=NormalizeDouble(price_sell+0.00060,Digits); 
      //double tp_sell=NormalizeDouble(p_sell-0.00035,Digits);
      
      //stop programme if current time >= start time + 60s
      if(TimeLocal()>=stoptime)
      {
         stop=0;
         Alert("Time up");
         break;
      }     
      
      if(total<1)
      {
         Alert("price buy: ", price_buy);
         Alert("price sell: ", price_sell);         
         if(price_sell<=resistance)
            if(price_sell>resistance-0.00005)
            {
               Alert("Open a sell order ...");
               ticket_sell=OrderSend(symbol,o_sell,vol,price_sell,SLP,sl_sell,support,comment,magic,expiration,sell_color);
               if(ticket_sell<0)
               {
                  Alert("Sell order Error: ", GetLastError());
               }
               else
               {
                  Alert("Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
               }
            }
         if(price_buy>=support)
            if(price_buy<support+0.00005)
            {
               Alert("Open a buy order ...");
               ticket_buy=OrderSend(symbol,o_buy,vol,price_buy,SLP,sl_buy,resistance,comment,magic,expiration,buy_color);
               if(ticket_buy<0)
               {
                  Alert("Buy order Error: ", GetLastError());
               }
               else
               {
                  Alert("Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
               }
            }            
         Alert("Sleeping 5 secondes");     
         Sleep(5000);    
      }
      else
      {
         Alert("1 current order, sleeping 5 secondes");     
         Sleep(5000);    
      }       
   }
}