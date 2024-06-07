      //StatefulWidget means widget with variables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'DataRepository.dart';


class OtherPage extends StatefulWidget{

  @override
  State<OtherPage> createState() {
      return OtherPageState(); //no new for constructor
  }
}

//create a subclass of State<OtherPage>:
class OtherPageState extends State<OtherPage> //build() function, has variables
{

  @override
  Widget build(BuildContext context) { //represents what is seen on the page
    return  Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,title: Text("Page Two")),
        body: Center(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Welcome to my page "  + DataRepository.firstName),
                OutlinedButton(child:Text("launch sms"), onPressed: ()
                {
                    canLaunch("mailto:torunse@algonquincollege.com").then( (canMakePhoneCalls)  {
                      //if(canMakePhoneCalls){
                        launch("mailto:torunse@algonquincollege.com");
                     /* }
                      else { //show an error message
                        //can't make phone calls
                        var snackBar = SnackBar( content: Text('You can\'t make phone calls') );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }*/

                    });


                },)
            ])
        )
    );


  }

  //build function is what creates the layout and page widgets
}