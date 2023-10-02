import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/HomeView.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(NoWeather()),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.state),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == Null) {
    return Colors.blue;
  }

  if (condition == 'Rain' ||
      condition == 'Light rain' ||
      condition == 'Moderate rain' ||
      condition == 'Heavy rain' ||
      condition == 'Torrential rain shower') {
    return Colors.lightBlue;
  } else if (condition == 'Snow' ||
      condition == 'Light snow' ||
      condition == 'Moderate snow' ||
      condition == 'Heavy snow') {
    return Colors.blueGrey;
  } else if (condition == 'Sleet' ||
      condition == 'Light sleet' ||
      condition == 'Moderate or heavy sleet') {
    return Colors.lightBlue;
  } else if (condition == 'Thunderstorm' ||
      condition == 'Patchy light rain with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy snow with thunder') {
    return Colors.deepPurple;
  } else if (condition == 'Cloudy' ||
      condition == 'Overcast' ||
      condition == 'Mist' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.grey;
  } else if (condition == 'Sunny') {
    return Colors.orange;
  } else {
    return Colors.blue;
  }
}
