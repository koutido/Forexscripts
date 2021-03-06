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

// function to check if the market is volatile
bool is_volatile(string symbol)
{
   // actual low and high price in M5
   double max_0=iHigh(symbol,PERIOD_M5,0);
   double min_0=iLow(symbol,PERIOD_M5,0);
   double candle=max_0-min_0;
   if(candle>=9)
      return true;
   else
      return false;
}

// this function check pending order time
// it close pending order which has opentime >= 5 minutes
bool check_and_close(int a)
{
   if(OrderSelect(a, SELECT_BY_POS)==true)
   {
      int order_type=OrderType();
      // check only pending order
      if(order_type==2 || order_type==3 || order_type==4 || order_type==5)
      {         
         datetime open_time=OrderOpenTime();
         datetime close_time=open_time+300;
         //Alert("Order open time: ",open_time);
         //Alert("Order close time: ",close_time);
         
         // opentime reaches 5 min
         if(TimeCurrent()>=close_time)
         {
            Alert("Order can be deleted. Deleting ...");
            int ticket=OrderTicket();
            bool deleted=OrderDelete(ticket);                      
            if(deleted==true){
               Alert("Order deleted");
               return true;                           
            }
            else{
               Alert("Impossible to delete order: ",GetLastError());
               return false;
            }            
         }
         // opentime doesn't reach 5 min
         else
         {
            Alert("Order can't be deleted now");
            return false;   
         }
      
      }
      // direct order
      else
         Alert("We don't close direct order");
         return false;
               
   }
   else
   {
      Alert("No order found: ",GetLastError());
      return false;
   }
}


// ##########################################################

void OnStart()
{
   datetime starttime=TimeLocal();      
   datetime stoptime=starttime+1800;
   int stop=1;

   int ticket_sell;
   int ticket_buy;

   string symbol=SymbolName(0,true);
   int o_buy=OP_BUY; // operation OP_BUY   
   int o_sell=OP_SELL;   
   double vol=0.02; // volume     
   int SLP=0; // slippage   
   
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
      double p_max=iHigh(symbol,PERIOD_M15,0);
      double p_min=iLow(symbol,PERIOD_M15,0);
      //double actual_buy=Ask;
      //double actual_sell=Bid;
      double p_buy=Bid;   
      double p_sell=Ask;   
      double sl_buy; // stop loss
      double tp_buy; // take profit    
      double sl_sell; 
      double tp_sell;
      
      if(p_buy>=p_max)
      {
         tp_buy=p_buy+0.00035;         
         sl_buy=p_buy-0.00080;
         sl_sell=p_buy+0.00080;
         tp_sell=p_buy-0.00035;
      }
      else
      {
         sl_buy=p_min;
         tp_buy=p_max;    
         sl_sell=p_max; 
         tp_sell=p_min;
      }
         

            
// ###########################################################

      //stop programme if current time >= start time + 60s
      if(TimeLocal()>=stoptime)
      {
         stop=0;
         Alert("Time up");
         break;
      }
      // when there are 2 orders or more, delete old order
      if(total>=2)
      {
         //Check and close old order
         bool order_deleted;
         for(int i=0;i<total; i++ )
         {
            order_deleted=check_and_close(i);
            if(order_deleted==true)
               Alert("[total=2] Pending order deleted");
            else
               Alert("[total=2] Pending order isn't deleted");
         }
         Alert("Sleeping 15 secondes");     
         Sleep(15000);      
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
                  Alert("[total==0] Buy order Error: ", GetLastError());
               }
               else
               {
                  Alert("[total==0] Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
               }               
            }
            if(tendency=="down")
            {
               Alert("Market is down. Open sell order");
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
         // there is 1 order, we have to check the type
         if(total==1)
         {
            if(OrderSelect(0, SELECT_BY_POS)==true)
               int order_type=OrderType();
            // existed order is buy or sell order
            if(order_type==0 || order_type==1)
            {
               bool volatile=is_volatile(symbol);
               // market is volatile, open a direct order
               if(volatile==true)
               {
                  // check tendency and open an order
                  tendency=analyse_market(symbol);
                  if(tendency=="up")
                  {
                     Alert("Market is up. Open buy order");
                     ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
                     if(ticket_buy<0)
                     {
                        Alert("[total==1,volatile==true] Buy order Error: ", GetLastError());
                     }
                     else
                     {
                        Alert("[total==1,volatile==true] Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
                     }               
                  }
                  if(tendency=="down")
                  {
                     Alert("Market is down. Open sell order");
                     ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
                     if(ticket_sell<0)
                     {
                        Alert("[total==1,volatile==true] Sell order Error: ", GetLastError());
                     }
                     else
                     {
                        Alert("[total==1,volatile==true] Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
                     }
                  } 
                  if(tendency=="unknown")
                     Alert("[total==1,volatile==true] Tendency can't be defined");
                }
                // market isn't volatile, open a pending order
                if(volatile==false)
                {
                  // check market price to avoid error when open pending order
                  // define the pending buy order price
                  Alert("Price max: ",p_max);
                  Alert("Price min: ",p_min);
                  Alert("Actual buy price: ",p_buy);
                  Alert("Actual sell price: ",p_sell);

                  double buy_p_order_price;
                  double sell_p_order_price;
                  
                  if(p_min<p_buy)
                     buy_p_order_price=p_min;
                  else
                     buy_p_order_price=p_buy;
                  // define the pending sell order price
                  if(p_max>p_sell)
                     sell_p_order_price=p_max;
                  else
                     sell_p_order_price=p_sell;
                  
                  /*
                  // stop lost and take profit for pending orders
                  double sl_p_buy_order=buy_p_order_price-0.00080;
                  double sl_p_sell_order=sell_p_order_price+0.00080;
                  double tp_p_buy_order=buy_p_order_price+0.00035;
                  double tp_p_sell_order=sell_p_order_price-0.00035;
                  */
                  
                  tendency=analyse_market(symbol);                     
                  if(tendency=="up")
                  {
                     Alert("[total==1,volatile==false] Market is up. Open buy order");
                     
                     ticket_buy=OrderSend(symbol,OP_BUYLIMIT,vol,buy_p_order_price,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);                        
                     if(ticket_buy<0)
                     {
                        Alert("[total==1,volatile==false] Buy pending order Error: ", GetLastError());
                     }
                     else
                     {
                        Alert("[total==1,volatile==false] Buy pending order Sent Successfully, Ticket # is: " + string(ticket_buy));  
                     }
                  }
                  if(tendency=="down")
                  { 
                     Alert("[total==1,volatile==false] Market is down. Open sell order");
                     ticket_sell=OrderSend(symbol,OP_SELLLIMIT,vol,sell_p_order_price,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
                     if(ticket_sell<0)
                     {
                        Alert("[total==1,volatile==false] Sell pending order Error: ", GetLastError());
                     }
                     else
                     {
                        Alert("[total==1,volatile==false] Sell pending order Sent Successfully, Ticket # is: " + string(ticket_sell));  
                     }
                  }
                  if(tendency=="unknown")
                     Alert("[total==1,volatile==false] Tendency can't be defined");  
                }        
            }
            // existed order is a pending order
            if(order_type==2 || order_type==3 || order_type==4 || order_type==5)
            {
               // check market tendency and open a direct order
               tendency=analyse_market(symbol);
               if(tendency=="up")
               {
                  Alert("Market is up. Open buy order");
                  ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
                  if(ticket_buy<0)
                  {
                     Alert("[total==1,volatile==false] Buy order Error: ", GetLastError());
                  }
                  else
                  {
                     Alert("[total==1,volatile==false] Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
                  }               
               }
               if(tendency=="down")
               {
                  Alert("[total=1,volatile==false] Market is down. Open sell order");
                  ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
                  if(ticket_sell<0)
                  {
                     Alert("[total=1,volatile==false] Sell order Error: ", GetLastError());
                  }
                  else
                  {
                     Alert("[total=1,volatile==false] Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
                  }
               } 
               if(tendency=="unknown")
                  Alert("[total=1,volatile==false] Tendency can't be defined");     
            }
         
         }
         
      
      }
   

   }
}





