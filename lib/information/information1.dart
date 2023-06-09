import 'package:flutter/material.dart';
import 'package:project1/information/information2.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  const Information({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  State<StatefulWidget> createState() {
    return _Information();
  }
}

class CrawledData {
  final String title;
  final String period;
  final String url;
  final String imageUrl;

  CrawledData({
    required this.title,
    required this.period,
    required this.url,
    required this.imageUrl,
  });
}
class _Information extends State<Information> {
  List<CrawledData> crawledData = [];

  void crawlWebsite() async {
    try {
      String url =
          'https://www.daejeonyouthportal.kr/biz/businessIntro.do?dpmSectionFst=2&dpmSectionScd=9&commonMenuNo=79_80';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String responseBody = response.body;
        var document = parser.parse(responseBody);

        var infoPosts = document.querySelectorAll('.cont_info');
        var bizPosts = document.querySelectorAll('.bd_thum.type01.type_biz li');

        List<CrawledData> updatedCrawledData = [];

        for (var post in infoPosts) {
          var targetElement = post.querySelector('.cont_tit');
          if (targetElement != null) {
            var target = targetElement.text;
            updatedCrawledData.add(CrawledData(
              title: target,
              period: '',
              url: '',
              imageUrl: '',
            ));
          }
        }

        for (int i = 0; i < bizPosts.length && i < updatedCrawledData.length; ++i) {
          var post = bizPosts[i];
          var urlElement = post.querySelector('a');
          var imageElement = post.querySelector('img');
          if (urlElement != null && imageElement != null) {
            var url = 'https://www.daejeonyouthportal.kr${urlElement.attributes['href']}';
            var imageUrl = 'https://www.daejeonyouthportal.kr${imageElement.attributes['src']}';
            updatedCrawledData[i] = CrawledData(
              title: updatedCrawledData[i].title,
              period: '',
              url: url,
              imageUrl: imageUrl,
            );
          }
        }

        infoPosts = document.querySelectorAll('.cont_etc');
        for (int i = 0; i < infoPosts.length && i < updatedCrawledData.length; ++i) {
          var post = infoPosts[i];
          var bElements = post.querySelectorAll('b');

          for (var bElement in bElements) {
            if (bElement.text == '신청기간') {
              var iElement = bElement.nextElementSibling;
              if (iElement != null && iElement.localName == 'i') {
                var iText = iElement.text;
                var splitText = iText.split('~');
                var lastPart = splitText.last;
                updatedCrawledData[i] = CrawledData(
                  title: updatedCrawledData[i].title,
                  period: lastPart,
                  url: updatedCrawledData[i].url,
                  imageUrl: updatedCrawledData[i].imageUrl,
                );
              }
              break;
            }
          }
        }

        setState(() {
          crawledData = updatedCrawledData;
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void navigateToCrawlingTask(String url, String title, String imageUrl, String applicationalPeriod) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CrawlingTask(
          url: url,
          title: title,
          imageUrl: imageUrl,
          applicationalPeriod: applicationalPeriod,
        ),
      ),
    );
  }

  Widget _getDataTable() {
    return DataTable(
      columnSpacing: 28.0, // 열 간격
      headingRowColor: MaterialStateColor.resolveWith((states) {
        return const Color(0xffFFF0A4);
      }),
      columns: [
        DataColumn(
          label: Text(
            '제목',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            '신청 마감일',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ],
      rows: List.generate(crawledData.length, (index) {
        return DataRow(
          cells: [
            DataCell(
              Center(
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    child: Text(crawledData[index].title, style: TextStyle(fontSize: 16),),
                  ),
                  onTap: () {
                    navigateToCrawlingTask(
                      crawledData[index].url,
                      crawledData[index].title,
                      crawledData[index].imageUrl,
                      crawledData[index].period,
                    );
                  },
                ),
              ),
            ),
            DataCell(
              Center(
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    child: Text(crawledData[index].period, style: TextStyle(fontSize: 15),),
                  ),
                  onTap: () {
                    navigateToCrawlingTask(
                      crawledData[index].url,
                      crawledData[index].title,
                      crawledData[index].imageUrl,
                      crawledData[index].period,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    crawlWebsite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFE072),
        title: Text(
          '자취 지원 정보',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 30, left: 0, right:0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: _getDataTable(),
            ),
          ),
        ),
      ),
    );
  }
}

class CrawlingTask extends StatefulWidget {
  final String url;
  final String title;
  final String imageUrl;
  final String applicationalPeriod;

  const CrawlingTask({
    Key? key,
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.applicationalPeriod,
  }) : super(key: key);

  @override
  _CrawlingTaskState createState() => _CrawlingTaskState();
}
class _CrawlingTaskState extends State<CrawlingTask> {
  List<String> crawledData = [];
  String imageUrl = '';
  String additionalData = '';

  @override
  void initState() {
    super.initState();
    crawlWebsite();
    crawlImage();
    _crawlAdditionalData();
  }


  Future<void> crawlWebsite() async {
    try {
      http.Response response = await http.get(Uri.parse(widget.url));

      if (response.statusCode == 200) {
        String responseBody = response.body;
        var document = parser.parse(responseBody);

        var targetElement1 = document.querySelector('.wrap_governing.type_orange');
        if (targetElement1 != null) {
          //print(targetElement1.outerHtml); // Print target element's HTML
          var liElements = targetElement1.querySelectorAll('li');
          if (liElements.length >= 2) {
            var firstElement = liElements[0].text.trim();
            var secondElement = liElements[1].text.trim();
            crawledData.add(firstElement);
            crawledData.add(secondElement);

          }
        }

        var targetElement2 = document.querySelector('.wrap_governing p');
        if (targetElement2 != null) {
          var text = targetElement2.text.trim();
          crawledData.add(text);
        }

        var targetElement3 = document.querySelector('.wrap_governing.type_black');
        if (targetElement3 != null) {
          var ulElement = targetElement3.querySelector('ul');
          if (ulElement != null) {
            var liElements = ulElement.querySelectorAll('li');
            for (var liElement in liElements) {
              var text = liElement.text.trim();
              crawledData.add(text);
            }
          }
        }
        setState(() {});

      } else {
        print('Error: ${response.statusCode}');
      }

    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> crawlImage() async {
    try {
      http.Response response = await http.get(Uri.parse(widget.imageUrl));

      if (response.statusCode == 200) {
        setState(() {
          imageUrl = widget.imageUrl;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _crawlAdditionalData() async {
    try {
      http.Response response = await http.get(Uri.parse(widget.url));

      if (response.statusCode == 200) {
        String responseBody = response.body;
        var document = parser.parse(responseBody);

        var ulElement = document.querySelector('.bul_type01');
        if (ulElement != null) {
          var liElements = ulElement.querySelectorAll('li');
          for (var liElement in liElements) {
            var text = liElement.text.trim();
            additionalData += '$text\n';
          }
        }
        setState(() {});
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  bool hasNumber(String s) {
    RegExp regExp = RegExp(r'[0-9]');
    return regExp.hasMatch(s);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFE072),
          title: Text(
            '자취 지원 정보',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7),
                if (imageUrl.isNotEmpty) Image.network(imageUrl),
                SizedBox(height: 10),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                for (var data in crawledData)
                  Text(
                    data,
                    style: TextStyle(fontSize: 16),
                  ),
                SizedBox(height: 10),
                Text(
                  additionalData,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  '신청기간: ${widget.applicationalPeriod}${hasNumber(widget.applicationalPeriod) ? ' 까지' : ''}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    launch(widget.url);
                  },
                  child: Text(
                    '바로가기:\n ${widget.url}',
                    style: TextStyle(fontSize: 16, color: Colors.indigo),
                  ),
                ),
              ],
            ),
          ),
        )


    );
  }
}

