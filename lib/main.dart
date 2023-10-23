import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Report Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Report Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await generatePDFReport(context);
              },
              child: Text('Download PDF'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> generatePDFReport(BuildContext context) async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Center(
          child: pw.Text(
            "Your PDF Report Content",
          ),
        );
      },
    ),
  );

  final directory = await getExternalStorageDirectory();
  if (directory == null) {
    // Handle the case where external storage is not available
    return;
  }

  final folderPath = '${directory.path}/pdfDownload';
  final filePath = '$folderPath/report.pdf';

  final folder = Directory(folderPath);
  if (!await folder.exists()) {
    folder.create(recursive: true);
  }

  final file = File(filePath);
  await file.writeAsBytes(await pdf.save());

  print('PDF report saved to $filePath');

  // Open the PDF using a PDF viewer (optional)
  await OpenFile.open(filePath);
}
