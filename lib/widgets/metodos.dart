

 import 'package:flutter/material.dart';
import 'package:scanner/models/scan.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
    
    if (scan.tipo == "http") {
      if (await canLaunch(scan.valor))
        await launch(scan.valor);
      else
        throw 'No se puede lanzar $scan.valor';
    } else {
      Navigator.pushNamed(context, 'mapa', arguments: scan);
    }

  }