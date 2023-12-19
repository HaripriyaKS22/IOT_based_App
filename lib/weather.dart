import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class weathercard extends StatefulWidget {
  const weathercard({super.key});

  @override
  State<weathercard> createState() => _weathercardState();
}

class _weathercardState extends State<weathercard> {

   var p="";
   var url="https://io.adafruit.com/api/v2/akshaypsmec/feeds/pressure";
   var temp="";
   var url2="https://io.adafruit.com/api/v2/akshaypsmec/feeds/tempt";
   

    @override
  void initState(){
    super.initState();
    getpressure();

  }
  Future getpressure() async{
     
     try{
      var response=await http.get(Uri.parse(url));
      var response2=await http.get(Uri.parse(url2));

      var decodep= jsonDecode(response.body);
      var decodetemp =jsonDecode(response2.body);
      setState(() {
       p=decodep["last_value"].toString();
       temp=decodetemp["last_value"].toString();
       
      });

     }
     catch(e)
     {
     p= e.toString();
     }


  }


  @override
  Widget build(BuildContext context) {
    return Center(
    
        
        child: Column(
         
          children: [  
            SizedBox(height: 15,),
            
              Card(
          elevation: 15,

          
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Color.fromARGB(255, 10, 224, 70),
            child: Container(
               padding:EdgeInsets.all(80) ,

                 decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage("lib/assets/night.png"), // Replace with your image asset
                    fit: BoxFit.cover,
                  ),
                ),
               child: Column(
                children: [
                  Text("Pressure",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          p !="null" ? Text("$p P",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 40),) :CircularProgressIndicator(),
        
                ],
               ),
            ),
          
        ),
        SizedBox(height: 10,),
            Card(
              
          
          elevation: 15,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Color.fromARGB(255, 2, 156, 125),
            child: Container(
               padding:EdgeInsets.all(100) ,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(50), 
                  image: DecorationImage(
                    
                    image: AssetImage("lib/assets/after_noon.png"), // Replace with your image asset
                    fit: BoxFit.cover,
                  ),
                ),
               child: Column(
                children: [
                   Text("Temprature",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          temp !="null" ? Text("$temp °C",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),) :CircularProgressIndicator(),
        
                ],
               ),
            ),
          
        )
        ],
        ),
      
    );


  }

}