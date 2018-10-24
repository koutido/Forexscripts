//#property show_inputs
//input double resistance;
//input double support;

void OnStart()
{
   
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

   int total = OrdersTotal(); 
   double sl_buy=MarketInfo(symbol,MODE_BID)-0.00040; 
   //double tp_sell=NormalizeDouble(p_sell-0.00035,Digits);
   double take_profite=MarketInfo(symbol,MODE_ASK)+0.00020;
   
   Alert("Open a buy order ...");
   ticket_buy=OrderSend(symbol,o_buy,vol,MarketInfo(symbol,MODE_ASK),SLP,sl_buy,take_profite,comment,magic,expiration,buy_color);
   if(ticket_buy<0)
   {
      Alert("Buy order Error: ", GetLastError());
   }
   else
   {
      Alert("Buy order Sent Successfully, Ticket # is: " + string(ticket_buy));  
   }
}