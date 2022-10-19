import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/search_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController search;
  @override
  void initState() {
    // TODO: implement initState
    search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.34,
          child: const DefaultTabController(
            length: 2,
            child: TabBar(
              labelColor: blueColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: blueColor,
              tabs: [
                Tab(text: 'ALL'),
                Tab(text: 'IMAGES'),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                      controller: search,
                      keyboardType: TextInputType.text,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: searchBorder),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      onFieldSubmitted: (val) {
                        List<List<String>> data = [
                          ['Entry1 ${search.text}'],
                          ['Entry2 ${search.text}'],
                          ['Entry3 ${search.text}']
                        ];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchResult(data: data)),
                        );
                      }),
                ),
              ),
              MaterialButton(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 18,
                ),
                color: searchColor,
                onPressed: () {
                  var data = [
                    ['Entry1 ${search.text}'],
                    ['Entry2 ${search.text}'],
                    ['Entry3 ${search.text}']
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchResult(data: data)),
                  );
                },
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
      ),
    );
  }
}
