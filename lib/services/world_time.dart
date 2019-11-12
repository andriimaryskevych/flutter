import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;
  String time;
  String flag;
  String url;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    Response response = await get('https://worldtimeapi.org/api/timezone/$url');

    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].toString().substring(1, 3);

    DateTime now = DateTime.parse(dateTime);
    now.add(Duration(hours: int.parse(offset)));

    time = now.toString();
  }

}
