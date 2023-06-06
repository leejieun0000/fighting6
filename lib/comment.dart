import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String colPath = "catInfo/$catName/comments";
var querySnapshot = await FirebaseFirestore.instance
    .collection(colPath)
    .orderBy("when", descending: false)
    .get();
for (var document in querySnapshot.docs) {
String docID = document.id;
String who = "?";
String what = "?";
String when = "?";
String commentUID = "?";

if (document.data().containsKey('who')) {
who = document['who'].toString();
}
if (document.data().containsKey('what')) {
what = document['what'].toString();
}
if (document.data().containsKey('when')) {
when = document['when'].toString();
}
if (document.data().containsKey('uid')) {
commentUID = document['uid'].toString();
}

if (commentUID == uid) {
createComment(who, what, when, 1, docID);
} else {
createComment(who, what, when, 0, "");
}
}

void createComment(String who, String what, String when, int isMyComment, String docID) {
var commentBox = Column(
children: [
createTextView(who, 1, isMyComment),
createTextView(what, 2, isMyComment),
createTextView(when, 3, isMyComment),
],
);
commentBox.key = Key(docID);

if (isMyComment == 1) {
commentBox = GestureDetector(
onTap: () {
print("ClickedMyComment $docID");

showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text("댓글을 지우시겠습니까?"),
actions: [
TextButton(
onPressed: () {
print("ClickedMyComment 확인");
FirebaseFirestore.instance
    .collection("catInfo/$catName/comments")
    .doc(docID)
    .delete()
    .then((value) {
print("DocumentSnapshot successfully deleted!");
setState(() {
commentBox.visible = false;
});
})
    .catchError((error) {
print("Error deleting document: $error");
});
},
child: Text("확인"),
),
TextButton(
onPressed: () {
print("ClickedMyComment 취소");
},
child: Text("취소"),
),
],
);
},
);
},
child: commentBox,
);
}

setState(() {
LL_comments.addChild(commentBox);
});
}

AlertDialog alertDialog = AlertDialog(
title: Text("댓글을 지우시겠습니까?"),
actions: [
TextButton(
onPressed: () {
print("ClickedMyComment 확인");
FirebaseFirestore.instance
    .collection("catInfo/$catName/comments")
    .doc(docID)
    .delete()
    .then((value) {
print("DocumentSnapshot successfully deleted!");
commentBox.visible = false;
})
    .catchError((error) {
print("Error deleting document: $error");
});
},
child: Text("확인"),
),
TextButton(
onPressed: () {
print("ClickedMyComment 취소");
},
child: Text("취소"),
),
],
);

showDialog(
context: context,
builder: (BuildContext context) {
return alertDialog;
},
);

FirebaseFirestore.instance.doc(documentPath).delete();
AlertDialog.Builder builder = AlertDialog.Builder(context);
builder.setTitle("댓글을 지우시겠습니까?");
