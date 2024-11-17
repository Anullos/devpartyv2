import 'package:dev_party_v2/body.dart';
import 'package:flutter/material.dart';

import 'responsive.dart';
import 'sidebar.dart';
import 'sidebar_tablet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Responsive.isMobile(context) ? const Sidebar() : null,
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: const Text('Flutter Demo'),
            )
          : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context)) const Sidebar(),
          if (Responsive.isTablet(context)) const SidebarTablet(),
          const Expanded(
            child: Body(),
          ),
        ],
      ),
    );
  }
}
