import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/provider/timer_provider.dart';
import 'package:stopwatch/screens/alarm_screen.dart';
import 'package:stopwatch/screens/time_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Clock',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        toolbarHeight: screenHeight * 0.1, // Set the app bar height as a percentage of the screen height
      ),
      body: homeScreenBody(screenHeight, screenWidth),
    );
  }

  homeScreenBody(double screenHeight, double screenWidth) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: const Color.fromARGB(255, 230, 229, 229),
        child: Consumer<TimerProvider>(
          builder: (context, timerProvider, widget) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05), // Set padding as a percentage of the screen width
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: screenHeight * 0.15, // Set the container height as a percentage of the screen height
                      width: screenWidth *1,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print('homescreen tapped');
                              HomeScreen();
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.hourglass_bottom_outlined),
                                Text('Stopwatch'),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CurrentTime()));
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.watch),
                                Text('Current Time'),
                              ],
                            ),
                          ),
                         ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => AlarmPage()));
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.timer),
                                Text('Alarm'),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Text(
                    '${timerProvider.hour}:${timerProvider.minute}:${timerProvider.seconds}:${timerProvider.milliseconds}',
                    style: const TextStyle(color: Colors.black, fontSize: 65),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (timerProvider.startEnable)
                              ? ElevatedButton(
                                  onPressed: () {
                                    timerProvider.startTimer();
                                    // Call the function
                                  },
                                  child: const Icon(Icons.play_arrow),
                                )
                              : ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.play_arrow),
                                ),
                          (timerProvider.stopEnable)
                              ? ElevatedButton(
                                  onPressed: () {
                                    timerProvider.stopTimer(); // Call the function
                                  },
                                  child: const Icon(Icons.pause),
                                )
                              : ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.pause),
                                ),
                          (timerProvider.resetEnable)
                              ? ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.pause),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    timerProvider.resetTimer();
                                  },
                                  child: const Icon(Icons.delete_forever),
                                ),
                          IconButton(
                            onPressed: () {
                              timerProvider.addlaps();
                            },
                            icon: const Icon(Icons.flag, color: Colors.blue),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Container(
                            height: screenHeight * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: ListView.builder(
                                itemCount: timerProvider.laps.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.alarm),
                                        Text(
                                          "Laps ${index + 1}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "${timerProvider.laps[index]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


