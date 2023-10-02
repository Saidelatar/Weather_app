import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
         getThemeColor(weatherModel.state) , 
           getThemeColor(weatherModel.state)[300]! ,
             getThemeColor(weatherModel.state)[50]! ,

          ],
          begin: Alignment.topCenter , 
          end: Alignment.bottomCenter ,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityname,
                style:const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Updated at ${weatherModel.date.hour} : ${weatherModel.date.minute}',
                style:const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            const  SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.network("https:${weatherModel.image}"),
                 const Spacer(
                    flex: 1,
                  ),
                  Text(
                    '${weatherModel.temp.round()}',
                    style:const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                const  Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      Text(
                        'MaxTemp: ${weatherModel.maxtemp.round()}',
                        style:const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'MinTemp: ${weatherModel.mintemp.round()}',
                        style:const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              const  SizedBox(
                height: 20,
              ),
              Text(
                weatherModel.state,
                style:const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
