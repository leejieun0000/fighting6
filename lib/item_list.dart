import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:firebase_auth/firebase_auth.dart';

void createCommentsCollection(String documentId) {
  CollectionReference commentsCollection =
  FirebaseFirestore.instance.collection('comments_$documentId');
  commentsCollection.doc(documentId).set({}); // 해당 게시글의 댓글 컬렉션 생성
}

class ItemList extends StatefulWidget {
  const ItemList({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  _ItemList createState() => _ItemList(tabIndex: tabIndex);
}

class _ItemList extends State<ItemList> {
  _ItemList({required this.tabIndex});
  final int tabIndex;
  CollectionReference usersRef = FirebaseFirestore.instance.collection("post");
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore ListView'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef
            .where('category', isEqualTo: 1)
            .where('town', isEqualTo: '궁동')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<DocumentSnapshot> postDocs = snapshot.data!.docs;

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
                    itemCount: postDocs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = postDocs[index];
                      Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                      String postId = document.id;
                      String title = data['title'] ?? '';
                      int category = data['category'] ?? '';
                      String detail = data['detail'] ?? '';
                      String image_url = data['image_url'] ?? '';
                      String userid = data['userid'] ?? '';
                      String dead_line = data['dead_line'] ?? '';

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                postId: postId,
                                category: category,
                                detail: detail,
                                image_url: image_url,
                                title: title,
                                userid: userid,
                                dead_line: dead_line,
                                documentId: document.id,
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
                                    Text(
                                      title,
                                      style: TextStyle(fontSize: 23),
                                    ),
                                    SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          dead_line,
                                          style: TextStyle(fontSize: 17),
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

class DetailPage extends StatefulWidget {
  final String postId;
  final int category;
  final String detail;
  final String image_url;
  final String title;
  final String userid;
  final String dead_line;
  final String documentId;

  DetailPage({
    required this.postId,
    required this.category,
    required this.detail,
    required this.image_url,
    required this.title,
    required this.userid,
    required this.dead_line,
    required this.documentId,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  User? _user;

  @override
  Widget build(BuildContext context) {
    TextEditingController _commentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.all(4)),
            Text(
              '${widget.title}',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Image.network(
                widget.image_url,
                width: 380,
                height: 250,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Text(
                '${widget.detail}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                '반납 날짜 : ${widget.dead_line}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 500,
              child: const Divider(color: Colors.yellow, thickness: 2.0),
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
                      stream: FirebaseFirestore.instance
                          .collection('comments_${widget.postId}')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text('로딩 중...');
                        }
                        if (!snapshot.hasData) {
                          return Text('데이터 없음');
                        }

                        List<QueryDocumentSnapshot> commentDocs =
                            snapshot.data!.docs;
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
                            String? userId =
                            commentDocs[index].get('userId') as String?;
                            String username =
                            userId != null ? 'User ID: ${userId.split('@')[0]}' : 'Anonymous';
                            Timestamp timestamp =
                            commentDocs[index].get('timestamp');
                            DateTime commentTime = timestamp.toDate();
                            String timeAgo = timeago.format(commentTime);

                            bool isCurrentUser =
                                _user != null && userId == _user!.email;

                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    username,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    comment,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    timeAgo,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  if (isCurrentUser)
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('comments_${widget.postId}')
                                            .doc(commentDocs[index].id)
                                            .delete();
                                      },
                                    ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        labelText: '댓글 입력',
                        suffixIcon: IconButton(
                          onPressed: () {
                            String comment = _commentController.text.trim();
                            if (comment.isNotEmpty) {
                              FirebaseFirestore.instance
                                  .collection('comments_${widget.postId}')
                                  .add({
                                'comment': comment,
                                'userId': _user?.email,
                                'timestamp': Timestamp.now(),
                              });
                              _commentController.clear();
                            }
                          },
                          icon: Icon(Icons.send),
                        ),
                      ),
                    ),
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
