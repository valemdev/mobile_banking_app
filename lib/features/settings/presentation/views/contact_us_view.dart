import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contáctanos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "¿Tienes alguna pregunta o necesitas ayuda? ¡Estamos aquí para ayudarte!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Correo electrónico"),
              subtitle: const Text("soporte@banco.com"),
              onTap: () {
                // Aquí podrías abrir el cliente de correo o copiar el correo al portapapeles
              },
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Teléfono"),
              subtitle: const Text("+502 1234 5678"),
              onTap: () {
                // Aquí podrías iniciar una llamada telefónica
              },
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text("Chat por WhatsApp"),
              subtitle: const Text("Disponible de 9am a 6pm"),
              onTap: () {
                // Aquí podrías abrir una ventana de chat o redirigir a una página de soporte
              },
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
