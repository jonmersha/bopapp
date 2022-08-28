import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PDF extends StatefulWidget {
  String? url;
  PDF(this.url);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<PDF> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      SfPdfViewer.network(
        widget.url.toString(),
        key: _pdfViewerKey,
    );
  }
}