import 'package:flutter/material.dart';

class BottonBarWidget extends StatelessWidget {
  final VoidCallback? exit;
  final VoidCallback? home;
  const BottonBarWidget({
    Key? key,
    this.exit,
    this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: home,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.home,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
            ),
          ),
          IconButton(
            onPressed: exit,
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedItemColor,
            ),
          ),
        ],
      ),
    );
  }
}
