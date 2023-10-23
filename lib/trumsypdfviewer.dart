// Future<void> generatePDFReport(
//     BuildContext context, PSAReport report, String parentName) async {
//   final pdf = pw.Document();
//   final regularFont = await rootBundle.load("assets/fonts/Lato-Regular.ttf");
//   final boldFont = await rootBundle.load("assets/fonts/Lato-Bold.ttf");
//   final regularTtf = pw.Font.ttf(regularFont.buffer.asByteData());
//   final boldTtf = pw.Font.ttf(boldFont.buffer.asByteData());

//   final imageUint8List =
//       (await rootBundle.load('assets/images/trumsy-logo.png'))
//           .buffer
//           .asUint8List();

//   final traitToResultMap = <String, String>{};

//   for (var i = 0; i < traits.length; i++) {
//     final trait = traits[i];
//     final resultPara = report.reportResultParas?[i] ?? '';
//     traitToResultMap[trait] = resultPara;
//   }

//   final detailedReportMap = <String, String>{};
//   for (var i = 0; i < detailedReportHeaders.length; i++) {
//     final header = detailedReportHeaders[i];
//     final para = report.detailedReportParas?[i] ?? '';
//     detailedReportMap[header] = para;
//   }

//   // Add content to the PDF document
//   pdf.addPage(
//     pw.MultiPage(
//       pageFormat: PdfPageFormat.a4,
//       build: (context) {
//         return [
//           pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Center(
//                 child: pw.Image(
//                   pw.MemoryImage(
//                     imageUint8List,
//                   ),
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                 child: pw.Text(
//                   'Your Parenting Report',
//                   style: pw.TextStyle(
//                     font: boldTtf,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               pw.SizedBox(height: 25),
//               pw.Row(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text(
//                     'Parent Name: ',
//                     style: pw.TextStyle(
//                       font: boldTtf,
//                       fontSize: 17,
//                       fontWeight: pw.FontWeight.bold,
//                     ),
//                   ),
//                   pw.Text(
//                     parentName,
//                     style: pw.TextStyle(
//                       font: regularTtf,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.SizedBox(height: 10),
//               pw.Row(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text(
//                     'Parenting Style: ',
//                     style: pw.TextStyle(
//                         font: boldTtf,
//                         fontSize: 17,
//                         fontWeight: pw.FontWeight.bold),
//                   ),
//                   pw.Text(
//                     '${report.dominatParentingStyle}',
//                     style: pw.TextStyle(font: regularTtf, fontSize: 15),
//                   ),
//                 ],
//               ),
//               pw.SizedBox(height: 20),
//               for (final trait in traits)
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text(
//                       '$trait:',
//                       style: pw.TextStyle(
//                           font: boldTtf,
//                           fontSize: 18,
//                           fontWeight: pw.FontWeight.bold),
//                     ),
//                     pw.SizedBox(height: 10),
//                     pw.Paragraph(
//                       text: traitToResultMap[trait] ?? '',
//                       style: pw.TextStyle(
//                         font: regularTtf,
//                         fontSize: 15,
//                       ),
//                       textAlign: pw.TextAlign.justify,
//                       margin: const pw.EdgeInsets.only(top: 6.0, bottom: 6.0),
//                     ),
//                     pw.SizedBox(height: 10),
//                   ],
//                 ),
//               pw.SizedBox(height: 20),

//               // pw.SizedBox(height: 10),
//               // pw.Text('${report.isDetailedReport}'),
//               if (report.isDetailedReport)
//                 for (final header in detailedReportHeaders)
//                   pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       pw.Text(
//                         header,
//                         style: pw.TextStyle(
//                             font: boldTtf,
//                             fontSize: 18,
//                             fontWeight: pw.FontWeight.bold),
//                       ),
//                       pw.SizedBox(height: 10),
//                       pw.Paragraph(
//                         text: detailedReportMap[header] ?? '',
//                         style: pw.TextStyle(
//                           font: regularTtf,
//                           fontSize: 15,
//                         ),
//                         textAlign: pw.TextAlign.justify,
//                         margin: const pw.EdgeInsets.only(top: 6.0, bottom: 6.0),
//                       ),
//                       pw.SizedBox(height: 15),
//                     ],
//                   ),
//               pw.SizedBox(height: 20),
//               pw.Text(
//                 'Attempt on: ${DateFormat('MMM dd, yyyy').format(
//                   DateTime.parse(report.attemptOn ?? ''),
//                 )}',
//                 style: pw.TextStyle(
//                   font: boldTtf,
//                   fontSize: 15,
//                 ),
//               ),
//               // Add more content here as needed
//             ],
//           ),
//         ];
//       },
//     ),
//   );

//   final directory = await getExternalStorageDirectory();
//   if (directory == null) {
//     // Handle the case where external storage is not available
//     return;
//   }

//   final folderPath = '${directory.path}/Trumsy';
//   final filePath = '$folderPath/PSAreport.pdf';

//   final folder = Directory(folderPath);
//   if (!await folder.exists()) {
//     folder.create(recursive: true);
//   }

//   final file = File(filePath);
//   await file.writeAsBytes(await pdf.save());

//   print('PDF report saved to $filePath');

//   // Open the PDF using a PDF viewer (optional)
//   await OpenFile.open(filePath);
// }
