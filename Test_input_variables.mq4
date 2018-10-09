//+------------------------------------------------------------------+
//|                                         Test_input_variables.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property show_inputs
input double resistance;
input double support;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
//---
   
   
   
   Alert("Resistance level is: ",resistance);
   Alert("Support level is: ", support);
}
//+------------------------------------------------------------------+
