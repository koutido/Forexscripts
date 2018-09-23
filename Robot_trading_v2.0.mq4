// ################## functions #############################


// ##########################################################

void OnStart()
{
   datetime starttime=TimeLocal();      
   datetime stoptime=starttime+30;
   int stop=1;
   
   while(stop==1)
   {
// ################## variables in while loop ################
      // number of placed orders
      int total = OrdersTotal();
      
      
      
            
// ###########################################################

      //stop programme if current time >= start time + 60s
      if(TimeLocal()>=stoptime)
      {
         stop=0;
         Alert("Time up");
         break;
      }
      // do anything when there are 2 orders or more
      if(total>=2)
      {
         Alert("Sleeping 10 secondes");     
         Sleep(10000);      
      }
      // when there are 0 or 1 order, total < 2
      else
      {
         // there is any order, analyse market and place order
         if(total==0)
         {
         
         {
         if(total==1)
         {
         
         }
         
      
      }
   

   }
}





