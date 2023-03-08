class ForecastDaysModel {
  String _dateTime;
  String _temp;
  String _main;
  String _description;

  ForecastDaysModel(this._dateTime, this._temp, this._main, this._description);

  String get description => _description;

  String get main => _main;

  String get temp => _temp;

  String get dateTime => _dateTime;
}