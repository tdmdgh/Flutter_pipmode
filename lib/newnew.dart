import 'package:flutter/material.dart';
import 'main.dart';
class SecPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    WillPopScope(
          onWillPop: () async {
          bool result = onPressBackButton();
          return await Future.value(result);
        },
          child: 
          Scaffold(
          appBar: AppBar(),
          body: Container(
            height: MediaQuery.of(context).size.height-600,
            width: MediaQuery.of(context).size.width-200,
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
                        child: FlatButton(onPressed: () { 
                
                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SecPage()));
               },
              child: Text('nextpage'),
              color: Colors.brown),
            ),
          ))
    )
    ;
  }
  
}