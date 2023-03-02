import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stars/extensions/extensions.dart';
import 'package:stars/pages/pages.dart';

class LaunchesContent extends StatelessWidget {
  const LaunchesContent({
    required this.launches,
    this.onLaunchTapped,
    super.key,
  });

  final Set<LaunchItem> launches;
  final ValueChanged<LaunchItem>? onLaunchTapped;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: launches.length,
      separatorBuilder: (_, index) => const Divider(),
      itemBuilder: (_, index) {
        return _LaunchTile(
          onTap: () => onLaunchTapped?.call(launches.elementAt(index)),
          launchItem: launches.elementAt(index),
        );
      },
    );
  }
}

class _LaunchTile extends StatelessWidget {
  const _LaunchTile({required this.launchItem, this.onTap});

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
      titleTextStyle: context.textTheme.labelLarge?.copyWith(
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
                style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.blue,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
