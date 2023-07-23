class ApiModal {
  final String wind;
  final String main;
  final String weather;

  ApiModal({required this.main, required this.weather, required this.wind});

  factory ApiModal.fromMap({required Map data}) {
    return ApiModal(
        main: data['main'], weather: data['weather'], wind: data['wind']);
  }
}
