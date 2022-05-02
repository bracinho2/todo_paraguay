import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

bool isSwitched = false;

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            accountName: const Text('Todo Paraguay'),
            accountEmail: const Text('contacto@todoparaguay.io'),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(50), // Image border
              child: Image.network(
                'https://img.olx.com.br/images/88/883292515784593.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.circleUser),
            title: Text('Usuario'),
            onTap: () {
              setState(() {});
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.userGear,
              size: 20,
            ),
            title: const Text("Cadastro de usuário"),
            onTap: () {
              setState(() {});
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Sair"),
            onTap: () {
              setState(() {});
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text('Trabalhar offline'),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) async {
              if (isSwitched) {
                print('Trabalhar Online');
              } else {
                print('Trabalhar Offline');
              }
              setState(() {
                isSwitched = value;
              });
            },
            // activeTrackColor: AppColors.cinzaFraco,
            // activeColor: AppColors.preto,
          ),
        ],
      ),
    );
  }
}
