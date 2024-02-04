class Monitor{
  final double temperature;
  final double humidity;
  final double pH;
  final double soilEC;

  Monitor({
    required this.temperature,
    required this.humidity,
    required this.pH,
    required this.soilEC,
  });

  factory Monitor.fromJson(Map<String,dynamic> json)=> Monitor(
    temperature: json['temperature'], 
    humidity: json['humidity'], 
    pH: json['pH'], 
    soilEC: json['soilEC'],
  );
}