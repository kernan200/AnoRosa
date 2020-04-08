class Usuario {
  int _idusuario;
  String _emailuser;
  String _senhauser;
  String _fotouser;
  String _nomeuser;

  Usuario(this._emailuser, this._senhauser, this._fotouser, this._nomeuser);
  
  Usuario.map(dynamic obj) {
    this._idusuario = obj['idusuario'];
    this._emailuser = obj['emailuser'];
    this._senhauser = obj['senhauser'];
    this._fotouser = obj['fotouser'];
    this._nomeuser = obj['nomeuser'];
  }

  int get idusuario => _idusuario;
  String get emailuser => _emailuser;
  String get senhauser => _senhauser;
  String get fotouser => _fotouser;
  String get nomeuser => _nomeuser;

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>(); 
    // set em formato json
    if (idusuario != null){mapa["idusuario"] = _idusuario;} //verificando se id é nulo
    mapa["emailuser"] = _emailuser;
    mapa["senhauser"] = _senhauser;
    mapa["fotouser"] = _fotouser;
    mapa["nomeuser"] = _nomeuser;
    return mapa;
 }

 Usuario.fromMap(Map<String, dynamic> mapa) {
    this._idusuario = mapa['idusuario'];
    this._emailuser = mapa['emailuser'];
    this._senhauser = mapa['senhauser'];
    this._fotouser = mapa['fotouser'];
    this._nomeuser = mapa['nomeuser'];
  }
 
}