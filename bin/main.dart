import 'dart:io';

import 'weather_api_client.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1) {
    print("Syntax: dart bin/main.dart <city>");
    return;
  }
  final city = arguments.first;
  final api = WeatherApiClient();
  try {
    final weather = await api.getWeather(city);
    print(weather);
  } on WeatherApiException catch (e) {
    print(e.message);
  } on SocketException catch (_) {
    print(
        "Couldn't fetch data. Please check that you're connected to the internet.");
  } catch (e) {
    print(e);
  }
}
