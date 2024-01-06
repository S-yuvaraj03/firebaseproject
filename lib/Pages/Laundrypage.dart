import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Shop_details.dart';
import '../models/image_assert.dart';

class Laundrypage extends StatefulWidget {
  const Laundrypage({super.key});

  @override
  State<Laundrypage> createState() => _LaundrypageState();
}

class _LaundrypageState extends State<Laundrypage> {

  List<Shop> shops = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.https("https://www.justdial.com/_next/static/chunks/polyfills-c67a75d1b6f99dc8.js")); // Replace with your API endpoint

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        shops = data.map((item) => Shop.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
  

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay:true,
                        aspectRatio: 0.8 / 1,
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        // enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        onPageChanged: (index, _) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: bannerImages.map((image) {
                        return Container(
                          margin: EdgeInsets.all(0.1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bannerImages.map((image) {
                        int index = bannerImages.indexOf(image);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin:
                              EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black
                                .withOpacity(index == _currentIndex ? 0.9 : 0.6),
                          ),
                        );
                      }).toList(),
                    ),
                    // SizedBox(
                    //   child: Image.asset(
                    //     "assets/images/Cityscape.png",
                    //     height: 500,
                    //     fit: BoxFit.fitHeight,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 2; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color : Colors.black38,
                              blurRadius: 5.0,
                              spreadRadius: 1.0
                            )
                          ]
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color : Colors.black38,
                              blurRadius: 5.0,
                              spreadRadius: 1.0
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(0.8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                  child: Image.asset(
                                    "assets/images/Kolkata.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),  
                            Divider(
                              color: Colors.black54,
                              thickness: 0.8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Title(
                                  color: Colors.black, 
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Shop names",
                                          style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          ),
                                          ),
                                          Text("Location: Kolathur,Chennai\nServices: Drywash, streamiron, Coloring",
                                            style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  
                                ),
                              ]
                            ),
                          ],
                        ),
                      ),
                    ),
      //             ListView.builder(
      //             itemCount: shops.length,
      //             itemBuilder: (context, index) {
      //               return ListTile(
      //                 title: Text(shops[index].shopname),
      //                 subtitle: Text('Status: ${shops[index].shopisOpen ? 'Open' : 'Closed'}'),
      //                 trailing: Text('Rating: ${shops[index].shopratings.toString()}'),
      //                 leading: CachedNetworkImage(
      //                   imageUrl: shops[index].shopimage,
      //                   placeholder: (context, url) => CircularProgressIndicator(),
      //                   errorWidget: (context, url, error) => Icon(Icons.error),
      //       ),
      //     );
      //   },
      // ),
                ],
              ),
            )
          ],
        )));
  }
}
