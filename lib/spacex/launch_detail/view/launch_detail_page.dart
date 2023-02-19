import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/provider/launch_detail/launch_detail.dart';
import 'package:stars/provider/launch_detail/launch_detail_provider.dart';
import 'package:stars/provider/launches/launches_provider.dart';

class LaunchDetailPage extends StatelessWidget {
  const LaunchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.launchDetailAppBarTitle),
      ),
      body: Consumer<LaunchDetailProvider>(
        builder: (_, provider, widget) {
          if (!provider.launchDetail.isPresent) {
            return const CircularProgressIndicator();
          }

          return _LaunchDetailContent(
            launchDetail: provider.launchDetail.value,
          );
        },
      ),
    );
  }
}

class _LaunchDetailContent extends StatelessWidget {
  const _LaunchDetailContent({required this.launchDetail, super.key});

  final LaunchDetail launchDetail;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LaunchDetailProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 100,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: launchDetail.image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const Divider(),
            Text(
              launchDetail.name,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              launchDetail.description,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'RocketId: ${launchDetail.rockedId}',
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await provider.launchWebPage(launchDetail.link.youtube);
                  },
                  icon: const Icon(Icons.play_circle),
                ),
                IconButton(
                  onPressed: () async {
                    await provider.launchWebPage(launchDetail.link.wikipedia);
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {
                    await provider.launchWebPage(launchDetail.link.article);
                  },
                  icon: const Icon(Icons.article),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: IconButton(
                onPressed: () {
                  Provider.of<LaunchesProvider>(context, listen: false)
                      .setFavourite(launchDetail.id);
                },
                icon: const Icon(Icons.favorite_border),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension Style on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}
