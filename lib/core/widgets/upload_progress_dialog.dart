// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:portfolio/core/services/services.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/scaffold_messenger.dart';
import 'package:flutter/material.dart';

class UploadProgressDialog extends StatefulWidget {
  final String destination;
  final File file;

  const UploadProgressDialog({
    super.key,
    required this.destination,
    required this.file,
  });

  @override
  State<UploadProgressDialog> createState() => UploadProgressDialogState();
}

class UploadProgressDialogState extends State<UploadProgressDialog> {
  double _progress = 0.0;
  bool _isUploading = true;

  @override
  void initState() {
    super.initState();
    _startUpload();
  }

  Future<void> _startUpload() async {
    try {
      await uploadFileV2(
        destination: widget.destination,
        file: widget.file,
        onProgress: (progress) {
          setState(() => _progress = progress);
        },
      );

      setState(() => _isUploading = false);
      await Future.delayed(const Duration(seconds: 1));
      if (GoRouter.of(context).canPop()) {
        context.pop();
      }
    } catch (e) {
      if (GoRouter.of(context).canPop()) {
        context.pop();
      }
      scaffoldMessengerAlert(context, "Upload échoué");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlurContainer(
      child: AlertDialog(
        title: Text(
          _isUploading ? "Uploading ..." : "Upload terminé !",
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(
              value: _progress,
              minHeight: 5,
            ),
            const SizedBox(height: 16),
            Text("${(_progress * 100).toStringAsFixed(0)}%"),
          ],
        ),
        /*
        actions: [
          if (_isUploading)
            TextButton(
              onPressed: () {
                if (GoRouter.of(context).canPop()) {
                        context.pop();
                      }
              },
              child: const Text("Annuler"),
            ),
        ],
        */
      ),
    );
  }
}
