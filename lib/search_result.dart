import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_clone/colors.dart';

class SearchResult extends StatefulWidget {
  SearchResult({super.key, required this.data});
  List<List<String>> data;
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, right: 15, top: 4),
                    child: Image.network(
                      'https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                    )),
                const SizedBox(width: 27),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: searchColor,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: searchColor,
                    ),
                  ),
                  height: 44,
                  child: TextField(
                    onSubmitted: (text) {

                                            List<List<String>> data=[
                      [
                        'Entry1 ${text}'
                      ],
                       [
                        'Entry2 ${text}'
                       ],
                      [
                        'Entry3 ${text}'
                      ] 
                    ];
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchResult(
                              data:data,
                            ),
                          ),
                        );
                      
                    },
                    style: const TextStyle(fontSize: 16),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 150),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.search,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            child: ListView.builder(
              itemCount: 3 ,
              itemBuilder: (context, index) {
                
                // return Text(widget.data[index][0].toString());
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
