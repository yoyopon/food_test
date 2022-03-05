import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CategoryList extends StatefulWidget {
  const CategoryList({ Key? key }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  String defaultId = "9EIX9EJ2AxWhmLLcDdhD";
  Future<QuerySnapshot<Map<String,dynamic>>>   categoryProducts = FirebaseFirestore.instance.collection("products").where("category",isEqualTo: "9EIX9EJ2AxWhmLLcDdhD").get();

  @override
  Widget build(BuildContext context) {

   Stream<QuerySnapshot>categories = FirebaseFirestore.instance.collection("categories").snapshots();
    return Column(children: [
      StreamBuilder<QuerySnapshot>(
        stream: categories,
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshots){
          return Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshots.data!.docs.length,
              itemBuilder: (context,index){
                //print(snapshots.data!.docs.length);
                return InkWell(child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("${snapshots.data!.docs[index]['name']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                 ),);
              }),
          );
        }),
        SingleChildScrollView(
          child: FutureBuilder(
            future: categoryProducts,
            builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
              return Container(height: 220,
              color: Colors.amber,
              child:
               ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }else{
                    return Text("${snapshot.data!.toString()}");
                  }
                 // return Text("${snapshot.data!.docs[index]['name']}");
                }),);
            },),
          )
        
    ],);
  }
}