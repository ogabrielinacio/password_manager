import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final bool isfirst;
  final bool showConfirmDialog;

  const CustomAppBar({
    Key? key,
    required this.appBar,
    required this.title,
    this.isfirst = false,
    this.showConfirmDialog = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Sizer(
      builder: (context, orientation, deviceType) {
        return AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 5.6.h,
            ),
            textAlign: TextAlign.center,
          ),
          leading: BackButton(
            color: colorScheme.onSurface,
          ),
          actions: isfirst
              ? []
              : [
                  Container(
                    width: 90.w,
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      iconSize: 40.w,
                      icon: Icon(
                        Icons.cancel,
                        color: colorScheme.onSurface,
                      ),
                      onPressed: () {
                      },
                    ),
                  ),
                ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
