class User {

  String _name;
  String _email;
  int _age;

  User(this._name, this._email, this._age);

  @override
  String toString() {
    return 'User{ name: $_name, email: $_email, age: $_age }';
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}