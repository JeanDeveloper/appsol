import 'dart:convert';

List<AutorizacionModel> consultaDatosPersonaModelFromJson(String str) => List<AutorizacionModel>.from(json.decode(str).map((x) => AutorizacionModel.fromJson(x)));

class AutorizacionModel {
    AutorizacionModel({
      this.valor,
      this.mensaje,
      this.codAutorizacion,
      this.codMotivo,
      this.codAutorizante,
      this.codArea,
      this.emoFv,
      this.sctrPensionFv,
      this.sctrSaludFv,
      this.fiAutorizacion,
      this.fvAutorizacion,
    });

    String? valor;
    String? mensaje;
    String? codAutorizacion;
    String? codMotivo;
    String? codAutorizante;
    String? codArea;
    String? emoFv;
    String? sctrPensionFv;
    String? sctrSaludFv;
    String? fiAutorizacion;
    String? fvAutorizacion;

    AutorizacionModel.fromJson(Map<String, dynamic> json) {
        valor= json["valor"];
        mensaje= json["mensaje"];
        codAutorizacion= json["cod_autorizacion"];
        codMotivo= json["cod_motivo"];
        codAutorizante= json["cod_autorizante"];
        codArea= json["cod_area"];
        emoFv= json["emo_fv"];
        sctrPensionFv= json["sctr_pension_fv"];
        sctrSaludFv= json["sctr_salud_fv"];
        fiAutorizacion= json["fi_autorizacion"];
        fvAutorizacion= json["fv_autorizacion"];
    }


}
