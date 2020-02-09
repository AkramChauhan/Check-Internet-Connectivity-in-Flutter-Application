import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class CheckInternetScreen extends StatefulWidget {
  @override
  _CheckInternetScreenState createState() => _CheckInternetScreenState();
}

class _CheckInternetScreenState extends State<CheckInternetScreen> {
  int _internetAvail = 0;

  Future checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState((){
        _internetAvail = 1;
      });
      print("Internet is available");
      return 1;

    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState((){
        _internetAvail = 1;
      });
      print("Internet is available");
      return 1;
    }else{
      setState((){
        _internetAvail = 0;
      });
      print("Sorry, Internet is not available");
      return 0;
    }
  }

  Widget displayInternetStatus(){
    if(_internetAvail==0){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.red[800],
                  Colors.red[800],
                  Colors.red[700],
                  Colors.red[600],
                  Colors.red[500],
                  Colors.red[800],
                ]
            ),
            borderRadius: BorderRadius.all(Radius.circular(3)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset.zero,
                blurRadius: 3.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text("Opps, Internet is not available..",style: TextStyle(
                  fontSize:17.0,
                  color:Colors.white,
                )),
              ),
            ],
          ),
        ),
      );
    }else if(_internetAvail==1){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.green[800],
                  Colors.green[700],
                  Colors.green[600],
                  Colors.green[500],
                  Colors.green[400],
                  Colors.green[800],
                ]
            ),
            borderRadius: BorderRadius.all(Radius.circular(3)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset.zero,
                blurRadius: 3.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text("Internet is Available",style: TextStyle(
                  fontSize:17.0,
                  color:Colors.white,
                )),
              ),
            ],
          ),
        ),
      );
    }else{
      return Text("Not sure what happened");
    }
  }

  @override
  void initState() {
    super.initState();
    checkInternet();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        displayInternetStatus(),
        Center(
            child:MaterialButton(
              onPressed: () async{
                checkInternet();
              },
              color: Colors.indigo,
              child: Text("Check Internet",style: TextStyle(
                  color: Colors.white
              ),),
            )
        )
      ],
    );
  }
}
