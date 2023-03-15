import 'package:flutter/material.dart';
import 'package:MemeDroid/Services/ApiService.dart';
import 'package:shimmer/shimmer.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService service = ApiService();
  String? data;
  Future<void> getData() async {
    data = await service.fetchNewMeme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
            Color.fromARGB(255, 196, 35, 89),
            Color.fromARGB(255, 204, 102, 47)
          ])),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 80,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Memes",
            style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 32, 183, 191),
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 600,
          width: 390,
          child: Card(
            color: Color.fromARGB(255, 249, 220, 220),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                width: 360,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FutureBuilder(
                    future: getData(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          height: 480,
                          padding: EdgeInsets.all(25),
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: NetworkImage(data!), fit: BoxFit.fill),
                          ),
                          // child:
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 0, 17, 255),
                            highlightColor: Color.fromARGB(255, 70, 255, 243),
                            child: dummyShimmer());
                      } else
                        return Container();
                    })),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 60,
                width: 380,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              getData();
                            });
                          },
                          child: Text(
                            "More Fun",
                            style: TextStyle(fontSize: 23),
                          ),
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 150, 199, 207)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Share.share(data!);
                        },
                        child: Icon(
                          Icons.share,
                          size: 40,
                          color: Color.fromARGB(255, 1, 53, 118),
                        ),
                      ),
                    ]),
              ),
            ]),
          ),
        ),
      ]),
    ));
  }

  Widget dummyShimmer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
