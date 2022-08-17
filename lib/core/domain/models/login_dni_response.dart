import 'dart:convert';

List<LoginDniResponse> loginDniResponseFromJson(String str) => List<LoginDniResponse>.from(json.decode(str).map((x) => LoginDniResponse.fromJson(x)));

class LoginDniResponse {
    LoginDniResponse({
        this.codigoPersonal,
        this.codigoUsuario,
        this.dni,
        this.nombre,
        this.pApellido,
        this.sApellido,
        this.rol,
        this.codigoCliente,
    });

    String? codigoPersonal;
    int? codigoUsuario;
    String? dni;
    String? nombre;
    String? pApellido;
    String? sApellido;
    int? rol;
    String? codigoCliente;

    LoginDniResponse.fromJson(Map<String, dynamic> json) {
        codigoPersonal  = json["codigo_personal"];
        codigoUsuario   = json["codigo_usuario"];
        dni             = json["dni"];
        nombre          = json["nombre"];
        pApellido       = json["p_apellido"];
        sApellido       = json["s_apellido"];
        rol             = json["rol"];
        codigoCliente   = json["codigo_cliente"];
    }

}
