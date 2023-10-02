import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit(super.NoWeather);
  WeatherModel? weatherModel;
  getWeather({required String cityname}) async {
    try {
       weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityname);
      emit(WeatherLoadedSuccessful(weatherModel!));
    } catch (e) {
      emit(WeatherLoadedFauilre());
    }
  }
}
