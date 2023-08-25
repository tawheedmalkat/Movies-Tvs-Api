import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv/Logic/API/Controllers/showController.dart';
import 'package:my_tv/UI/Screens/Settings.dart';
import 'package:my_tv/UI/Widgets/showView.dart';

import '../../Logic/API/Models/showModel.dart';
import '../Widgets/myDrawer.dart';


class MoviesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Top Movies'),
      ),
      body: FutureBuilder<List<ShowModel>>(
        future: ShowController.getTop250Movies(),
        builder: (context,snapShot){
          if(snapShot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemCount: snapShot.data!.length,
                itemBuilder: (context,i)=>
                    ShowView(snapShot.data![i])
            );
          }
          if(snapShot.hasError) {
            return Center(child: Text('error : ${snapShot.error}'));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }


}