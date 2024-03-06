import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarView extends StatelessWidget {
  const SidebarView({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      headerDivider: const Divider(),
      headerBuilder: (_, __) => IconButton(
        icon: const Icon(
          Icons.logout,
          textDirection: TextDirection.rtl,
        ),
        onPressed: () => Amplify.Auth.signOut(),
      ),
      showToggleButton: false,
      extendedTheme: const SidebarXTheme(
        itemTextPadding: EdgeInsets.all(8),
        width: 200,
        margin: EdgeInsets.only(right: 10),
      ),
      controller: _controller,
      items: const [
        SidebarXItem(icon: Icons.chat_bubble, label: 'Questionnez vos données'),
        SidebarXItem(icon: Icons.settings, label: 'Paramètres'),
      ],
    );
  }
}
