import 'package:flutter/material.dart';
import './weather_information.dart';
import './weather_search.dart';

/// This widget represents the main page
class WeatherPage extends StatefulWidget {
  const WeatherPage({
    Key key,
  }) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String cityTitle;
  int temperature;
  String weatherStatusURL;

  // This methods initializes the state variables when the widget is initialized
  @override
  void initState() {
    super.initState();
    cityTitle = "No city has been selected!";
    temperature = 0;
    weatherStatusURL = "";
  }

  void updateWeather(String newCity, int newTemperature, String newStatus) {
    setState(() {
      cityTitle = newCity;
      temperature = newTemperature;
      weatherStatusURL = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WeatherInformation(
              this.cityTitle, this.temperature, this.weatherStatusURL),
          Padding(padding: EdgeInsets.all(20)),
          WeatherSearch(callback: updateWeather),
        ],
      ),
    );
  }
}
