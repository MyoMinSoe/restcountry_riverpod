// flags : {"png":"https://flagcdn.com/w320/wf.png","svg":"https://flagcdn.com/wf.svg","alt":""}
// name : {"common":"Wallis and Futuna","official":"Territory of the Wallis and Futuna Islands","nativeName":{"fra":{"official":"Territoire des îles Wallis et Futuna","common":"Wallis et Futuna"}}}
// region : "Oceania"

class CountryListModel {
  CountryListModel({
    Flags? flags,
    Name? name,
    String? region,
  }) {
    _flags = flags;
    _name = name;
    _region = region;
  }

  CountryListModel.fromJson(dynamic json) {
    _flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _region = json['region'];
  }

  Flags? _flags;
  Name? _name;
  String? _region;

  CountryListModel copyWith({
    Flags? flags,
    Name? name,
    String? region,
  }) =>
      CountryListModel(
        flags: flags ?? _flags,
        name: name ?? _name,
        region: region ?? _region,
      );

  Flags? get flags => _flags;

  Name? get name => _name;

  String? get region => _region;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_flags != null) {
      map['flags'] = _flags?.toJson();
    }
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['region'] = _region;
    return map;
  }
}

/// common : "Wallis and Futuna"
/// official : "Territory of the Wallis and Futuna Islands"
/// nativeName : {"fra":{"official":"Territoire des îles Wallis et Futuna","common":"Wallis et Futuna"}}

class Name {
  Name({
    String? common,
    String? official,
    NativeName? nativeName,
  }) {
    _common = common;
    _official = official;
    _nativeName = nativeName;
  }

  Name.fromJson(dynamic json) {
    _common = json['common'];
    _official = json['official'];
    _nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }

  String? _common;
  String? _official;
  NativeName? _nativeName;

  Name copyWith({
    String? common,
    String? official,
    NativeName? nativeName,
  }) =>
      Name(
        common: common ?? _common,
        official: official ?? _official,
        nativeName: nativeName ?? _nativeName,
      );

  String? get common => _common;

  String? get official => _official;

  NativeName? get nativeName => _nativeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['common'] = _common;
    map['official'] = _official;
    if (_nativeName != null) {
      map['nativeName'] = _nativeName?.toJson();
    }
    return map;
  }
}

/// fra : {"official":"Territoire des îles Wallis et Futuna","common":"Wallis et Futuna"}

class NativeName {
  NativeName({
    Fra? fra,
  }) {
    _fra = fra;
  }

  NativeName.fromJson(dynamic json) {
    _fra = json['fra'] != null ? Fra.fromJson(json['fra']) : null;
  }

  Fra? _fra;

  NativeName copyWith({
    Fra? fra,
  }) =>
      NativeName(
        fra: fra ?? _fra,
      );

  Fra? get fra => _fra;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_fra != null) {
      map['fra'] = _fra?.toJson();
    }
    return map;
  }
}

/// official : "Territoire des îles Wallis et Futuna"
/// common : "Wallis et Futuna"

class Fra {
  Fra({
    String? official,
    String? common,
  }) {
    _official = official;
    _common = common;
  }

  Fra.fromJson(dynamic json) {
    _official = json['official'];
    _common = json['common'];
  }

  String? _official;
  String? _common;

  Fra copyWith({
    String? official,
    String? common,
  }) =>
      Fra(
        official: official ?? _official,
        common: common ?? _common,
      );

  String? get official => _official;

  String? get common => _common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = _official;
    map['common'] = _common;
    return map;
  }
}

/// png : "https://flagcdn.com/w320/wf.png"
/// svg : "https://flagcdn.com/wf.svg"
/// alt : ""

class Flags {
  Flags({
    String? png,
    String? svg,
    String? alt,
  }) {
    _png = png;
    _svg = svg;
    _alt = alt;
  }

  Flags.fromJson(dynamic json) {
    _png = json['png'];
    _svg = json['svg'];
    _alt = json['alt'];
  }

  String? _png;
  String? _svg;
  String? _alt;

  Flags copyWith({
    String? png,
    String? svg,
    String? alt,
  }) =>
      Flags(
        png: png ?? _png,
        svg: svg ?? _svg,
        alt: alt ?? _alt,
      );

  String? get png => _png;

  String? get svg => _svg;

  String? get alt => _alt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['png'] = _png;
    map['svg'] = _svg;
    map['alt'] = _alt;
    return map;
  }
}
