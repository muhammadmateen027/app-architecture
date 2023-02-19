import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/provider/launch_detail/launch_detail_provider.dart';
import 'package:stars/provider/launches/launch_item.dart';
import 'package:stars/provider/launches/launches_provider.dart';

class LaunchesListPage extends StatelessWidget {
  const LaunchesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.launchesAppBarTitle),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<LaunchesProvider>(context, listen: false)
                  .refreshLaunches();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
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
                onTap: () {
                  Provider.of<LaunchDetailProvider>(context, listen: false)
                      .getLaunch(provider.launches[index].id);
                  AutoRouter.of(context).pushNamed('/launch-detail-page');
                },
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

  IconData get buildIcon =>
      launchItem.isFavourite ? Icons.favorite : Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CachedNetworkImage(
        imageUrl: launchItem.image,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      trailing: Icon(buildIcon),
      title: Text(launchItem.name),
      titleTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(launchItem.rockedId),
          if (launchItem.dateTime.isPresent)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                launchItem.dateTime.value.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blue,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
