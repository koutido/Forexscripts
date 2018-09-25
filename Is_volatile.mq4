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


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
//---
   string symbol=SymbolName(0,true);    
   bool res=is_volatile(symbol);
   if(res==true)
      Alert("Market is volatile");
   else
      Alert("Market isn't volatile");
}
//+------------------------------------------------------------------+
