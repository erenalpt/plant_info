class Plant {
  String _plantName;
  String _plantLatinceName;
  String _description;
  String _picture;

  Plant(this._plantName, this._plantLatinceName, this._description,
      this._picture);

  String get plantName => _plantName;
  set plantName(String value) {
    _plantName = value;
  }

  String get plantLatinceName => _plantLatinceName;
  set plantLatinceName(String value) {
    _plantLatinceName = value;
  }

  String get description => _description;
  set description(String value) {
    _description = value;
  }

  String get picture => _picture;
  set picture(String value) => _picture = value;
}
