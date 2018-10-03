void OnStart()
  {
   Alert("Symbol name of the current chart=",_Symbol);
   Alert("Timeframe of the current chart=",_Period);
   Alert("The latest known seller's price (ask price) for the current symbol=",Ask);
   Alert("The latest known buyer's price (bid price) of the current symbol=",Bid);   
   Alert("Number of decimal places=",Digits);
   Alert("Number of decimal places=",_Digits);
   Alert("Size of the current symbol point in the quote currency=",_Point);
   Alert("Size of the current symbol point in the quote currency=",Point);   
   Alert("Number of bars in the current chart=",Bars);
   Alert("Open price of the current bar of the current chart=",Open[0]);
   Alert("Close price of the current bar of the current chart=",Close[0]);
   Alert("High price of the current bar of the current chart=",High[0]);
   Alert("Low price of the current bar of the current chart=",Low[0]);
   Alert("Time of the current bar of the current chart=",Time[0]);
   Alert("Tick volume of the current bar of the current chart=",Volume[0]);
   Alert("Last error code=",_LastError);
   Alert("Random seed=",_RandomSeed);
   Alert("Stop flag=",_StopFlag);
   Alert("Uninitialization reason code=",_UninitReason);   
  }