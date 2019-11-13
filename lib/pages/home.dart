import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDaytime'] ? "assets/day.png" : "assets/night.png";
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    print(data);

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');

                    if (result != null) {
                      setState(() {
                        data = result;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300]
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.grey[300]
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
