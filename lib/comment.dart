import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  TextEditingController _commentController = TextEditingController();
  bool lending_ing = false;

  /*User? _user;

  @override
  void initState() {
    super.initState();
    // 사용자 인증 상태 변경을 감지하고 사용자 정보를 업데이트합니다.
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('댓글 페이지'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(4)),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "드라이버 빌려 드립니다.",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.all(4)),
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
                  )
                : Container(
                    width: 380,
                    height: 250,
                    child: Image.asset(
                      'images/driver.png',
                      fit: BoxFit.fill,
                    ),
                  ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: const Text(
                "궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~ 드라이버 빌려드립니다.궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "반납 날짜 : 04/17/2023",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 500,
              child: const Divider(color: Colors.yellow, thickness: 2.0),
            ),
            // const Padding(padding: EdgeInsets.all(10)),
            SizedBox(height: 16.0),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('comments').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                // 댓글 목록을 조회하여 ListView로 표시
                List<QueryDocumentSnapshot> commentDocs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: commentDocs.length,
                  itemBuilder: (context, index) {
                    String comment = commentDocs[index].get('comment');
                    //String? userId = commentDocs[index].get('userId');
                    //String username = userId != null ? 'User ID: $userId' : 'Anonymous';
                    //Timestamp timestamp = commentDocs[index].get('timestamp');

                    //DateTime commentTime = timestamp.toDate();
                    //String timeAgo = timeago.format(commentTime); // timeago 패키지를 사용하여 시간을 표시

                    return ListTile(
                      title: Text(comment),
                      //subtitle: Text('$username • $timeAgo'),
                      trailing: /*_user != null && _user!.uid == userId
                          ?*/
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // 댓글 삭제
                          String docId = commentDocs[index].id;
                          FirebaseFirestore.instance
                              .collection('comments')
                              .doc(docId)
                              .delete();
                        },
                      ),
                      //:null,
                    );
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: '댓글을 입력하세요',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // 댓글 작성
                      String comment = _commentController.text;
                      FirebaseFirestore.instance.collection('comments').add({
                        'comment': comment,
                      });
                      _commentController.clear();
                    },
                    child: Text('작성'),
                    /*ElevatedButton(
    onPressed: () {
    if (_user != null) {
    // 로그인한 사용자인 경우, 댓글 작성
    String comment = _commentController.text;
    FirebaseFirestore.instance.collection('comments').add({
    'comment': comment,
    'userId': _user!.uid,
    });
    _commentController.clear();
    } else {
    // 로그인하지 않은 사용자인 경우, 경고창 표시
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('경고'),
    content: Text('로그인 후에 댓글을 작성할 수 있습니다.'),
    actions: [
    TextButton(
    onPressed: () {
    Navigator.pop(context);
    },
    child: Text('확인'),*/
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: CommentPage(),
  ));
}
