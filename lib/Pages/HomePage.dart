import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool like = false;
  bool dislike = false;

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
            Color.fromARGB(255, 255, 0, 85),
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
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 580,
          width: 390,
          child: Card(
            color: Color.fromARGB(255, 248, 232, 232),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Column(children: [
              Container(
                height: 500,
                padding: EdgeInsets.all(25),
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // image: DecorationImage(
                  //     image: AssetImage("Assets/applogo1.png"),
                  //     fit: BoxFit.cover),
                ),
                child: Shimmer.fromColors(
                    baseColor: Color.fromARGB(255, 190, 26, 26),
                    highlightColor: Color.fromARGB(255, 48, 184, 222),
                    child: dummyShimmer()),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 60,
                width: 380,
                child: Row(children: [
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        like = !like;
                        dislike = false;
                      });
                    },
                    child: Icon(
                      like ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                      size: 40,
                      color:
                          like ? Colors.green : Color.fromARGB(255, 1, 53, 118),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        dislike = !dislike;
                        like = false;
                      });
                    },
                    child: Icon(
                      dislike
                          ? Icons.thumb_down
                          : Icons.thumb_down_alt_outlined,
                      size: 40,
                      color: dislike
                          ? Colors.red
                          : Color.fromARGB(255, 1, 53, 118),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Icon(
                    Icons.share,
                    size: 40,
                    color: Color.fromARGB(255, 1, 53, 118),
                  ),
                ]),
              ),
            ]),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 100, right: 100, top: 20),
          height: 40,
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "More Fun",
              style: TextStyle(fontSize: 23),
            ),
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 150, 199, 207)),
                backgroundColor: MaterialStateProperty.all(Colors.black)),
          ),
        )
      ]),
    ));
  }

  Widget dummyShimmer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
