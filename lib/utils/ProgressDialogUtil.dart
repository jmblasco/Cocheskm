import 'package:ars_progress_dialog/dialog.dart';
import 'package:flutter/material.dart';

class ProgressDialogUtil {

  static ArsProgressDialog arcProgressDialog(BuildContext context) {
    ArsProgressDialog customProgressDialog = ArsProgressDialog(context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        loadingWidget: Container(
          child: CircularProgressIndicator(),
        ));

    return customProgressDialog;
  }
}
