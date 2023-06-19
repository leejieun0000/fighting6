import 'package:flutter/material.dart';
import 'package:project1/land_borrow/Landing_S.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timeago/timeago.dart' as timeago;

class LendingDetail extends StatefulWidget {
  const LendingDetail({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  _LendingDetailState createState() => _LendingDetailState(tabIndex: tabIndex);
}

class _LendingDetailState extends State<LendingDetail> {
  _LendingDetailState({required this.tabIndex});

  final int tabIndex;
  bool delete = false;
  bool lending_ing = false;
  bool lending_ok = false;

  User? _user;

  @override
  void initState() {
    super.initState();
    // 사용자 인증 상태 변경을 감지하고 사용자 정보를 업데이트합니다.
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _commentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            child: Theme(
              data: Theme.of(context).copyWith(
                cardColor: const Color(0xffFFF0A4),
              ),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Text("삭제"),
                      value: "delete",
                    ),
                    PopupMenuItem(
                      child: const Text("대여중"),
                      value: "lending_ing",
                    ),
                    PopupMenuItem(
                      child: const Text("대여가능"),
                      value: "lending_ok",
                    ),
                  ];
                },
                onSelected: (value) {
                  setState(() {
                    if (value == "delete") {
                      print("삭제 버튼이 눌렸습니다.");
                      delete = true;
                    } else if (value == "lending_ing") {
                      lending_ing = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LandingSetting(),
                        ),
                      );
                    } else if (value == "lending_ok") {
                      lending_ok = true;
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
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
                  "궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~ 드라이버 빌려드립니다.궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~",
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: 500,
                      child: const Divider(color: Colors.yellow, thickness: 2.0),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Container(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('comments').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }

                          // 댓글 목록을 조회하여 ListView로 표시
                          List<QueryDocumentSnapshot> commentDocs = snapshot.data!.docs;
                          commentDocs.sort((a, b) {
                            Timestamp timestampA = a.get('timestamp');
                            Timestamp timestampB = b.get('timestamp');
                            return timestampB.compareTo(timestampA);
                          });

                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: commentDocs.length,
                            itemBuilder: (context, index) {
                              String comment = commentDocs[index].get('comment');
                              String? userId = commentDocs[index].get('userId') as String?;
                              String username = userId != null ? 'User ID: ${userId.split('@')[0]}' : 'Anonymous';
                              Timestamp timestamp = commentDocs[index].get('timestamp');
                              DateTime commentTime = timestamp.toDate();
                              String timeAgo = timeago.format(commentTime); // timeago 패키지를 사용하여 시간을 표시

                              // 로그인한 사용자와 작성자를 비교하여 삭제 버튼을 표시
                              bool isCurrentUser = _user != null && _user!.email?.split('@')[0] == userId?.split('@')[0];

                              return ListTile(
                                title: Text(comment),
                                subtitle: Text('$username • $timeAgo'),
                                trailing: isCurrentUser || userId == null
                                    ? IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // 댓글 삭제
                                    String docId = commentDocs[index].id;
                                    FirebaseFirestore.instance.collection('comments').doc(docId).delete();
                                  },
                                )
                                    : null,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Padding(
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
                                String? userId = _user?.email?.split('@')[0]; // 이메일의 앞부분을 ID로 사용
                                Timestamp timestamp = Timestamp.now();
                                FirebaseFirestore.instance.collection('comments').add({
                                  'comment': comment,
                                  'userId': userId,
                                  'timestamp': timestamp,
                                });
                                _commentController.clear();
                              },
                              child: Text('작성'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:project1/land_borrow/Landing_S.dart';

class LendingDetail extends StatefulWidget {
  const LendingDetail({Key? key, required this.tabIndex, this.write = false}) : super(key: key);
  final int tabIndex;
  final bool write;

  @override
  _LendingDetailState createState() => _LendingDetailState(tabIndex: tabIndex);
}

class _LendingDetailState extends State<LendingDetail> {
  _LendingDetailState({required this.tabIndex});
  final int tabIndex;
  bool delete = false;
  bool lending_ing = false;
  bool lending_ok = false;

  @override
  Widget build(BuildContext context) {
    bool write2 = widget.write;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            child: Theme(
              data: Theme.of(context).copyWith(
                cardColor: const Color(0xffFFF0A4),
              ),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Text("삭제"),
                      value: "delete",
                    ),
                    PopupMenuItem(
                      child: const Text("대여중"),
                      value: "lending_ing",
                    ),
                    PopupMenuItem(
                      child: const Text("대여가능"),
                      value: "lending_ok",
                    ),
                  ];
                },
                onSelected: (value) {
                  setState(() {
                    if (value == "delete") {
                      print("삭제 버튼이 눌렸습니다.");
                      delete = true;
                    } else if (value == "lending_ing") {
                      lending_ing = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingSetting(tabIndex: tabIndex),
                        ),
                      );
                    } else if (value == "lending_ok") {
                      lending_ok = true;
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.all(4)),
            const Text(
              "드라이버 빌려 드립니다.",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            lending_ing && write2
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
                  '마감',
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
                "궁동에 거주하고 있고, 드라이버 필요하신 분 댓글 주세요~ 드라이버 빌려드립니다.",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
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
          ],
        ),
      ),
    );
  }
}
*/
