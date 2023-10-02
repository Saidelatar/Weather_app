import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/widgets/body.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';
import '../widgets/weather_info.dart';
import 'searchView.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title:const Text(
              'Weather',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchView(),
                      ),
                    );
                  },
                  icon:const Icon(Icons.search))
            ]),
        body: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is NoWeather) {
              return Body();
            } else if (state is WeatherLoadedSuccessful) {
              return WeatherInfo(
                weather: state.weatherModel,
       
              );
            } else {
              return const Text('oops , there is erro try later');
            }
          },
        ));
  }
}
