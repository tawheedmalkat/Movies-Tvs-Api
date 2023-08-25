import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Logic/API/Models/showModel.dart';

class ShowScreen extends StatelessWidget {

  final ShowModel model;
  ShowScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: ListView(
        children: [
          InkWell(
            child: Container(
              margin: EdgeInsets.all(Get.width *0.025),
              width: double.infinity,
              height: Get.height*0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.height*0.025),
                color: Colors.grey.withOpacity(0.25),
                image: DecorationImage(
                  image:NetworkImage(model.image),
                  fit: BoxFit.cover
                ),
              ),
            ),
            onTap: () => 
            showDialog(
                context: context,
                builder: (context) =>
                    Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        height: Get.height*0.5,
                        color: Colors.grey.withOpacity(0.25),
                        child: InteractiveViewer(
                          child: Image.network(model.image),
                        ),
                      ),
                    )
            ),
          ),
          ListTile(
            leading: Icon(Icons.title),
            title:  Text('Full title'),
            subtitle:Text(model.fullTitle),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title:  Text('Rating'),
            subtitle:Text('${model.imDbRating} / 10'),
          ),
          ListTile(
            leading: Icon(Icons.insights),
            title:  Text('Global rank'),
            subtitle:Text(model.rank),
          ),
          ListTile(
            leading: Icon(Icons.date_range_outlined),
            title:  Text('Year'),
            subtitle:Text(model.year),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title:  Text('Crew'),
            subtitle:Text(model.crew),
          ),
        ],
      ),
    );
  }
}
