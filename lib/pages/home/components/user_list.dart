import 'package:flow_admin_panel/components/custom_card.dart';
import 'package:flow_admin_panel/config/theme.dart';
import 'package:flow_admin_panel/data/model/user.dart';
import 'package:flow_admin_panel/pages/home/components/user_list_item.dart';
import 'package:flow_admin_panel/pages/home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeUserList extends StatelessWidget {
  const HomeUserList({super.key});

  final String header1 = "My Users";
  final String header2 = "Member Name";
  final String header3 = "Status";

  @override
  Widget build(BuildContext context) {

    final users = [
      AppUser(id: 1, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp5756323.jpg",),
      AppUser(id: 2, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp6146695.jpg",),
      AppUser(id: 3, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp5558867.jpg",),
      AppUser(id: 4, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp6181731.jpg",),
      AppUser(id: 1, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp5756323.jpg",),
      AppUser(id: 2, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp6146695.jpg",),
      AppUser(id: 3, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp5558867.jpg",),
      AppUser(id: 4, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp6181731.jpg",),
      AppUser(id: 1, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp5756323.jpg",),
      AppUser(id: 2, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp6146695.jpg",),
      AppUser(id: 3, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp5558867.jpg",),
      AppUser(id: 4, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp6181731.jpg",),
      AppUser(id: 1, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp5756323.jpg",),
      AppUser(id: 2, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp6146695.jpg",),
      AppUser(id: 3, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp5558867.jpg",),
      AppUser(id: 4, name: "name", email: "email", status: "Active", pictureUrl: "https://wallpapercave.com/wp/wp6181731.jpg",),
    ];

    final AppTheme provider = Provider.of<AppTheme>(context);
    final Color textColor = provider.isLightMode ? Colors.black : Colors.white;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: CustomCard(
        isPaddingEnabled: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  header1,
                  style: headerTextStyle.copyWith(color: textColor),
                ),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        header2,
                        style: secondaryTextStyle.copyWith(color: textColor),
                      ),
                    ),Text(
                      header3,
                      style: secondaryTextStyle.copyWith(color: textColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              SizedBox(
                height: users.length > 4 ? 300 : users.length * 75,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    primary: true,
                    itemCount: users.length,
                    itemBuilder: (context, i) => HomeUserListItem(appUser: users[i]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
