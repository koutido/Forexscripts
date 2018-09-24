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

void OnStart()
{
   //string symbol=OrderSymbol();
   string symbol=SymbolName(0,true);
   string tendency=analyse_market(symbol);
   Alert("Market : ", symbol);
   Alert("Market tendency: ", tendency);
}
//+------------------------------------------------------------------+
