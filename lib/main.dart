// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_plant_shop/components/scrollable_container.dart';
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
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
        ]),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        border:
                            Border.all(width: 2.0, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.search))
              ]),
              SizedBox(height: 20),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              Text('02 - 03 July',
                                  style: GoogleFonts.poppins(fontSize: 14))
                            ]),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/pexels-photo-12057742.jpeg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                        )
                      ])),

              SizedBox(height: 30),
              // ? Horizontal slider

              Container(
                height: 50,
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
              ),

              // Scrollable list of all of the different plant types

              Expanded(
                child: ListView(children: [
                  ScrollableContainer(
                      text: 'Plant 1',
                      image:
                          'https://images.unsplash.com/photo-1463936575829-25148e1db1b8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHBsYW50c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                  ScrollableContainer(
                      text: 'Plant 2',
                      image:
                          'https://images.unsplash.com/photo-1425736317462-a103b1303a35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                  ScrollableContainer(
                      text: 'Plant 3',
                      image:
                          'https://images.unsplash.com/photo-1459022546482-45b0d469f9d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
                  ScrollableContainer(
                      text: 'Plant 4',
                      image:
                          'https://images.unsplash.com/photo-1446292532430-3e76f6ab6444?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1232&q=80'),
                ]),
              )
            ]),
          ),
        ));
  }
}
