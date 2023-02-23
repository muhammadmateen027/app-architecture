import 'package:flutter/material.dart';
import 'package:stars/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterView();
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: _CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text('0', style: theme.textTheme.displayLarge);
  }
}

class CounterDetail extends StatelessWidget {
  const CounterDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text('Hello World', style: theme.textTheme.displayLarge);
  }
}
