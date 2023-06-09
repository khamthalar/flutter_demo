import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool isFavorited = false;

  setFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorited = !isFavorited;
      prefs.setBool("isFavorited", isFavorited);
    });
  }

  getFavorited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorited = prefs.getBool("isFavorited") ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    getFavorited();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(
                "https://picsum.photos/300/200",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 24),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ສະຖານທີ່ແນະນໍາ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      print("Clicked");
                    },
                    child: Column(
                      children: [
                        Icon(Icons.percent, size: 48),
                        Text("ຫຼວງພະບາງ")
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.offline_bolt, size: 48),
                      Text("ປາກເຊ")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.assist_walker, size: 48),
                      Text("ວັງວຽງ")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.g_mobiledata, size: 48),
                      Text("ສະຫວັນນະເຂດ")
                    ],
                  ),
                ],
              ),
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ສະຖານທີ່ແນະນໍາ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "images/img01.jpg",
                      width: MediaQuery.of(context).size.width * 0.40,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          setFavorite();
                        },
                        icon: Icon(Icons.favorite, color: isFavorited! ? Colors.red : Colors.white),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Info Page'),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Container(
    //       padding: const EdgeInsets.all(10),
    //       child: Column(
    //         children: [
    //           ClipRRect(
    //             borderRadius: BorderRadius.circular(10),
    //             child: Image.asset('images/img01.jpg',width: double.infinity,fit: BoxFit.cover,)),
    //           const SizedBox(height: 5,),
    //           const Align(
    //             alignment:Alignment.centerLeft,
    //             child: Text("ສະຖານທີ່ແນະນໍາ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ),)
    //           ),
    //           Row(
    //             children: <Widget>[
    //               Expanded(
    //                 child: Container(
    //                   padding: const EdgeInsets.only(left: 2,right: 2,),
    //                   child: Column(
    //                     children: [
    //                       Image.asset('images/img01.jpg',),
    //                       const Text("image01")
    //                     ],
    //                   ),
    //                 )
    //               ),
    //               Expanded(
    //                 child: Container(
    //                   padding: const EdgeInsets.only(left: 2,right: 2,),
    //                   child: Column(
    //                     children: [
    //                       Image.asset('images/img01.jpg',),
    //                       const Text("image01")
    //                     ],
    //                   ),
    //                 )
    //               ),
    //               Expanded(
    //                 child: Container(
    //                   padding: const EdgeInsets.only(left: 2,right: 2,),
    //                   child: Column(
    //                     children: [
    //                       Image.asset('images/img01.jpg',),
    //                       const Text("image01")
    //                     ],
    //                   ),
    //                 )
    //               ),
    //               Expanded(
    //                 child: Container(
    //                   padding: const EdgeInsets.only(left: 2,right: 2,),
    //                   child: Column(
    //                     children: [
    //                       Image.asset('images/img01.jpg',),
    //                       const Text("image01")
    //                     ],
    //                   ),
    //                 )
    //               ),

    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
