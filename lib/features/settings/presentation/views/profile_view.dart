import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/settings/presentation/widgets/profile_card.dart';

const profileCard = ProfileCard(
  name: "Jane Smith",
  profession: "Software Engineer",
  imageUrl:
      "https://media.istockphoto.com/id/1494508936/es/foto/feliz-emocionado-y-llame-por-tel%C3%A9fono-con-una-mujer-negra-en-el-estudio-para-mensajes-de-texto.jpg?s=2048x2048&w=is&k=20&c=OEIskWFgyI7MNN67gh6zr4227gK9A54C90JNyxCN-Kg=",
);

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi perfil"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          profileCard,
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Informacion Personal"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.go('/settings/profile/personal_information');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
