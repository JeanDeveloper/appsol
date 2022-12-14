import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static late SharedPreferences _prefs;
  static String _codigoPersonal = '';
  static String _dni = '';
  static String _pNombre = '';
  static String _sNombre = '';
  static String _pApellido = '';
  static String _sApellido = '';
  static int _codigoTipoUsuario = 0;
  static String _cargo = '';
  static int _codDispositivo = 0;
  static String _codServicio = '';
  static String _codCliente = '';
  static int _codSubArea = 0;
  static String _nombreArea= '';
  static String _nombreSubArea= '';
  static String _nombreSucursal= '';
  static String _nombreCliente= '';
  static String? _aliasSede= '';
  static int _codTipoServicio= 0;
  static bool _isAuthenticated = false;
  static String _nombrePuesto = '';


  static Future init() async {
    _prefs = await SharedPreferences.getInstance(); 
  }

  //NOMBRE DEL PUESTO ASIGNADO EL DISPOSITIVO.
  static String get nombrePuesto{
    return _prefs.getString('nombrePuesto')??_nombrePuesto;
  }

  static set nombrePuesto(String nombrePuesto){
    _nombrePuesto = nombrePuesto;
    _prefs.setString('nombrePuesto', nombrePuesto);
  }

  //CODIGO PERSONA
  static String get codigoPersonal{
    return _prefs.getString('codigoPersona')??_codigoPersonal;
  }

  static set codigoPersonal(String codigoPersona){
    _codigoPersonal = codigoPersona;
    _prefs.setString('codigoPersona', codigoPersona);
  }

  //ESTA O NO AUTENTICADO
  static bool get isAuthenticated{
    return _prefs.getBool('isAuthenticated')??_isAuthenticated;
  }

  static set isAuthenticated(bool value){
    _isAuthenticated = value;
    _prefs.setBool('isAuthenticated', value);
  }

  //CODIGO USUARIO
  // static int get codigoUsuario {
  //   return _prefs.getInt('codigoUsuario')??_codigoUsuario;
  // }

  // static set codigoUsuario(int value){
  //   _codigoUsuario = value;
  //   _prefs.setInt('codigoUsuario', value);
  // }

  //CODIGO DNI
  static String get dni {
    return _prefs.getString('dni')??_dni;
  }

  static set dni(String dni){
    _dni = dni;
    _prefs.setString('dni', dni);
  }

  //PRIMER NOMBRE
  static String get pNombre {
    return _prefs.getString('pNombre')??_pNombre;
  }

  static set pNombre(String pnombre){
    _pNombre = pnombre;
    _prefs.setString('pNombre', pnombre);
  }

  //SEGUNDO NOMBRE
  static String get sNombre {
    return _prefs.getString('sNombre')??_sNombre;
  }

  static set sNombre(String snombre){
    _sNombre = snombre;
    _prefs.setString('sNombre', snombre);
  }


  //PRIMER APELLIDO
  static String get pApellido  {
    return _prefs.getString('pApellido ')??_pApellido ;
  }

  static set pApellido (String pApellido ){
    _pApellido  = pApellido ;
    _prefs.setString('pApellido ', pApellido );
  }

  //SEGUNDO APELLIDO
  static String get sApellido  {
    return _prefs.getString('sApellido ')??_sApellido ;
  }

  static set sApellido (String sApellido ){
    _sApellido  = sApellido ;
    _prefs.setString('sApellido ', sApellido );
  }

  //CODIGO TIPO CARGO
  static int get codtipoUsuario{
    return _prefs.getInt('codtipoUsuario')??_codigoTipoUsuario;
  }

  static set codtipoUsuario(int value){
    _codigoTipoUsuario = value;
    _prefs.setInt('codtipoUsuario', value);
  }

  //CARGO
  static String get cargo{
    return _prefs.getString('cargo')??_cargo;
  }

  static set cargo(String cargo){
    _cargo = cargo;
    _prefs.setString('cargo', cargo);
  }

  //CODIGO DISPOSITIVO
  static int get codDispositivo {
    return _prefs.getInt('codDispositivo')??_codDispositivo;
  }

  static set codDispositivo(int value){
    _codDispositivo = value;
    _prefs.setInt('codDispositivo', value);
  }
  //CODIGO SERVICIO
  static String get codServicio {
    return _prefs.getString('codServicio')??_codServicio;
  }

  static set codServicio(String codServicio){
    _codServicio = codServicio;
    _prefs.setString('codServicio', codServicio);
  }

  //CODIGO CLIENTE
  static String get codCliente {
    return _prefs.getString('codCliente')??_codCliente;
  }

  static set codCliente(String codCliente){
    _codCliente = codCliente;
    _prefs.setString('codCliente', codCliente);
  }


  //CODIGO SUB AREA
  static int get codSubArea {
    return _prefs.getInt('codSubArea')??_codSubArea;
  }

  static set codSubArea(int codSubArea){
    _codSubArea = codSubArea;
    _prefs.setInt('codSubArea', codSubArea);
  }



  //NOMBRE DE AREA
  static String get nombreArea {
    return _prefs.getString('nombreArea')??_nombreArea;
  }

  static set nombreArea(String nombreArea){
    _nombreArea = nombreArea;
    _prefs.setString('nombreArea', nombreArea);
  }

  //NOMBRE DE SUB AREA
  static String get nombreSubArea {
    return _prefs.getString('nombreSubArea')??_nombreSubArea;
  }

  static set nombreSubArea(String nombreSubArea){
    _nombreSubArea = nombreSubArea;
    _prefs.setString('nombreSubArea', nombreSubArea);
  }


  //NOMBRE DE SUCURSAL
  static String get nombreSucursal {
    return _prefs.getString('nombreSucursal')??_nombreSucursal;
  }

  static set nombreSucursal(String nombreSucursal){
    _nombreSucursal = nombreSucursal;
    _prefs.setString('nombreSucursal', nombreSucursal);
  }

  //NOMBRE DE CLIENTE
  static String get nombreCliente {
    return _prefs.getString('nombreCliente')??_nombreCliente;
  }

  static set nombreCliente(String nombreCliente){
    _nombreCliente = nombreCliente;
    _prefs.setString('nombreCliente', nombreCliente);
  }

  //ALIAS SEDE
  static String? get aliasSede {
    return _prefs.getString('aliasSede')??_aliasSede;
  }

  static set aliasSede(String? aliasSede){
    _aliasSede = aliasSede ?? '';
    _prefs.setString('aliasSede', aliasSede ?? '');
  }

  //CODIGO TIPO DE SERVICIO
  static int get codTipoServicio{
    return _prefs.getInt('codTipoServicio')??_codTipoServicio;
  }

  static set codTipoServicio(int codTipoServicio){
    _codTipoServicio = codTipoServicio;
    _prefs.setInt('codTipoServicio', codTipoServicio);
  }

}