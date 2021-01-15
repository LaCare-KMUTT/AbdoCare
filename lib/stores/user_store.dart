class UserStore {
  String storedUserId;
  String storedName;
  String storedSurname;
  String storedHn;

  UserStore(
      {this.storedUserId, this.storedName, this.storedSurname, this.storedHn});

  String get userId => this.storedUserId;

  set userId(String userId) => this.storedUserId = userId;

  String get name => this.name;

  set name(String name) => this.storedName = name;

  String get surname => this.storedSurname;

  set surname(String surname) => this.storedSurname = surname;

  String get hn => this.storedHn;

  set hn(String hn) => this.storedHn = hn;
}
