import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistraFalta extends StatefulWidget {
  @override
  _RegistraFaltaState createState() => _RegistraFaltaState();
}

class _RegistraFaltaState extends State<RegistraFalta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            DropdownButton(
                items: [DropdownMenuItem(child: Text("data"),value: false,),DropdownMenuItem(child: Text("oi"),value: true,)],
                onChanged: (value) {})

            //      Flexible(
            //   child: TextFormField(
            //     inputFormatters: [TextInputFormatter.withFunction((oldValue, newValue) => null)],
            //     controller: data,
            //     keyboardType: TextInputType.datetime,
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.all(8),
            //       border: UnderlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         borderSide: BorderSide(
            //             color: Colors.yellow,
            //             width: 10,
            //             style: BorderStyle.none),
            //       ),
            //       filled: true,
            //       fillColor: Colors.white,
            //       labelText: 'Data',

            //       labelStyle: TextStyle(

            //         color: Colors.black,
            //         fontSize: 15,
            //       ),
            //     ),
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
