import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:riad_live_tv/TV%20List/Entertainment/big_time.dart';
import 'package:riad_live_tv/TV%20List/Entertainment/ecuastereo_tv.dart';
import 'package:riad_live_tv/TV%20List/Entertainment/etv.dart';
import 'package:riad_live_tv/TV%20List/Entertainment/mitv.dart';
import 'package:riad_live_tv/TV%20List/Entertainment/persiana.dart';
import 'package:riad_live_tv/TV%20List/Islamic/madani_bangla.dart';
import 'package:riad_live_tv/TV%20List/Islamic/madina.dart';
import 'package:riad_live_tv/TV%20List/Islamic/makkah.dart';
import 'package:riad_live_tv/TV%20List/Islamic/peaceTv.dart';
import 'package:riad_live_tv/TV%20List/News/zee_news.dart';
import 'package:riad_live_tv/TV%20List/Others/action_tv.dart';
import 'package:riad_live_tv/TV%20List/Others/bhtelecom.dart';
import 'package:riad_live_tv/TV%20List/Others/discover.dart';
import 'package:riad_live_tv/TV%20List/Others/discover_pk.dart';
import 'package:riad_live_tv/TV%20List/Others/etv.dart';
import 'package:riad_live_tv/TV%20List/Others/foxtv.dart';
import 'package:riad_live_tv/TV%20List/Sports/ct_sports.dart';
import 'package:riad_live_tv/TV%20List/Sports/euro_sports_1.dart';
import 'package:riad_live_tv/TV%20List/Sports/pluto_tv.dart';
import 'package:riad_live_tv/TV%20List/Sports/star_sports_1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 List <dynamic>posts=[];

 Future<void>downloadJson()async{
   final response =await get(Uri.parse("https://api.cricapi.com/v1/currentMatches?apikey=b4edff3a-31e8-441a-b243-c92379fc2dcc&offset=0"));
   if(response.statusCode==200){
   setState(() {
     posts=json.decode(response.body);
   });
   }
 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PeaceTV();
    Madani_Bangla();
    downloadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riad Live TV",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF1E39DA),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(image: AssetImage('assets/tv.gif')),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/islamic.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/news.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/sports.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/cartoon.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/animal.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 600),
                viewportFraction: 0.8,
              ),
            ),
            //==================//

            const SizedBox(height: 30,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Islamic Channel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(
                    0xff091f77)),),
              ),
            ),
            const Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                       PeaceTvCode(),MadaniCode(), MakkahCode(),MadinaCode()
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Sports Channel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(
                        0xff091f77)),),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CT_Code(),PlutoTV_Code(), Euro1Code(),StarCode()
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Entertainment Channel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(
                        0xff091f77)),),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        BigTime_Code(),Ecuastereo_Code(),ETV_HD_Code(),MITV_Code(),Persiana_Code(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("News Channel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(
                        0xff091f77)),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ZeeNewsCode(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Others Channel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(
                        0xff091f77)),),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ETV_Code(),DiscoveryCode(),Discovery_PK_Code(),ActionTV_Code(),Bhtelecom_Code(),FoxTV_Code(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => LiveScoresSheet(),
          );
        },
        label: Text("Live Score"),
      ),
    );
  }
}

class LiveScoresSheet extends StatefulWidget {
  @override
  _LiveScoresSheetState createState() => _LiveScoresSheetState();
}

class _LiveScoresSheetState extends State<LiveScoresSheet> {
  Future<List<Match>>? _futureMatches;

  @override
  void initState() {
    super.initState();
    _futureMatches = fetchMatches();
  }

  Future<List<Match>> fetchMatches() async {
    final response = await http.get(
      Uri.parse('https://api.cricapi.com/v1/currentMatches?apikey=b4edff3a-31e8-441a-b243-c92379fc2dcc&offset=0'),
    );

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        print('Response data: $data'); // For debugging

        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final matches = data['data'];
          if (matches is List) {
            return matches.map((match) => Match.fromJson(match)).toList();
          }
        }
        throw Exception('Unexpected data format');
      } catch (e) {
        print('Error parsing matches: $e');
        throw Exception('Failed to parse matches: $e');
      }
    } else {
      throw Exception('Failed to load matches');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: FutureBuilder<List<Match>>(
        future: _futureMatches,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No matches available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final match = snapshot.data![index];
                return Card(
                  color: Colors.white24,
                  child: ListTile(
                    title: Text(match.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status: ${match.status}'),
                        Text('Teams: ${match.teams.join(' vs ')}'),
                        if (match.scores.isNotEmpty)
                          ...match.scores.map((score) => Text('Score: $score')),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Match {
  final String name;
  final String status;
  final List<String> teams;
  final List<Score> scores;

  Match({
    required this.name,
    required this.status,
    required this.teams,
    required this.scores,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      name: json['name'] as String? ?? 'Unknown',
      status: json['status'] as String? ?? 'Unknown',
      teams: (json['teamInfo'] as List<dynamic>?)
          ?.map((team) => team['name'] as String? ?? 'Unknown')
          .toList() ?? [],
      scores: (json['score'] as List<dynamic>?)
          ?.map((scoreJson) => Score.fromJson(scoreJson as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}

class Score {
  final int runs;
  final int wickets;
  final double overs;
  final String inning;

  Score({
    required this.runs,
    required this.wickets,
    required this.overs,
    required this.inning,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      runs: int.tryParse(json['r'].toString()) ?? 0,
      wickets: int.tryParse(json['w'].toString()) ?? 0,
      overs: double.tryParse(json['o'].toString()) ?? 0.0,
      inning: json['inning'] as String? ?? 'Unknown',
    );
  }

  @override
  String toString() {
    return '$inning: $runs/$wickets in $overs overs';
  }
}