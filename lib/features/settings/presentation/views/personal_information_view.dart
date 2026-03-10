import 'package:flutter/material.dart';
import 'package:mobile_banking_app/features/settings/domain/models/profile_card_model.dart';

class PersonalInformationView extends StatelessWidget {
  final ProfileCard profile;

  const PersonalInformationView({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Información personal"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(profile.imageUrl),
            ),
            const SizedBox(height: 10),
            Text(
              profile.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              profile.profession,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _infoTile(
              icon: Icons.person_outline,
              title: "Full Name",
              value: profile.name,
            ),
            _infoTile(
              icon: Icons.email_outlined,
              title: "Email Address",
              value: profile.email,
            ),
            _infoTile(
              icon: Icons.phone_outlined,
              title: "Phone Number",
              value: profile.phone,
            ),
            const SizedBox(height: 20),
            const Text(
              "Birth Date",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${profile.birthDay}"),
                Text(profile.birthMonth),
                Text("${profile.birthYear}"),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              "Joined ${profile.joinedDate}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.grey),
          title: Text(
            title,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        )
      ],
    );
  }
}
