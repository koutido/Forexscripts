// ################## functions #############################
// this function return up when the market is up
// and it return down when the market is down
string analyse_market(string symbol) 
{
   //symbol=OrderSymbol();
   //symbol=SymbolName(1,true);
   // actual low and high price in M5
   double max_0=iHigh(symbol,PERIOD_M5,0);
   double min_0=iLow(symbol,PERIOD_M5,0);
   // low and high price 5 minutes before
   double max_1=iHigh(symbol,PERIOD_M5,1);
   double min_1=iLow(symbol,PERIOD_M5,1);
   // low and high price 10 minutes before
   double max_2=iHigh(symbol,PERIOD_M5,2);
   double min_2=iLow(symbol,PERIOD_M5,2);
   
   if(max_0>max_1)
   {
      if(min_0>min_1)
         return "up";
      if(min_0==min_1)
      {
         if(max_1>=max_2)
            return "up";
         else
         {
            if(min_1<min_2)
               return "down";
            else
               return "up";
         }
      }
      if(min_0<min_1)
      {
         if(min_1>min_2)
            return "up";
         else
            return "down";
      }
   }
   if(max_0==max_1)
   {
      if(min_0<min_1)
         return "down";
      else
         return "up";
   }
   if(max_0<max_1)
   {
      if(min_0<min_1)
         return "down";
      if(min_0==min_1)
      {
         if(max_1<max_2)
            return "down";
         else
            return "up";
      }
      if(min_0>min_1)
      {
         if(min_1>min_2)
            return "up";
         else
            return "down";
      }           
   }
   return "unknown";
}

// ##########################################################

void OnStart()
{
   datetime starttime=TimeLocal();      
   datetime stoptime=starttime+30;
   int stop=1;

   int ticket_sell;
   int ticket_buy;

   string symbol=SymbolName(0,true);
   int o_buy=OP_BUY; // operation OP_BUY   
   int o_sell=OP_SELL;   
   double vol=0.02; // volume   
   double p_buy=Ask;   
   double p_sell=Bid;   
   int SLP=0; // slippage   
   double sl_buy=p_buy-0.00080; // stop loss
   double tp_buy=p_buy+0.00025; // take profit    
   double sl_sell=p_sell+0.00080; 
   double tp_sell=p_sell-0.00025;   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   color buy_color=Green; // color  
   color sell_color=Red; // color
   
   while(stop==1)
   {
// ################## variables in while loop ################
      // number of placed orders
      int total = OrdersTotal();
      
      
      
            
// ###########################################################

      //stop programme if current time >= start time + 60s
      if(TimeLocal()>=stoptime)
      {
         stop=0;
         Alert("Time up");
         break;
      }
      // do anything when there are 2 orders or more
      if(total>=2)
      {
         Alert("Sleeping 10 secondes");     
         Sleep(10000);      
      }
      // when there are 0 or 1 order, total < 2
      else
      {
         // there is any order, analyse market and place order
         if(total==0)
         {            
            string tendency=analyse_market(symbol);
            Alert("Market symbol: ", symbol);
            Alert("Market tendency: ", tendency);
            if(tendency=="up")
            {
               Alert("Market is up. Open buy order");
               ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
               if(ticket_buy<0)
               {
                  Alert("[total=0] Buy order Error: ", GetLastError());
               }
               else
               {
                  Alert("[total=0] Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
               }               
            }
            if(tendency=="down")
            { 
               ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
               if(ticket_sell<0)
               {
                  Alert("[total=0] Sell order Error: ", GetLastError());
               }
               else
               {
                  Alert("[total=0] Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
               }
            } 
            if(tendency=="unknown")
               Alert("Tendency can't be defined");          
         }
         if(total==1)
         {
         
         }
         
      
      }
   

   }
}





