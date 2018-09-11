
void OnStart()
  {
//---
   int order_type;
   for(int i=0;i<OrdersTotal(); i++ )
   {
      if(OrderSelect(i, SELECT_BY_POS)==true)
         order_type=OrderType();
      if(order_type==0 || order_type==2 || order_type==4)
         MessageBox("Buy order","Order type");
      if(order_type==1 || order_type==3 || order_type==5)
         MessageBox("Sell order","Order type");
   }
                 
   
   
  }
//+------------------------------------------------------------------+
