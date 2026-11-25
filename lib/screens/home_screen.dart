import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This page is protected by auth.'),
            Text('Current user is: ${authProvider.userName ?? '...'}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authProvider.logout();
                if (context.mounted) Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}