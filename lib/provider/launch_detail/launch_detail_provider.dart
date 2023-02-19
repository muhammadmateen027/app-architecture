import 'package:flutter/foundation.dart';
import 'package:helper_options/helper_options.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/dio/api.dart';
import 'package:stars/api/dto/dtos.dart';
import 'package:stars/api/exception/low_priority.dart';
import 'package:stars/provider/extension/string_extension.dart';
import 'package:stars/provider/launch_detail/launch_detail.dart';
import 'package:url_launcher/url_launcher.dart';

part 'launch_detail_converter.dart';

class LaunchDetailProvider extends ChangeNotifier {
  LaunchDetailProvider(this.api);

  final Api api;

  late Option<LaunchDetail> launchDetail;

  Future<void> getLaunch(String id) async {
    launchDetail = Option.empty();
    notifyListeners();
    try {
      final launchDetailDto = await api.getLaunch(id);

      launchDetail = Option.of(
        const LaunchDetailConverter().convert(launchDetailDto),
      );
      notifyListeners();
    } on Exception {
      notifyListeners();
    }
  }

  Future<void> launchWebPage(String url) async {
    final uri = url.toUri;
    if (await canLaunchUrl(uri)) {
      throw const LowPriorityException();
    }

    try {
      await launchUrl(uri);
    } catch (e) {
      throw const LowPriorityException();
    }
  }
}
