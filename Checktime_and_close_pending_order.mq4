//+------------------------------------------------------------------+
//|                                    Checktime_and_close_order.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

// this function check pending order time
// it close pending order which has opentime >= 5 minutes
bool check_and_close(int a)
{
      if(OrderSelect(a, SELECT_BY_POS)==true)
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
      else
      {
         Alert("No order found: ",GetLastError());
         return false;
      }
}   


void OnStart()
{
//---

   check_and_close(2);  
}

//+------------------------------------------------------------------+
