import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionB extends StatelessWidget {
  const SectionB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soy la sección B'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Section B',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/counter');
              },
              child: const Text('Ir al Contador'),
            ),
          ],
        ),
      ),
    );
  }
}