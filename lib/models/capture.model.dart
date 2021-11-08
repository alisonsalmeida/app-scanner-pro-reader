import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

enum IconFlash {
  enabled,
  disabled,
}

extension IconFlashExtension on IconFlash {
  String get icon {
    if (this == IconFlash.enabled) {
      return 'assets/flash_enabled.svg';
    } else {
      return 'assets/flash_disabled.svg';
    }
  }
}

enum IconScanMode {
  QR,
  BAR_CODE,
}

extension IconScanModeExtension on IconScanMode {
  String get icon {
    if (this == IconScanMode.QR) {
      return 'assets/scan_mode_qr_code.svg';
    } else {
      return 'assets/scan_mode_bar_code.svg';
    }
  }
}

enum ColorUploadIcon {
  pressed,
  unpressed,
}

extension ColorUploadIconExtension on ColorUploadIcon {
  Color get color {
    if (this == ColorUploadIcon.pressed) {
      return Color(0xFF0000FF);
    } else {
      return Color(0xFFC3C3C3);
    }
  }
}

class CaptureModel {
  bool flash;
  String pathIconFlash;
  ScanMode scanMode;
  String pathIconScanMode;
  String code;
  String image;
  Color colorUploadIcon;
  bool captured;

  CaptureModel({
    this.flash = false,
    this.scanMode = ScanMode.BARCODE,
    this.pathIconScanMode = '',
    this.code = '',
    this.image = '',
    this.pathIconFlash = '',
    this.colorUploadIcon = const Color(0xFF000000),
    this.captured = false,
  }) {
    IconFlash iconFlash = IconFlash.disabled;
    this.pathIconFlash = iconFlash.icon;

    IconScanMode iconScanMode = IconScanMode.BAR_CODE;
    this.pathIconScanMode = iconScanMode.icon;

    this.code = '_______________';

    ColorUploadIcon colorUploadIcon = ColorUploadIcon.unpressed;
    this.colorUploadIcon = colorUploadIcon.color;
  }
}
