class Burc {

  String? _burcAdi;
  String? _burcTarihi;
  String? _burcYorum;
  String? _burcKucukResim;
  String _burcBuyukResim;

  Burc(this._burcAdi, this._burcTarihi, this._burcYorum, this._burcKucukResim,
      this._burcBuyukResim);
  String get burccBuyukResim => _burcBuyukResim;

  set burcBuyukResim(String value) {
    _burcBuyukResim = value;
  }

  String? get burccKucukResim => _burcKucukResim;

  set burcKucukResim(String value) {
    _burcKucukResim = value;
  }

  String? get burccYorum => _burcYorum;

  set burcYorum(String value) {
    _burcYorum = value;
  }

  String? get burccTarihi => _burcTarihi;

  set burcTarihi(String value) {
    _burcTarihi = value;
  }

  String? get burccAdi => _burcAdi;

  set burcAdi(String value) {
    _burcAdi = value;
  }
}



