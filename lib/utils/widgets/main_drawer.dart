import 'package:flutter/material.dart';
import 'package:test_project/utils/colors.dart';

List<String> _titleList = [
  "Profile",
  "Favorite",
  "Settings",
];
List<Icon> _leadingList = [
  Icon(Icons.account_circle_rounded, color: Colors.grey[700], size: 28),
  Icon(Icons.favorite, color: Colors.grey[700], size: 28),
  Icon(Icons.settings, color: Colors.grey[700], size: 28),
];

Widget mainDrawer(BuildContext? context, Function logout) {
  return Drawer(
    backgroundColor: AppColors.iconColor,
    child: Column(
      children: [
        DrawerHeader(
              margin: EdgeInsets.zero,
              child: Image.asset('assets/Logo.png', height: 60, width: 236)
          ),
        const Divider(
          color: Color(0xFF757575),
          height: 3,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: _titleList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                minLeadingWidth: 20,
                contentPadding: const EdgeInsets.only(left: 10),
                title: Text(_titleList[index],
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                leading: _leadingList[index],
                onTap: () {
                  ///TODO:
                  'onTap';
                },
              );
            },
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ListTile(
              minLeadingWidth: 20,
              contentPadding: const EdgeInsets.only(left: 10),
              title: Text('Logout',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              leading: Icon(Icons.logout_sharp, color: Colors.grey[700],),
              onTap: () {
                logout();
                ///TODO:
                'onTap';
              },
            ),
          ),
        ),
      ],
    ),
  );
}