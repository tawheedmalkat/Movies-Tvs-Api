import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Search/searchTitle.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.movie_creation_outlined),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Movies'),
            subtitle: Text('Top 250 movies in the world'),
            onTap: () => Get.offNamed('/movies'),
          ),
          ListTile(
            leading: Icon(Icons.tv_outlined),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('TVs'),
            subtitle: Text('Top 250 TVs in the world'),
            onTap: () => Get.offNamed('/tvs'),
          ),
          ListTile(
            leading: Icon(Icons.search),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Search'),
            subtitle: Text('Search for movie or TV show'),
            onTap: ()=> showSearch(
                context: context,
                delegate: SearchTitleDelegate()
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Settings'.tr),
            subtitle: Text('Customize the app'),
            onTap: ()=> Get.toNamed('/settings'),
          ),
        ],
      ),
    );
  }
}
