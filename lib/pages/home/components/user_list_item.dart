import 'package:flow_admin_panel/components/cached_image.dart';
import 'package:flow_admin_panel/config/theme.dart';
import 'package:flow_admin_panel/data/model/user.dart';
import 'package:flow_admin_panel/pages/home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeUserListItem extends StatelessWidget {
  const HomeUserListItem({super.key, required this.appUser});

  final AppUser appUser;

  @override
  Widget build(BuildContext context) {
    final AppTheme provider = Provider.of<AppTheme>(context);
    final Color textColor = provider.isLightMode ? Colors.black : Colors.white;
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).cardColor,
                    ),
                    child: appUser.pictureUrl != null
                        ? Center(
                          child: CachedImage(
                              imageUrl: appUser.pictureUrl!,
                              width: 60,
                              height: 60,
                            ),
                        )
                        : const SizedBox(),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appUser.name,
                        style: namingTextStyle.copyWith(
                          color: textColor,
                        ),
                      ),
                      Text(
                        appUser.name,
                        style: secondaryTextStyle.copyWith(
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    appUser.status,
                    style: secondaryTextStyle.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
