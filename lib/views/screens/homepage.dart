import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper2/controller/apicontroller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.network(
              "https://thumbs.dreamstime.com/b/white-smoke-beautiful-blue-sky-clouds-background-sky-clouds-sky-clouds-weather-nature-cloud-blue-blue-sky-white-114557668.jpg",
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Consumer<ApiController>(
              builder: (context, pro, _) {
                if (pro.data != null) {
                  double i = (pro.data!['main']['feels_like'] - 273.15);
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Weather Information",
                          style: TextStyle(fontSize: 26),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          onSubmitted: (val) {
                            pro.place = val;
                            pro.searchData(q: val);
                          },
                          decoration: const InputDecoration(
                            hintText: "ShriNagar",
                            labelText: "City Name",
                            border: OutlineInputBorder(),
                            // hintText: "Ex: kashmir",
                            // labelText: "City",
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          pro.place,
                          style: const TextStyle(fontSize: 50),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$i ".substring(0, 5),
                              style: const TextStyle(fontSize: 45),
                            ),
                            const Text(
                              "°C",
                              style: TextStyle(fontSize: 45),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Wind Speed :-  ",
                              style: TextStyle(fontSize: 27),
                            ),
                            Text(
                              "${pro.data!['wind']['speed']} ",
                              style: const TextStyle(fontSize: 27),
                            ),
                            const Text(
                              "Mph",
                              style: TextStyle(fontSize: 27),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Weather nature :-  ",
                              style: TextStyle(fontSize: 27),
                            ),
                            Text(
                              "${pro.data!['weather'][0]['description']} ",
                              style: const TextStyle(fontSize: 27),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Atospheric Pressure :-  ",
                              style: TextStyle(fontSize: 27),
                            ),
                            Text(
                              "${pro.data!['main']['pressure']} ",
                              style: const TextStyle(fontSize: 27),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
