import 'package:flutter/material.dart';

// hF & wF defined in HomeClass
String dummyImage = 'iVBORw0KGgoAAAANSUhEUgAAAD8AAAA/CAIAAADYPYeIAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAN6SURBVGhD7ZiLS1NRGMD7N4qoiAhKMksLekkmYYIUYRFSYZouUSSpRMsUszLTFM0yQ10+56sUzWdaKSaVSW8lzDIpTSktc5t76NY3P7ldTyO23WOnxfn4Ma7nfPvO717O4855RnsO+7cvKhm3O7g9O7g9O7g9O7g9O7g9O7g9O7g9O1jaFxb/IFqshZm9T0Chh3cq0WgtbOxPxj6Yv+LQ9t0pRLu1ULMvLiNb/oCTayTYB4ZWEu3WQs3+Q78eikxOGl+80paUk73AmQud+YrvcJElHwL1pWuCMnMGxQk2MC1Pw76nV4e1IJRKQ32jStwrzx9Z5hxyJKwari9n9C1Y6Rce3SpOsA0cjoJ9R6cGa2FMTRnbH04IvXEJT+F5b9uZBNd5haNRZx8JXVLAsSjYNzSpsZYQBoOx6a4ae8Mim8HeaUukkE8FHIiCvaJ0XKMxYDkhNFpDRZUSeqPPPwb7zZ7nxF+RDo5CwR543a3FcuIY/DwJXdeyPy108N8vKxLnSweHoGNfWa2E6f57tLaZFoBf8M3s3GG4uNei1moN2CgRrE/HHugy9/iHhk2PH4GVAOsBoq3937Mvu6WE7RKLiqNyevbDOTAxMdPb2DyzoKWApajZA9W1KpgYWFcI2E+hq+PJzK4Kh1qpuRPNWrAaTXugrlGl0826gd73OmgfGDCdxxDv+vTifJvBapTtgdt1KrX61w2MfpuCRpxUcGO4jUoHi9O3B8orlG97dbhGYbpDC3zq9Ybm+xRmPGIqPUf2SE29Cs6BryOmZ//subaqZtb7j0Tm3B6Bkxg+r1zv9w0qddh4HM7dRY6yde4xXvuuHo24k68YEydbzhzaw3tlbHxnaHhD8LFa+HOPrxykzbJqU/jFlC7xdy2Evj28QoZFNG3wiIPXYJTb65sL7Ymp3Wu3nhKMCeDexEUshLL9iaiW5S6hYi24h+T0HiHhUtqbg7Li9e4xix1lMIXcdyUfDqlIz+wXEqyCmj3M3R3eaWJv5ECggsikCB37AsWYm1ci4Q24esZDF5FMETr2Zleks9vpnLwvRCZdKNjHJ70kvAH4EXijYITIpA4Fexe3aLE3LNMAyf/qsBCp9rBPo/SS1TKYKj7+BTZvIDYg1T4j62NCSleWfIho/ztItWcLt2cHt2cHt2cHt2cHt2cHt2cHt2fH/2Jvr2E0/gSDMpkQKE5Y0wAAAABJRU5ErkJggg==';
var hF = 1.0;  // Height Factor
var wF = 1.0;  // Width Factor

const API_KEY = 'n5vK9SH78sC2WZy6aDh1XNrLOtcIM4z3EGxweFmjdTlkqR0pgPQUJoAiBfYbVsu';

const String dataUrl = 'http://172.31.29.237:5000';
const bool boldText = true;

const MaterialColor myCustomColor = MaterialColor(
  0xFF9C27B0, //0xFF9C27B0, // 0xFFD8FF60, // Specify the primary color value
  <int, Color>{
    50: Color(0xFFF3E5F5),
    100: Color(0xFFE1BEE7),
    200: Color(0xFFCE93D8),
    300: Color(0xFFBA68C8),
    400: Color(0xFFAB47BC),
    500: Color(0xFF9C27B0),
    600: Color(0xFF8E24AA), //Color.fromRGBO(156, 39, 176, 1),0xFFF8BBD0
    700: Color(0xFF7B1FA2),
    800: Color(0xFF6A1B9A),
    900: Color(0xFF4A148C),
  },
);

final ColorScheme myColorScheme = ColorScheme.light().copyWith(
  primary: myCustomColor.shade500,  //primary: Colors.purple, // Set the primary color
  onSurface: Colors.grey,
); // Set the surface color

final Color subIconColor = myCustomColor.shade500;           // Color of Icons within Dropdown
final String homeLogo = 'assets/images/niti-logo.png';
final String drawerLogo = 'assets/images/niti-logo.png';

final Color drawerColor = myCustomColor.shade500;
final Color drawerTitleColor = Colors.orange;
final Color subListTextColor = myCustomColor.shade300;
