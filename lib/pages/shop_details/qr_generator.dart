import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:snip_wear/flutter_flow/flutter_flow_theme.dart';

class QRGenerator {
  static Widget generateQR(String shopId, BuildContext context) {
    String url =
        // 'https://www.snipwear/shopDetails?idBotiga=${Uri.encodeFull(shopId)}';
        'snipwear://www.snipwear/shopDetails?idBotiga=${Uri.encodeFull(shopId)}';

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 350,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: QrImageView(
            data: url,
            version: QrVersions.auto,
            gapless: false,
            eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square, color: Colors.black),
            dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
