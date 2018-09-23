// this function return up when the market is up
// and it return down when the market is down
string analyse_market() 
{
   // actual buy and sell price
   double a_sell_price=MarketInfo(OrderSymbol(),MODE_ASK);
   double a_buy_price=MarketInfo(OrderSymbol(),MODE_BID); 
   // actual low and high price in M5
   double max_m5_0=iHigh(OrderSymbol(),PERIOD_M5,0);
   double min_m5_0=iLow(OrderSymbol(),PERIOD_M5,0);
   // low and high price 5 minutes before
   double max_m5_1=iHigh(OrderSymbol(),PERIOD_M5,1);
   double min_m5_1=iLow(OrderSymbol(),PERIOD_M5,1);
   // low and high price 10 minutes before
   double max_m5_2=iHigh(OrderSymbol(),PERIOD_M5,1);
   double min_m5_2=iLow(OrderSymbol(),PERIOD_M5,1);
   
   if(max_m5_0>max_m5_1)
   {
      if(min_m5_0>min_m5_1)
         return "up";
      if(min_m5_0==min_m5_1)
      {
         if(max_m5_1>=max_m5_2)
            return "up";
         else
            return "down";
      }
      if(min_m5_0<min_m5_1)
      {
         if(min_m5_1>min_m5_2)
            return "up";
         else
            return "down";
      }
   }
   if(max_m5_0==max_m5_1)
   {
      if(min_m5_0<min_m5_1)
         return "down";
      else
         return "up";
   }
   if(max_m5_0<max_m5_1)
   {
      if(max_m5_1<=max_m5_2)
         return "down";
      else
      {
         if(min_m5_1<min_m5_2)
            return "down";
         else
            return "up";
      }
   }
}

void OnStart()
{
   string tendency=analyse_market();
   Alert("Market tendency: ", tendency);
}
//+------------------------------------------------------------------+
