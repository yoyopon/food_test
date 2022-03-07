import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String defaultId = "9EIX9EJ2AxWhmLLcDdhD";
  List<dynamic> productList = [];
  bool loading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('Product');
    QuerySnapshot querySnapshot = await _collectionRef
        .where("category", isEqualTo: "9EIX9EJ2AxWhmLLcDdhD")
        .get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
      productList = allData;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> categories =
        FirebaseFirestore.instance.collection("categories").snapshots();
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: categories,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
              if (snapshots.hasData) {
                return Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      //print(snapshots.data!.docs.length);
                      return InkWell(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "${snapshots.data!.docs[index]['name']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              if (snapshots.hasError) {
                return Center(
                  child: Text(
                    snapshots.error.toString(),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
        SingleChildScrollView(
          child: Container(
            height: 220,
            color: Colors.amber,
            child: loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          icon: Image.network(
                            productList[index]["img"] ??
                                "https://www.dictionary.com/e/wp-content/uploads/2018/07/bazinga-2-300x300.jpg",
                          ),
                          onPressed: () {},
                        ),
                        title: Text(
                          productList[index]['name'] ??
                              "no name" + "," + productList[index]['shop'] ??
                              "no shop",
                        ),
                        subtitle: Text(
                          productList[index]['description'] ??
                              "no description" +
                                  "," +
                                  productList[index]['price'] ??
                              "no price",
                        ),
                      );
                      // return Text("${snapshot.data!.docs[index]['name']}");
                    },
                  ),
          ),
        )
      ],
    );
  }
}
