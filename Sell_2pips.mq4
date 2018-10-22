//#property show_inputs
//input double resistance;
//input double support;

void OnStart()
{

   int ticket_sell;
   //int ticket_buy;

   string symbol=SymbolName(0,true);
   //int o_buy=OP_BUY;
   int o_sell=OP_SELL;   
   double vol=0.02;  
   int SLP=0; 
   
   string comment=NULL; // comment
   int magic=0; // magic number
   datetime expiration=0; // pending order expiration
   //color buy_color=Green; // color  
   color sell_color=Red; // color

   int total = OrdersTotal(); 
   double sl_sell=MarketInfo(symbol,MODE_BID)+0.00040; 
   //double tp_sell=NormalizeDouble(p_sell-0.00035,Digits);
   double take_profite=MarketInfo(symbol,MODE_BID)-0.00020;
   //double take_profite=NormalizeDouble(o_sell-0.00020,Digits);
   
   Alert("Open a sell order ...");
   ticket_sell=OrderSend(symbol,o_sell,vol,MarketInfo(symbol,MODE_ASK),SLP,sl_sell,take_profite,comment,magic,expiration,sell_color);
   if(ticket_sell<0)
   {
      Alert("Sell order Error: ", GetLastError());
   }
   else
   {
      Alert("Sell order Sent Successfully, Ticket # is: " + string(ticket_sell));  
   }
}