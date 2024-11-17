import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    MenuTile(
                      title: 'Home',
                      isActive: true,
                      iconData: Icons.home,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 4),
                    MenuTile(
                      title: 'Profile',
                      isActive: false,
                      iconData: Icons.person,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 4),
                    MenuTile(
                      title: 'Store',
                      isActive: false,
                      iconData: Icons.store,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 4),
                    MenuTile(
                      title: 'Cart',
                      isActive: false,
                      iconData: Icons.shopping_cart,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 4),
                    MenuTile(
                      title: 'Favorites',
                      isActive: false,
                      iconData: Icons.favorite,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 4),
                    MenuTile(
                      title: 'Notifications',
                      isActive: false,
                      iconData: Icons.notifications,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MenuTile(
                  title: 'Settings',
                  isActive: false,
                  iconData: Icons.settings,
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 48,
                  child: Divider(thickness: 2),
                ),
                const SizedBox(height: 4),
                MenuTile(
                  title: 'Logout',
                  isActive: false,
                  iconData: Icons.logout,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MenuTile extends StatefulWidget {
  const MenuTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.onPressed,
    this.isActive = false,
  });

  final String title;
  final IconData iconData;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  State<MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> {
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
        child: ListTile(
          leading: Icon(
            widget.iconData,
            size: 24,
            color: widget.isActive ? Colors.black : Colors.grey,
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: widget.isActive ? Colors.black : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
