import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search/provider/book_provider.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Widget appBarWidget= Text("AppBar");
Icon searchIcon=Icon(Icons.search);
TextEditingController textController=
TextEditingController();
String searchText="";
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {

    searchText=textController.text;
    super.initState();
  }
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<BookProvider>(context,listen:
        false).getBookList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBarWidget,
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  if(searchIcon.icon==Icons.search){
                    appBarWidget=TextField(
                      onChanged: (val){
                        Provider.of<BookProvider>(context,
                            listen: false).searchText(val);
                      },
                      controller: textController,
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                        hintText: "Type here...",
                        hintStyle: TextStyle(
                          color: Colors.white
                        )
                      ),
                    );
                    searchIcon=Icon(Icons.clear);
                  } else{

                    Provider.of<BookProvider>(context,
                        listen: false).searchText("");
                    appBarWidget=Text("AppBar");
                    searchIcon=Icon(Icons.search);
                  }
                });
              },
              icon: searchIcon)
        ],
      ),
      body: Consumer<BookProvider>(
        builder: (context,bookPro,child){
          return ListView.builder(
            itemCount: bookPro.searchedList.length,
              itemBuilder:
              (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 3
                      )
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(bookPro.searchedList[index].name,
                        style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,
                        ),),
                        Text(bookPro.searchedList[index].author,
                          style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold,
                          ),),
                        Text(bookPro.searchedList[index].price,
                          style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold,
                          ),)
                      ],
                    ),
                  ),
                );
              }
          );
        },
      ) ,
    );
  }
}
