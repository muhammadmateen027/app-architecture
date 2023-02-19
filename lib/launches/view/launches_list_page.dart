import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/provider/launches/launch_item.dart';
import 'package:stars/provider/launches/launches_provider.dart';

class LaunchesListPage extends StatelessWidget {
  const LaunchesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Consumer<LaunchesProvider>(
        builder: (context, provider, widget) {
          if (provider.hasEmptyLaunches) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            itemCount: provider.launches.length,
            separatorBuilder: (_, index) => const Divider(),
            itemBuilder: (_, index) {
              return _LaunchTile(
                onTap: () {},
                launchItem: provider.launches[index],
              );
            },
          );
        },
      ),
    );
  }
}

class _LaunchTile extends StatelessWidget {
  const _LaunchTile({required this.launchItem, this.onTap, super.key});

  final LaunchItem launchItem;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CachedNetworkImage(
        imageUrl: launchItem.image,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      title: Text(launchItem.name),
      subtitle: Text(launchItem.rockedId),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<LaunchesProvider>(context, listen: false)
                  .getListWork();
            },
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

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text('0', style: theme.textTheme.displayLarge);
  }
}
