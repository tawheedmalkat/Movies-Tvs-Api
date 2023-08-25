import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv/Logic/API/Controllers/SearchController.dart';
import 'package:my_tv/Logic/API/Models/searchModel.dart';

class SearchTitleDelegate extends SearchDelegate{


  @override
  Widget buildSuggestions(BuildContext context) {
    //if(query.isEmpty)
      return Container();
    // return FutureBuilder<List<SearchModel>>(
    //     future: SearchController.searchTitle(query),
    //     builder: (context,snapShot){
    //       if(snapShot.hasData)
    //         return ListView.builder(
    //             itemCount: snapShot.data!.length,
    //             itemBuilder: (context,i) =>
    //                 ListTile(
    //                   title: Text(snapShot.data![i].title),
    //                 )
    //         );
    //       if(snapShot.hasError)
    //         return Center(
    //           child: Text('Error : ${snapShot.error}'),
    //         );
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    // );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query = '';
          },
          icon: Icon(Icons.delete_forever)
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.close)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<SearchModel>>(
        future: SearchController.searchTitle(query),
        builder: (context,snapShot){
          if(snapShot.hasData)
            return ListView.builder(
                itemCount: snapShot.data!.length,
                itemBuilder: (context,i) =>
                    ListTile(
                      title: Text(snapShot.data![i].title),
                      subtitle: Text(snapShot.data![i].description),
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(snapShot.data![i].image),
                      ),
                    )
            );
          if(snapShot.hasError)
            return Center(
              child: Text('Error : ${snapShot.error}'),
            );
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }

}