class PicsumApi {
  PicsumApi._() {}

  static PicsumApi get instance => PicsumApi._();

  static final _header = {'Content-Type': 'application/json'};
}
