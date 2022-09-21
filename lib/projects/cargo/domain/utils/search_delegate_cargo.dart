import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/data/models/movimiento_cargo_model.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/cargo/styles/style.dart';

class SearchDelegateProviderCargo extends SearchDelegate{

  @override
  String? get searchFieldLabel => 'Ingrese la placa, dni o nombre';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(color: Colors.grey);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return  [
      IconButton(
        onPressed:() => query  = '', 
        icon: const Icon(Icons.close),
      )
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () => close(context, null) ,
    );

  }

  @override
  Widget buildResults(BuildContext context) {

    final searchProvider = Provider.of<MovimientosCargoPageProvider>(context, listen:false);
    final size = MediaQuery.of(context).size;
    if ( query.isEmpty ) return _emptyContainer();

    return FutureBuilder(

      future: searchProvider.getSearchMovimientos(query),
      builder: (context, AsyncSnapshot<List<MovimientoCargoModel>>snapshot){

        if(!snapshot.hasData)return const Center(child: CircularProgressIndicator());
        if(snapshot.data!.isEmpty) return _emptyContainer();
        final movimientos = snapshot.data;

        return ListView.separated(
          separatorBuilder: (_, int i) => const Divider(color: Colors.black, indent:10, endIndent: 10),
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: size.height*0.023, horizontal:size.width*0.024),
          itemCount: movimientos!.length,
          itemBuilder: (context, index) => _MovimientoTileCargo(movimientoCargo: movimientos[index])
        );

      }

    );

  }

  Widget _emptyContainer()=> const Center( child: Icon(Icons.hourglass_empty_outlined, color: Colors.black38, size: 100));

  @override
  Widget buildSuggestions(BuildContext context) {

    final searchProvider = Provider.of<MovimientosCargoPageProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    if ( query.isEmpty) return _emptyContainer();


    return FutureBuilder(

      future: searchProvider.getSearchMovimientos(query),

      builder: (context, AsyncSnapshot<List<MovimientoCargoModel>> snapshot){

        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        if(snapshot.data!.isEmpty) return _emptyContainer();
        final movimientos = snapshot.data;

        return ListView.separated(
          separatorBuilder: ( _ , int i) => const Divider(color: Colors.black, indent: 10, endIndent: 10),
          physics:  const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical:size.height*0.023, horizontal: size.width*0.024),
          itemCount: movimientos!.length,
          itemBuilder: ((context, index) => _MovimientoTileCargo(movimientoCargo: movimientos[index])),
        );

      } ,
    );

  }

}

class _MovimientoTileCargo extends StatelessWidget {
  
  final MovimientoCargoModel movimientoCargo;
  
  const _MovimientoTileCargo({
    Key? key, 
    required this.movimientoCargo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ListTile(

      style: ListTileStyle.list,

      title: Row( 

        children: [

          SizedBox(
            // color: Colors.red,
            width: size.width*0.13,
            child: Text(movimientoCargo.dni! ,  style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
          
          Text('- ' ,  style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1),
          
          SizedBox(
            width: size.width*0.5,
            child: Text(movimientoCargo.nombres!, style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
          const SizedBox(width: 10),
        ],

      ),

      subtitle: Row(

        children: [

          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(movimientoCargo.cargo!,    minFontSize: 6, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle(), overflow: TextOverflow.ellipsis, maxLines: 2),
                AutoSizeText(movimientoCargo.empresa!,  minFontSize: 4, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle().copyWith(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2),
                AutoSizeText(movimientoCargo.tipoCarga!,minFontSize: 4, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle().copyWith( color: Colors.blue, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2)
              ]
            ),
          ),

          
          Expanded( flex: 2 , child: Text(movimientoCargo.placa! ,  style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1)),

          if(movimientoCargo.fechaSalida == '')
            Expanded( flex: 2 , child: AutoSizeText( movimientoCargo.fechaIngreso!.toString().substring(11, 19), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12,)),

          // if(movimiento.fechaSalida != '')
          //   Expanded( flex: 2 , child: AutoSizeText( movimiento.fechaSalida!.toString().substring(11, 16), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12)),

        ],
      ),

      trailing: (movimientoCargo.fechaSalida== '')
        ? const FaIcon(FontAwesomeIcons.squareCaretRight, color: Colors.green)
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(movimientoCargo.fechaIngreso!.toString().substring(11, 19), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),
            AutoSizeText(movimientoCargo.fechaSalida.toString().substring(11, 19), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),
            AutoSizeText( getTiempoTranscurrido(movimientoCargo.fechaIngreso!,  DateTime.parse('${movimientoCargo.fechaSalida.toString().replaceAll(' ', 'T')}Z')).toString().substring(0, 7), style: TextStyle(color: Colors.blue, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),
          ],

        ),

      contentPadding:  const EdgeInsets.symmetric(horizontal: 20),

    );

  }
}

Duration getTiempoTranscurrido(DateTime fecha1, DateTime fecha2){
  final Duration resultado = fecha2.difference(fecha1);
  return resultado;
}

