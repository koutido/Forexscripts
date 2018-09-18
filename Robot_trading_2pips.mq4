void OnStart()
  {
   //int startime=Minute();
   //int startime=Seconds();
   // résultat de ordersend
   int ticket_sell;
   int ticket_buy;
   
   string symbol=Symbol(); // symbol
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
   
      
   datetime starttime=TimeLocal();      
   datetime stoptime=starttime+60;
   int stop=1;
   while(stop==1)
   {
      // la boucle arrête après 5 secondes
      if(TimeLocal()==stoptime)
      {
         stop=0;
      }
   
      int total = OrdersTotal();
      
      if(total<2){
      
         //low and high price in M5
         double high=iHigh(OrderSymbol(),PERIOD_M5,0);
         double low=iLow(OrderSymbol(),PERIOD_M5,0);
         // actual buy and sell price
         double sell_price=MarketInfo(OrderSymbol(),MODE_ASK);
         double buy_price=MarketInfo(OrderSymbol(),MODE_BID);
         // comparaison des prix avant l'ouverture de position
         double diff_high=high-buy_price;
         double diff_low=buy_price-low;
         
         // quand il y a aucun ordre         
         if(total==0){            
            // le prix d'achat actuel est loin du prix le plus haut
            // plus de chance qu'il descend, passer un ordre sell
            if(diff_high>diff_low)
            {
               ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
               if(ticket_sell<0)
               {
                  Alert("Sell order1 Error: ", GetLastError());
               }
               else
               {
                  Alert("Sell order1 Sent Successfully, Ticket # is: " + string(ticket_sell));  
               }
            }
            else
            {
               // le price d'achat est près du haut
               // plus de chance qu'il monte, passer un ordre buy
               ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);
               if(ticket_buy<0)
               {
                  Alert("Buy order1 Error: ", GetLastError());
               }
               else
               {
                  Alert("Buy order1 Sent Successfully, Ticket # is: " + string(ticket_buy));  
               } 
            }            
         }
         // quand il y a déjà 1 ordre, ouvrir un 2ème
         if(total==1){
            int order_type;
            // la longueur de la bougie 5 minutes actuelle
            double candle0=high-low;
            // déterminer le min et max il y a 10 minutes
            double high2=iHigh(OrderSymbol(),PERIOD_M5,0);
            double low2=iLow(OrderSymbol(),PERIOD_M5,0);            
            //MessageBox(total,"Total orders"); 
            
            // si la longueur de la bougie est > 9, le marché est volatile
            // on doit déterminer la tendance en regardant les bougies précédentes
            if(candle0>9)
            {
               Alert("Longueur de la bougie: ",candle0);
               if(high>high2)
               // tendance haussière, ouvrir un buyorder
               {  
                  ticket_buy=OrderSend(symbol,o_buy,vol,p_buy,SLP,sl_buy,tp_buy,comment,magic,expiration,buy_color);                        
                  if(ticket_buy<0)
                     {
                        Alert("[Candle > 9] Buy order Error: ", GetLastError());
                     }
                     else
                     {
                        Alert("[Candle > 9] Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
                     }
               }
               else
               // tendance baissière, ouvrir un sellorder
               {
                  ticket_sell=OrderSend(symbol,o_sell,vol,p_sell,SLP,sl_sell,tp_sell,comment,magic,expiration,sell_color);
                  if(ticket_sell<0)
                     {
                        Alert("[Candle > 9] Sell order Error: ", GetLastError());
                     }
                     else
                     {
                        Alert("[Candle > 9] Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
                     }
               }                  
            }
            else
            {
            // longueur de la bougie est <= 9, le marché assez calme 
            // on ouvre les pending orders 
               Alert("Longueur de la bougie: ",candle0);
               for(int i=0;i<total; i++ )
               {
                  if(OrderSelect(i, SELECT_BY_POS)==true)
                     order_type=OrderType();
                  // recherche buy order
                  if(order_type==0 || order_type==2 || order_type==4)
                  {                  
                     // buy order existed, send sell order
                     ticket_sell=OrderSend(symbol,OP_SELLLIMIT,vol,high+0.00010,SLP,high+0.00090,high-0.00015,comment,magic,expiration,sell_color);
                     if(ticket_sell<0)
                     {
                        Alert("[Candle <= 9] Sell order Error: ", GetLastError());
                     }
                     else
                     {
                        Alert("[Candle <= 9] Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
                     }
                  } 
                  if(order_type==1 || order_type==3 || order_type==5)
                  {
                  // sell order existed, send buy order
                     ticket_buy=OrderSend(symbol,OP_BUYLIMIT,vol,low+0.00010,SLP,low-0.00090,low+0.00015,comment,magic,expiration,buy_color);
                     if(ticket_buy<0)
                     {
                        Alert("[Candle <= 9] Buy order Error: ", GetLastError());
                     }
                     else
                     {
                        Alert("[Candle <= 9] Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
                     }
                  }
               }
            }
         } // fin if total = 1     
     }
     Alert("Sleeping 5 secondes");     
     Sleep(300);     
   }

  }
  
  
//+------------------------------------------------------------------+
