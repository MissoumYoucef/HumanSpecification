import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Application', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double _cnt = 0.0;
  int _w = 0;
  int _age = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Row(
            children: [
              Column(
                children: const [
                  SizedBox(
                      height: 170,
                      child: Image(image: AssetImage('assets/images/a.png'))),
                  Text('MALE')
                ],
              ),
              Column(
                children: const [
                  SizedBox(
                      height: 170,
                      child: Image(image: AssetImage('assets/images/b.png'))),
                  Text('FEMALE')
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Column(
            children: [
              const Text('Height'),
              Text(_cnt.toString()),
              Slider(
                value: _cnt,
                min: 0,
                max: 100,
                divisions: 5,
                label: _cnt.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _cnt = value;
                  });
                },
              ),
            ],
          ),
          Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('WEIGHT'),
                    Text(_w.toString()),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _w--;
                              });
                            },
                            icon: const Icon(Icons.remove)),
                            IconButton(onPressed: (){
                              setState(() {
                                _w++;
                              });
                            }, icon: const Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text('AGE'),
                    Text(_age.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _age--;
                              });
                            },
                            icon: const Icon(Icons.remove)),
                            IconButton(onPressed: (){
                              setState(() {
                                _age++;
                              });
                            }, icon: const Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
