import 'package:dev_party_v2/responsive.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Responsive.isMobile(context)
          ? ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                color: Colors.grey[300],
                child: ListTile(
                  title: Text('Item ${index + 1}'),
                  onTap: () {},
                ),
              ),
            )
          : GridView.count(
              crossAxisCount: Responsive.isDesktop(context) ? 5 : 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(
                20,
                (index) => Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Text('Item ${index + 1}'),
                  ),
                ),
              ),
            ),
    );
  }
}
