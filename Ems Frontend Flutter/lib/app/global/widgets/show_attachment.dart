import 'package:adnems/app/data/models/attachment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

showAttachment(Attachment attachment) {
  if (attachment.attachmentType.toLowerCase() == 'jpg' ||
      attachment.attachmentType.toLowerCase() == 'jpeg' ||
      attachment.attachmentType.toLowerCase() == 'png') {
    Get.dialog(
      AlertDialog(
        content: Center(
          child: Image.network(
            attachment.attachmentUrl,
          ),
        ),
      ),
      name: 'photoview',
    );
  } else {
    Get.dialog(
      AlertDialog(
        content: SizedBox(
          width: Get.width * 0.9,
          child: SfPdfViewer.network(
            attachment.attachmentUrl,
            onDocumentLoadFailed: (details) => Center(
              child: Text(
                details.description,
              ),
            ),
          ),
        ),
      ),
      name: 'fileview',
    );
  }
}
