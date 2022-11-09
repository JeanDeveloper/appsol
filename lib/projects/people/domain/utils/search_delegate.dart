import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/data/services/movimiento_service.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';
import 'package:solgis/projects/people/presentation/widgets/widgets.dart';

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
          itemBuilder: (context, index) => ListTileMovimiento(movimiento:movimientos[index]),
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
          itemBuilder: (context, index) => ListTileMovimiento(movimiento:movimientos[index]),
        );
      }
    );
  }
}

