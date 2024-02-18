import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionA extends StatelessWidget {
  const SectionA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soy la sección A'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Section A',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push('/a/detail');
              },
              child: const Text('Ir al detalle'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push('/profile');
              },
              child: const Text('Ir al editar usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
