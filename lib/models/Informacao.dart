class Informacao{
  int _idinformacao;
  String _tituloinfo;
  String _subtituloinfo;
  String _imageminfo;
  String _textoinfo;
  /*
 final String tabelaInformacao = "informacao";
 final String colunaIdinformacao = "idinformacao INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT";
 final String colunaTituloinfo = "tituloinfo TEXT NOTNULL";
 final String colunaSubtituloinfo = "subtituloinfo TEXT";
 final String colunaImageminfo = "imageminfo TEXT";
 final String colunaTextoinfo = "textoinfo TEXT NOT NULL"; 
  */

  Informacao(this._tituloinfo, this._subtituloinfo, this._imageminfo, this._textoinfo);
  
  Informacao.map(dynamic obj) {
    this._idinformacao = obj['idinformacao'];
    this._tituloinfo = obj['tituloinfo'];
    this._subtituloinfo = obj['subtituloinfo'];
    this._imageminfo = obj['imageminfo'];
    this._textoinfo = obj['textoinfo'];
  }

  int get idinformacao => _idinformacao;
  String get tituloinfo => _tituloinfo;
  String get subtituloinfo => _subtituloinfo;
  String get imageminfo => _imageminfo;
  String get textoinfo => _textoinfo;

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>(); 
    // set em formato json
    if (idinformacao != null){mapa["idinformacao"] = _idinformacao;} //verificando se id é nulo
    mapa["tituloinfo"] = _tituloinfo;
    mapa["subtituloinfo"] = _subtituloinfo;
    mapa["imageminfo"] = _imageminfo;
    mapa["textoinfo"] = _textoinfo;
    return mapa;
 }

 Informacao.fromMap(Map<String, dynamic> mapa) {
    this._idinformacao = mapa['idinformacao'];
    this._tituloinfo = mapa['tituloinfo'];
    this._subtituloinfo = mapa['subtituloinfo'];
    this._imageminfo = mapa['imageminfo'];
    this._textoinfo = mapa['textoinfo'];
  }
}