import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv/Logic/API/Controllers/showController.dart';
import 'package:my_tv/UI/Screens/Settings.dart';
import 'package:my_tv/UI/Widgets/showView.dart';

import '../../Logic/API/Models/showModel.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      backgroundColor: Colors.red,
      ),
       body: FutureBuilder<List<ShowModel>>(
        future: ShowController.getTop250Movies(),
         builder: (context,snapShot){
         if(snapShot.hasData)
           return ListView.builder(
                itemCount: snapShot.data!.length,
               itemBuilder: (context,i)=>
                   ShowView(snapShot.data![i])
            );
          if(snapShot.hasError)
            return Text('error : ${snapShot.error}');
          return Center(
            child: CircularProgressIndicator(),
          );
         },
       ),
     // body: GridView.builder(
       //   itemCount: 10,
        //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //    crossAxisCount: 2,
        //    mainAxisSpacing: 10,
         //   crossAxisSpacing: 10,
          //  childAspectRatio: 0.675
         // ),
         // itemBuilder: (context,i)=>
         //     Container(color: Colors.red,)
     // ),
    );
  }


}