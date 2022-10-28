import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/domain/helpers/consultar_doi_people.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';
import 'package:solgis/projects/people/styles/style.dart';
import 'package:solgis/projects/people/theme/theme.dart';

class SearchDelegateProvider extends SearchDelegate{
  

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
        headline6: TextStyle( color: Colors.white),
      ),
      appBarTheme:const AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
    );
  }

  @override
  String? get searchFieldLabel => 'Documento o Nombres';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    color: Colors.red
  );

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: ()=>query = '', 
      )
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(

      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: ()=> close(context, null),

    );

  }

  Widget _emptyContainer(){

    return const  Center(
      child: Icon(Icons.hourglass_empty_outlined, color: Colors.black38, size: 100),
    );

  }

  @override
  Widget buildResults(BuildContext context) {

    final searchProvider = Provider.of<MovimientosProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;

    if ( query.isEmpty )  return _emptyContainer();

    return FutureBuilder(

      future: searchProvider.getSearchMovimientos(query),
      builder: (context, AsyncSnapshot<List<MovimientoModel>> snapshot){
        if (!snapshot.hasData)return const Center(child: CircularProgressIndicator());
        if(snapshot.data!.isEmpty ) return _emptyContainer();
        final movimientos = snapshot.data;
        return ListView.separated(
          separatorBuilder: ( _ , int i) => const Divider(color: Colors.black, indent: 10, endIndent: 10),
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: size.height*0.023, horizontal:size.width*0.024),
          itemCount: movimientos!.length,
          itemBuilder: (context, index) => _MovimientoTile(movimiento:movimientos[index]),
        );
      }

    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final searchProvider = Provider.of<MovimientosProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;

    if ( query.isEmpty )return _emptyContainer();

    return FutureBuilder(

      future: searchProvider.getSearchMovimientos(query),
      
      builder: (context, AsyncSnapshot<List<MovimientoModel>> snapshot){
        if (!snapshot.hasData)return const Center(child: CircularProgressIndicator());
        if(snapshot.data!.isEmpty ) return _emptyContainer();
        final movimientos = snapshot.data;

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: size.height*0.023, horizontal:size.width*0.024),
          itemCount: movimientos!.length,
          itemBuilder: (context, index) => _MovimientoTile(movimiento:movimientos[index]),
        );
      }

    );

  }

}

class _MovimientoTile extends StatelessWidget {

  final MovimientoModel movimiento;

  const _MovimientoTile({required this.movimiento});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final globalProvider = Provider.of<GlobalProvider>(context);
    
    return ListTile(

      style: ListTileStyle.list,
      // contentPadding: EdgeInsets.symmetric(horizontal: size.height*0.0116),
      contentPadding: EdgeInsets.zero,
      // leading: Icon(Icons.account_circle, size: size.width*0.1, color: (movimiento.sexo == 'M')? Colors.blue :  Colors.pinkAccent),

      leading: GestureDetector(
        onTap: ()async{

          await NDialog(
            
            dialogStyle: DialogStyle(
              backgroundColor: const Color(0xFF999999), //0xFF9E9E9E
            ),
            
            title: Text('Foto de ${movimiento.nombres!.split(' ')
              .map((nombre){
                if(nombre != '') return nombre[0] + nombre.substring(1).toLowerCase();
              }).join(' ')}', style: const TextStyle(color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
            
            content: Container(
            
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              width: size.width*0.05,
              height: size.height*0.35,
            
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FutureBuilder(

                  future: getImage(movimiento.pathImage),

                  builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) { 
                    if(!snapshot.hasData){
                      return const Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/gifs/loader-gris.gif'),
                      );
                    }

                    return Container(
                      child: snapshot.data!,
                    );

                  }

                ),
              )
            
            )

          ).show(context);

        },
        child: SizedBox(
          width: size.width*0.15,
          height: size.height*0.4,
          child: ClipRRect(
      
            borderRadius: BorderRadius.circular(20),
      
            child: FutureBuilder(
      
              future: getImage(movimiento.pathImage),
      
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) { 
                if(!snapshot.hasData){
                  return const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/gifs/loader-gris.gif'),
                  );
                }
      
                return Container(
                  child: snapshot.data!,
                );
      
              }
      
            ),
      
          ),
      
        ),
      ),

      title: Row(

        children: [

          Expanded(
            flex: 7,
            child: Text(movimiento.nombres!.split(' ')
              .map((nombre){
                if(nombre != '') return nombre[0] + nombre.substring(1).toLowerCase();
              }).join(' '), style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),

          Expanded( flex: 2, child: AutoSizeText(movimiento.dni!, style: styleLetterpersonalmovimientotitle() , maxLines: 1, minFontSize: 6, maxFontSize: 12,))

          // SizedBox(
          //   width: size.width*0.40,
          //   child: AutoSizeText(movimiento.nombres!,style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1,)
          // ),
          // const SizedBox(width: 10),
          
          // AutoSizeText(movimiento.dni!, style: styleLetterpersonalmovimientotitle(), maxLines: 1)

        ],

      ),

      subtitle: Row(
        
        children: [

          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText( movimiento.cargo != '' 
                  ? movimiento.cargo!.split(' ')
                    .map((c) {
                      if(c != '') return c[0] + c.substring(1).toLowerCase();
                      // if (c == '') return null;
                      // return c[0] + c.substring(1).toLowerCase();
                    })
                    .join(' ')
                  :'' ,minFontSize: 6, maxFontSize: 12, style: styleLetterpersonalmovimientosubtitle(),overflow: TextOverflow.ellipsis, maxLines: 2),

                AutoSizeText( movimiento.empresa != '' 
                  ? movimiento.empresa!.split(' ')
                    .map((empresa){
                      if(empresa != '') return empresa[0] + empresa.substring(1).toLowerCase();
                      // if (empresa == '') return null;
                      // return empresa[0] + empresa.substring(1).toLowerCase();
                      })
                    .join(' ')
                  : '',
                  minFontSize: 4, maxFontSize: 12, style: styleLetterpersonalmovimientosubtitle().copyWith(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2)

              ]

            ),
          ),

          // Expanded(
          //   flex: 7,
          //   child: Container(
          //     width: size.width*0.31,
          //     alignment: Alignment.topLeft,

          //     child: Column(

          //       crossAxisAlignment: CrossAxisAlignment.start,

          //       children: [
          //         AutoSizeText(movimiento.cargo!, minFontSize: 6,  maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle(), overflow: TextOverflow.ellipsis, maxLines: 2,),
          //         AutoSizeText(movimiento.empresa!, minFontSize: 4, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle(), overflow: TextOverflow.ellipsis, maxLines: 3,)
          //       ]

          //     ),

          //   ),
          // ),

          if(movimiento.fechaSalida == '')
          Expanded( flex: 2 , child: AutoSizeText( movimiento.fechaMovimiento!.toString().substring(11, 19), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12,)),


        ],
      ),

      trailing: (movimiento.fechaSalida == '')
        ? GestureDetector( 
          onTap: ()async{
              consultarDOI(context, movimiento.dni!, globalProvider.codServicio);

            // await NDialog(
            //   dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
            //   title: const Text("Movimiento",  style: TextStyle(color: Colors.black)),
            //   content: const Text("¿Estas Seguro que quieres registar la salida?", style: TextStyle(color: Colors.black)),  
            //   actions: <Widget>[
            //     TextButton(
            //       child: const Text("Si"),
            //       onPressed: ()async{
            //         consultarDOI(context, movimiento.dni!, globalProvider.codServicio);
            //       }
            //     ),
            //     TextButton(child: const Text("No"),onPressed: ()=> Navigator.pop(context)),
            //   ],
            // ).show(context);

          },
          child: const FaIcon(FontAwesomeIcons.personWalkingArrowRight, color: Colors.green),
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AutoSizeText( movimiento.fechaMovimiento!.toString().substring(11, 19), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),

            AutoSizeText( movimiento.fechaSalida!.toString().substring(11, 19), style: TextStyle(color: Colors.green, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),

            // AutoSizeText( DateTime.parse(movimiento.fechaSalida!).toString(), style: TextStyle(color: Colors.blue, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),

            AutoSizeText( getTiempoTranscurrido(movimiento.fechaMovimiento!, DateTime.parse('${movimiento.fechaSalida.toString().replaceAll(' ', 'T')}Z')).toString().substring(0, 7), style: TextStyle(color: Colors.blue, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12),

          ],
        ),

    );

  }

}

Duration getTiempoTranscurrido(DateTime fecha1, DateTime fecha2){
  final Duration resultado = fecha2.difference(fecha1);
  return resultado;
}