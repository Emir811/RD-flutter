import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white, 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), 
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(context, CupertinoIcons.home, "/home"),
          _buildIcon(context, CupertinoIcons.search, "/search"),
          _buildCenterButton(context), 
          _buildIcon(context, Icons.history, "/history"),
          _buildIcon(context, CupertinoIcons.person, "/profile"),
        ],
      ),
    );
  }

  
  Widget _buildIcon(BuildContext context, IconData icon, String route) {
    return IconButton(
      onPressed: () => context.go(route),
      icon: Icon(icon, size: 30, color: Colors.black54),
    );
  }

  Widget _buildCenterButton(BuildContext context) {
    return InkWell(
      onTap: () => context.go("/voice"),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.purple, 
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(Icons.add, size: 35, color: Colors.white),
      ),
    );
  }
}
