import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// void main(){
//   runApp(const ItemList());
// }

class ItemList extends StatelessWidget {
  // const ItemList({Key? key}) : super(key: key);

  ItemList({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;
  final CollectionReference usersRef = FirebaseFirestore.instance.collection("post");
  List<String> imageUrls = [];

  Future<void> fetchImageUrlsByFolder(String folderName) async {
    Reference storageReference = FirebaseStorage.instance.ref().child(folderName);
    ListResult listResult = await storageReference.listAll();
    List<Reference> allFiles = listResult.items;

    List<String> urls = [];
    for (Reference file in allFiles) {
      String url = await file.getDownloadURL();
      urls.add(url);
    }

    imageUrls = urls;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore ListView'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.where('category', isEqualTo: 1).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<String> documentNames = []; // 문서 이름을 저장할 리스트
          List<String> imageUrls = [];

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
                          height: 100,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('images/ganjang.png'),
                              ),
                              // Image.network(
                              //   imageUrls[index],
                              //   width: 30,
                              //   height: 30,
                              // ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(title),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(dead_line),
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
              child: Text(
                '$detail',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            lending_ing
                ? Container(
              width: 380,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xff60597B),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.2),
                    BlendMode.dstATop,
                  ),
                  image: AssetImage('images/driver.png'),
                ),
              ),
              child: Center(
                child: const Text(
                  '대여중',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ): Container(
              width: 380,
              height: 250,
              child: Image.asset(
                'images/driver.png',
                fit: BoxFit.fill,
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