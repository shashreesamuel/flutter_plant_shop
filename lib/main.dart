// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_plant_shop/components/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List plantFilters = [
    [
      "All",
      true,
    ],
    ["Indoor", false],
    ["Outdoor", false],
    ["Popular", false],
  ];

  void plantFiltersSelected(int index) {
    setState(() {
      // make all the rest of the choice except all false

      for (int i = 0; i < plantFilters.length; i++) {
        plantFilters[i][1] = false;
      }
      plantFilters[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Find your',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500)),
              Text('favorite plants',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
          Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(Icons.search))
        ]),
        SizedBox(height: 20),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 242, 213),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('30% Off',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text('02 - 03 July',
                            style: GoogleFonts.poppins(fontSize: 14))
                      ]),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "images/pexels-photo-12057742.jpeg",
                      height: 70,
                      width: 70,
                      fit: BoxFit.fill,
                    ),
                  )
                ])),

        // ? Horizontal slider

        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plantFilters.length,
              itemBuilder: (context, index) {
                return SliderView(
                  option: plantFilters[index][0],
                  isSelected: plantFilters[index][1],
                  onTap: () {
                    plantFiltersSelected(index);
                  },
                );
              }),
        )
      ]),
    ));
  }
}
