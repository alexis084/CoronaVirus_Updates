import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  List<String> titles = ["Covid-19 Cases", "Covid-19 Vaccine Tracker",
    "Dr. John Campbell Youtube Channel", "Medcram YouTube Channel"];

  List<String> files = ["cases.png", "vaccineIMG.png", "dr.johncampbell.png",
      "Medcram.png"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
              "Your Covid-19 Briefing",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  _launchUrl(index);
                },
                title: Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.black,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${files[index]}'),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  _launchUrl(index) async {
    List<String> _urlsToLaunch = [
      "https://www.worldometers.info/coronavirus/",
      "https://www.nytimes.com/interactive/2020/science/coronavirus-vaccine-tracker.html",
      "https://www.youtube.com/c/Campbellteaching/videos/",
      "https://www.youtube.com/c/Medcram/videos"
    ];

      if (await canLaunch(_urlsToLaunch[index])) {
        await launch(_urlsToLaunch[index]);
      } else {
        throw "Could not open $_urlsToLaunch";
      }
  }
}