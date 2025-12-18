import 'dart:async';

Future<void> fetchWeather() async
{
  print("Fetching weather data...");
  print("Connecting to server...");

  await Future.delayed(Duration(seconds: 2));
  print("Retrieving data...");

  await Future.delayed(Duration(seconds: 2));
  print("Processing data...");

  await Future.delayed(Duration(seconds: 2));
  print("Weather data loaded successful");
}

void main() async
{
  await fetchWeather();
}
