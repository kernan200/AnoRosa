import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Usuario.dart';
import '../models/Informacao.dart';

class BD {
 static final BD _instance = new BD.internal();

 factory BD() => _instance;

 BD.internal();

 //Esqueleto do banco para facilitar a identificação e alteração;
 //Tabela usuario
 final String tabelaUsuario = "usuario";
 final String colunaIdusuario = "idusuario INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT";
 final String colunaEmailuser = "emailuser TEXT NOT NULL";
 final String colunaSenhauser = "senhauser TEXT NOT NULL";
 final String colunaFotouser = "fotouser TEXT";
 final String colunaNomeuser = "nomeuser TEXT NOT NULL";

 //Tabela informacao
 final String tabelaInformacao = "informacao";
 final String colunaIdinformacao = "idinformacao INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT";
 final String colunaTituloinfo = "tituloinfo TEXT NOTNULL";
 final String colunaSubtituloinfo = "subtituloinfo TEXT";
 final String colunaImageminfo = "imageminfo TEXT";
 final String colunaTextoinfo = "textoinfo TEXT NOT NULL";

 static Database _db;
 
  Future<Database> get db async {
    // se o _db existe na memória
    if(_db != null){
      //caso exista, retorna este _bd existente
      return _db;
    }
    // chamamos agora o initBd que irá iniciar o nosso banco de dados
    _db = await initBd();
    return _db;
  }

  initBd() async {

    Directory documentoDiretorio = await getApplicationDocumentsDirectory();

    String caminho = join(
      documentoDiretorio.path, "bd_principal.db"
    );

    var nossoBD = await openDatabase(caminho, version: 1, onCreate: _onCreate);
    return nossoBD;
 
  }

  void _onCreate(Database db, int version) async {
    //Criação do banco em SQL com os valores definidos no esqueleto anteriormente
    await db.execute
    (
      "CREATE TABLE $tabelaUsuario($colunaIdusuario, $colunaEmailuser, $colunaSenhauser, $colunaFotouser, $colunaNomeuser);"
      "CREATE TABLE $tabelaInformacao($colunaIdinformacao, $colunaTituloinfo, $colunaSubtituloinfo, $colunaImageminfo, $colunaTextoinfo);"
      );
 }
 
/////DAO usuario
//Inserir usuario
Future<int> inserirUsuario(Usuario usuario) async {
 var bdInserir = await db;
 int res = await bdInserir.insert("$tabelaUsuario", usuario.toMap()); //usuario é o nome da tabela;
 return res;
 }
//Listar usuarios
 Future<List> pegarUsuarios() async {
    var bdGet = await db;
    var res = await bdGet.rawQuery("SELECT * FROM $tabelaUsuario");
    return res.toList();
 }
  //Pegar usuario por id
  Future<Usuario> pegarUsuario(int idusuario) async {
    var bdCliente = await db;
    var res = await bdCliente.rawQuery("SELECT * FROM $tabelaUsuario"
              " WHERE $colunaIdusuario = $idusuario"); 
    if (res.length == 0) return null;
    return new Usuario.fromMap(res.first);
 }
 //Deletar usuario
 Future<int> apagarUsuario(int idusuario) async {
    var bdCliente = await db;
    return await bdCliente.delete(tabelaUsuario,
      where: "$colunaIdusuario = ?", whereArgs: [idusuario]);
  } 
//Editar usuario
Future<int> editarUsuario(Usuario usuario) async {
    var bdCliente = await db;
    return await bdCliente.update(tabelaUsuario,
      usuario.toMap(), where: "$colunaIdusuario = ?", whereArgs: [usuario.idusuario]
    );
  } 
/////Fim DAO Usuario
/////DAO informacao
//Inserir informacao
Future<int> inserirInformacao(Informacao informacao) async {
 var bdInserir = await db;
 int res = await bdInserir.insert("$tabelaInformacao", informacao.toMap()); 
 return res;
 }
//Listar informacaos
 Future<List> pegarInformacaos() async {
    var bdGet = await db;
    var res = await bdGet.rawQuery("SELECT * FROM $tabelaInformacao");
    return res.toList();
 }
  //Pegar informacao por id
  Future<Informacao> pegarInformacao(int idinformacao) async {
    var bdCliente = await db;
    var res = await bdCliente.rawQuery("SELECT * FROM $tabelaInformacao"
              " WHERE $colunaIdinformacao = $idinformacao"); 
    if (res.length == 0) return null;
    return new Informacao.fromMap(res.first);
 }
 //Deletar informacao
 Future<int> apagarInformacao(int idinformacao) async {
    var bdCliente = await db;
    return await bdCliente.delete(tabelaInformacao,
      where: "$colunaIdinformacao = ?", whereArgs: [idinformacao]);
  } 
//Editar informacao
Future<int> editarInformacao(Informacao informacao) async {
    var bdCliente = await db;
    return await bdCliente.update(tabelaInformacao,
      informacao.toMap(), where: "$colunaIdinformacao = ?", whereArgs: [informacao.idinformacao]
    );
  } 
/////Fim DAO informacao
  
//Fechar banco de dados para não ocupar memória
  Future fechar() async {
    var bdCliente = await db;

    return bdCliente.close();
  } 
}