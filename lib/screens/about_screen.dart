import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  // Helper to launch URLs
  void _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Could not open the link.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'WanderMate',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Developer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 28),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Developer photo
                      CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage(
                          'assets/images/nishtha-photo.jpg',
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Nishtha Jain',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '614nishtha@gmail.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Contact: +91 9379448800',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap:
                            () => _launchUrl(
                              context,
                              'https://www.linkedin.com/in/nishthaj14',
                            ),
                        child: Text(
                          'LinkedIn: www.linkedin.com/in/nishthaj14',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue[800],
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap:
                            () => _launchUrl(
                              context,
                              'https://github.com/Nishthajain14',
                            ),
                        child: Text(
                          'GitHub: https://github.com/Nishthajain14',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue[800],
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
