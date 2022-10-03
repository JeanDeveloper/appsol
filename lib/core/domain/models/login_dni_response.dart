import 'dart:convert';

List<LoginDniResponse> loginDniResponseFromJson(String str) => List<LoginDniResponse>.from(json.decode(str).map((x) => LoginDniResponse.fromJson(x)));

class LoginDniResponse {
    LoginDniResponse({

        this.codigoPersonal,
        this.dni,
        this.pNombre,
        this.sNombre,
        this.pApellido,
        this.sApellido,
        this.cargo,
        this.codTipoUsuario,
    });

    String? codigoPersonal;
    String? dni;
    String? pNombre;
    String? sNombre;
    String? pApellido;
    String? sApellido;
    String? cargo;
    int?    codTipoUsuario;


    LoginDniResponse.fromJson(Map<String, dynamic> json) {

        codigoPersonal  = json["codigo_personal"];
        dni             = json["dni"];
        pNombre         = json["p_nombre"];
        sNombre         = json["s_nombre"];
        pApellido       = json["p_apellido"];
        sApellido       = json["s_apellido"];
        cargo           = json["cargo"];
        codTipoUsuario  = int.parse(json["cod_tipo_usuario"]) ;

    }

}
