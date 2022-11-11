import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:solgis/projects/people/domain/utils/get_result_scanner.dart';

scanningInfinity(BuildContext context)async{

  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
    "#ff6666", 
    'Cancelar', 
    false, 
    ScanMode.BARCODE
  );
  // ignore: use_build_context_synchronously
  getResultScanner(context,barcodeScanRes);
}