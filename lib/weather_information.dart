import 'package:flutter/material.dart';

class WeatherInformation extends StatelessWidget {
  final String cityTitle;
  final int temperature;
  final String weatherStatusURL;

  WeatherInformation(this.cityTitle, this.temperature, this.weatherStatusURL);

  int convertToFahrenheit(int celsius) {
    return (celsius * 1.8 + 32).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityTitle,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (weatherStatusURL.isEmpty)
            Image.asset("assets/sad_face.png")
          else
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.network(weatherStatusURL),
            ),
          Text(
            "${this.convertToFahrenheit(temperature).toString()} Degrees Fahrenheit 🌡️",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
