import 'package:url_launcher/url_launcher.dart';
import 'app_data.dart';

class LaunchUtils {
  LaunchUtils._();

  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<void> openEmail({String? subject, String? body}) async {
    final uri = Uri(
      scheme: 'mailto',
      path: AppData.email,
      query: _encodeQueryParameters({
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      }),
    );
    await launchUrl(uri);
  }

  static Future<void> openWhatsApp() async {
    await openUrl('https://wa.me/${AppData.whatsappNumber}');
  }

  static String _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
