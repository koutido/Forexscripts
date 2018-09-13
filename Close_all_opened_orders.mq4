
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---

      for(int t=0;t<OrdersTotal(); t++ )
   {
      int type   = OrderType();

      if(OrderSelect(t, SELECT_BY_POS)==true)
      {
            switch(type)
            {
               //Close opened long positions
               case OP_BUY       : OrderClose( OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_BID), 2, Green );
                                   break;     
               //Close opened short positions
               case OP_SELL      : OrderClose( OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_ASK), 2, Red );
                                   break;
                          
            }
         
      }
    }
  }
//+------------------------------------------------------------------+
