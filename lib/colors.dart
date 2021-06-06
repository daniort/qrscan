

class MiColor {
  static ColorModel primary = ColorModel.fromJson({
    "name": "French Raspberry",
    "hex": 0xffce2d4f,
    "rgb": [206, 45, 79],
    "cmyk": [0, 78, 62, 19],
    "hsb": [347, 78, 81],
    "hsl": [347, 64, 49],
    "lab": [46, 63, 21],
  });
  static ColorModel yellow = ColorModel.fromJson({
    "name": "Corn",
    "hex": 0xfffff05a,
    "rgb": [255, 240, 90],
    "cmyk": [0, 6, 65, 0],
    "hsb": [55, 65, 100],
    "hsl": [55, 100, 68],
    "lab": [94, -12, 72]
  });
  static ColorModel success = ColorModel.fromJson({
    "name": "Middle Green",
    "hex": 0xff5b8c5a,
    "rgb": [91, 140, 90],
    "cmyk": [35, 0, 36, 45],
    "hsb": [119, 36, 55],
    "hsl": [119, 22, 45],
    "lab": [54, -27, 22]
  });
  static ColorModel grey = ColorModel.fromJson({
    "name": "Gainsboro",
    "hex": 0xffd7dae5,
    "rgb": [215, 218, 229],
    "cmyk": [6, 5, 0, 10],
    "hsb": [227, 6, 90],
    "hsl": [227, 21, 87],
    "lab": [87, 1, -6]
  });
  static ColorModel dark = ColorModel.fromJson({
    "name": "Dark Purple",
    "hex": 0xff2f2235,
    "rgb": [47, 34, 53],
    "cmyk": [11, 36, 0, 79],
    "hsb": [281, 36, 21],
    "hsl": [281, 22, 17],
    "lab": [16, 11, -10]
  });
}

class ColorModel {
  ColorModel({
    this.name,
    this.hex,
    this.rgb,
    this.cmyk,
    this.hsb,
    this.hsl,
    this.lab,
  });

  String name;
  int hex;
  List<int> rgb;
  List<int> cmyk;
  List<int> hsb;
  List<int> hsl;
  List<int> lab;

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        name: json["name"],
        hex: json["hex"],
        rgb: List<int>.from(json["rgb"].map((x) => x)),
        cmyk: List<int>.from(json["cmyk"].map((x) => x)),
        hsb: List<int>.from(json["hsb"].map((x) => x)),
        hsl: List<int>.from(json["hsl"].map((x) => x)),
        lab: List<int>.from(json["lab"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hex": hex,
        "rgb": List<dynamic>.from(rgb.map((x) => x)),
        "cmyk": List<dynamic>.from(cmyk.map((x) => x)),
        "hsb": List<dynamic>.from(hsb.map((x) => x)),
        "hsl": List<dynamic>.from(hsl.map((x) => x)),
        "lab": List<dynamic>.from(lab.map((x) => x)),
      };
}
