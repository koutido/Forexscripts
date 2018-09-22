// 



void OnStart()
{
   datetime starttime=TimeLocal();      
   datetime stoptime=starttime+30;
   int stop=1;
   while(stop==1)
   { 
      //stop programme if current time >= start time + 60s
      if(TimeLocal()>=stoptime)
      {
         stop=0;
         Alert("Time up");
         break;
      }
      
   
      Alert("Sleeping 10 secondes");     
      Sleep(10000);
   }
}





