class User{
  var _name;
  var _email;
  var _password;
  var _genre;
  var _motivo;
  var _bornDate;

  User(this._name, this._email, this._password, this._genre, this._motivo,
      this._bornDate);

  User.Empty();

  User.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _motivo = json['motivo'],
        _bornDate = json['bornDate'];

  Map<String, dynamic> toJson() => {
    //'name' = _name,
    //'email' = _email,
    //'password' = _password,
    //'genre' = _genre,
    //'motivo' = _motivo,
    //'bornDate = _bornDate
  };

  get name => _name;

  set name(value) {
    _name = value;
  }

  get email => _email;

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get motivo => _motivo;

  set motivo(value) {
    _motivo = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }
}