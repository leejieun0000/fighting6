import 'package:flutter/material.dart';

// void main(){
//   runApp(const ItemList());
// }

class ItemList extends StatelessWidget {
  // const ItemList({Key? key}) : super(key: key);

  const ItemList({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  Widget build(BuildContext context){
    return ListView.separated(
      separatorBuilder: (context, index){
        return Divider(
          height: 15,
          thickness: 1,
          color: Colors.grey[200],
          indent: 5,
          endIndent: 5,
        );
      },
      padding: EdgeInsets.all(16),
        itemBuilder: (context, index){
          return const SizedBox(
            height: 100,
            child: Row(
              children: [
                Image(
                  image: AssetImage('images/ganjang.png',
                  ),
                ),
                SizedBox(width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("간장 빌려달라는 제목입니당"),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: [
                                Text("날짜 입니당"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      itemCount: 10,
    );
  }
}