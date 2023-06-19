import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// void main(){
//   runApp(const ItemList());
// }

class ItemList extends StatefulWidget {
  const ItemList({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  _ItemList createState() => _ItemList(tabIndex: tabIndex);
}

class _ItemList extends State<ItemList> {
  // const ItemList({Key? key}) : super(key: key);

  _ItemList({required this.tabIndex});
  final int tabIndex;
  CollectionReference usersRef = FirebaseFirestore.instance.collection("post");
  List<String> imageUrls = [];


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore ListView'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.where('category', isEqualTo: 1).where('town', isEqualTo: '궁동').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 15,
                        thickness: 1,
                        color: Colors.grey[200],
                        indent: 5,
                        endIndent: 5,
                      );
                    },
                    // padding: EdgeInsets.all(16),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      String title = data['title'] ?? '';
                      int category = data['category'] ?? '';
                      // DateTime day = data['day'] ?? '';
                      String detail = data['detail'] ?? '';
                      String image_url = data['image_url'] ?? '';
                      String userid = data['userid'] ?? '';
                      String dead_line = data['dead_line'] ?? '';

                      return InkWell(
                        onTap: () {
                          // 상세 페이지로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                category: category,
                                // day: day,
                                detail: detail,
                                image_url: image_url,
                                title: title,
                                userid: userid,
                                dead_line: dead_line,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 150,
                          child: Row(
                            children: [
                              Image.network(
                                image_url,
                                width: 80,
                                height: 140,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 30),
                                    Text(title,
                                      style: TextStyle(fontSize: 23, ),
                                    ),
                                    SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(dead_line,
                                          style: TextStyle(fontSize: 17, ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {

  bool lending_ing = false;

  final int category;
  // final DateTime day;
  final String detail;
  final String image_url;
  final String title;
  final String userid;
  final String dead_line;

  DetailPage({
    required this.category,
    // required this.day,
    required this.detail,
    required this.image_url,
    required this.title,
    required this.userid,
    required this.dead_line,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.all(4)),
            Text('$title',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Image.network(
                image_url,
                width: 380,
                height: 250,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Text(
                '$detail',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                '반납 날짜 : $dead_line',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 500,
              child: const Divider(color: Colors.yellow, thickness: 2.0),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "qwer",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "저 필요해요!!",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 30
                ),
                hintText: '댓글쓰기',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
          ],
        ),
      ),
    );
  }
}