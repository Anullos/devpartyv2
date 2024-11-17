import 'package:flutter/material.dart';

class SidebarTablet extends StatelessWidget {
  const SidebarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: FlutterLogo(size: 44),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SizedBox(
              width: 48,
              child: ListView(
                children: [
                  IconTile(
                    isActive: true,
                    iconData: Icons.home,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 4),
                  IconTile(
                    isActive: false,
                    iconData: Icons.person,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 4),
                  IconTile(
                    isActive: false,
                    iconData: Icons.store,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 4),
                  IconTile(
                    isActive: false,
                    iconData: Icons.shopping_cart,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 4),
                  IconTile(
                    isActive: false,
                    iconData: Icons.favorite,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 4),
                  IconTile(
                    isActive: false,
                    iconData: Icons.notifications,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              IconTile(
                isActive: false,
                iconData: Icons.settings,
                onPressed: () {},
              ),
              const SizedBox(
                width: 48,
                child: Divider(thickness: 2),
              ),
              const SizedBox(height: 4),
              IconTile(
                isActive: false,
                iconData: Icons.logout,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
            ],
          )
        ],
      ),
    );
  }
}

class IconTile extends StatefulWidget {
  const IconTile({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.isActive = false,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  State<IconTile> createState() => _IconTileState();
}

class _IconTileState extends State<IconTile> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: widget.isActive
                ? Colors.grey
                : _isHover
                    ? Colors.grey.withOpacity(0.2)
                    : null,
            borderRadius: BorderRadius.circular(8),
            boxShadow: widget.isActive
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ]
                : null),
        child: Icon(
          widget.iconData,
          size: 24,
          color: widget.isActive ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
