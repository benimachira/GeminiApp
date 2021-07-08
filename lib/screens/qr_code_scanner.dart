import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/models/model_inventory.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  ModelInventory inventory;

  QRScanner(inventory) {
    this.inventory = inventory;
  }

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(16),
              child: Center(
                child: (result != null)
                    ? Column(
                        children: [
                          Text(
                              'Data: ${result.code}'),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.all(16),
                            decoration: new BoxDecoration(
                              color: Colors.blue,

                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              // color: HexColor('#D60812'),
                            ),
                            child: InkWell(
                              onTap: () {
                                widget.inventory.SetQRStatus(1);

                                result != null
                                    ? Navigator.pop(context, 'Done')
                                    : Navigator.pop(context, 'Failed');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      'FINISH',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text('Scan a code'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${widget.inventory.name}',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String describeEnum(Object enumEntry) {
    final String description = enumEntry.toString();
    final int indexOfDot = description.indexOf('.');
    assert(
      indexOfDot != -1 && indexOfDot < description.length - 1,
      'The provided object "$enumEntry" is not an enum.',
    );
    return description.substring(indexOfDot + 1);
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        print(result.code);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
