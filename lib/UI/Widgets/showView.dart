import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv/Logic/API/Models/showModel.dart';
import 'package:my_tv/UI/Screens/ShowScreen.dart';

class ShowView extends StatelessWidget {

  final ShowModel model;
  ShowView(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.to(ShowScreen(model)),
      child: Container(
        margin: EdgeInsets.all(Get.width*0.02),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(model.image),
            fit: BoxFit.cover
          ),
          color: Colors.grey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(Get.width*0.025)
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent,Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(Get.width*0.025)
              )
          ),
          child: ListTile(
            textColor: Colors.white,
            title: Text(model.title),
            subtitle: Row(
              children: [
                Icon(Icons.star,color: Colors.amber,),
                Text('${model.imDbRating}/10'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
