

class WeatherModel {
  final String cityname;
  final DateTime date;
  final String image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String state;

  WeatherModel(
      {required this.cityname,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.state});

//access data from net

  factory WeatherModel.fromjson(json) {
     DateTime lastUpdated = DateTime.parse(json['current']['last_updated']);
   
    return WeatherModel(
        cityname:json['location']['name'],
        date:lastUpdated,
        image:json['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxtemp:json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        state: json['forecast']['forecastday'][0]['day']['condition']['text'],
        );
  }
}
