import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bulbcard(),
            SizedBox(
              height: 60,
            ),
           
            
          ],
        ),
      ),
    );
  }
}

class bulbcard extends StatefulWidget {
 bulbcard({super.key});
  

  @override
  State<bulbcard> createState() => _bulbcardState();
}

class _bulbcardState extends State<bulbcard> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("test");
   var onPressed=false;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
//         setState(() {
//           onPressed=!onPressed;
//         });

//         if(onPressed){

//            ref.update({
//   "string": "ON",
// });

//         }else{
//            ref.update({
//   "string": "OFF",
// });
//         }
       
       
        
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.grey[200],
        child: Container(
          padding:EdgeInsets.all(15) ,
          child: Column(
            children: [
              Icon(onPressed ? Icons.lightbulb : Icons.lightbulb_outline,size: 100,color: onPressed ? Color.fromARGB(255, 243, 226, 33) : Colors.grey,),
              SizedBox(height: 15,),
              
              ElevatedButton(onPressed: (){
                setState(() {
          onPressed=!onPressed;
        });

        if(onPressed){

           ref.update({
            "string": "ON",
              });

            }
        else{
           ref.update({
          "string": "OFF",
            });
        }
             }, child: Text(onPressed ? "OFF" : "ON"),
             
             )
              
            ],

          ),

        ),
      ),
    );
  }
 
}


