import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class PdfPreview extends StatefulWidget {
  const PdfPreview({super.key});

  @override
  State<PdfPreview> createState() => _PdfPreviewState();
}

class _PdfPreviewState extends State<PdfPreview> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pdfrx example'),
        ),
        body: PdfViewer.asset('assets/document.pdf'),
      ),
    );
  }
}
