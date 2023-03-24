import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/theme/app_theme.dart';

//Para hacer qeu las imagenes cargen en tiempo real deben de ser con StatefullWidget
class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  //este listado controla cuantos elementos estan en pantalla
  final List<int> imagesId = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //controlador que se encarga de saber como de cerca del final esta para actualizar
  final ScrollController scrollController = ScrollController();
  //boleano que va a servir si estamos cargando
  bool isLoading = false;
  //Para saber el valor debemos de hacer un listener que sepa el valor
  @override
  void initState() {
    super.initState();
    //Cuando algo cambie se va a ajecutar
    scrollController.addListener(() {
      // print(
      //     '${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      //se llama cuando ya llega al final
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // add5();
        fetchData();
      }
    });
  }

  //creacion de un loading
  //simulacion de que estamso esperando a una peticion
  Future fetchData() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});
    //este metodo al cargar baja un poco la pantalla si estamos cerca del final
    if ((scrollController.position.pixels + 100) >=
        scrollController.position.maxScrollExtent) {
      scrollController.animateTo(scrollController.position.pixels + 120,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn);
    }
  }

  //metodo que no devuleve nada y añade unos 5 imagesId
  void add5() {
    //metodo que añada mas imagenes
    final lastId = imagesId.last;
    imagesId.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }
  //metodo que limpiara las imagenes id
  Future<void> onRefresh() async{
    //el return esta implicito en la propia funcion, va a hacer return automatico del future
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesId.last;
    imagesId.clear();
    imagesId.add(lastId+1);
    add5();
    
  }

  @override
  Widget build(BuildContext context) {
    //Informacion de la pantalla que lo esta ejecutando
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        //esto removera el espacio en blanco de arriba en las pantallas que tenga esa parte con camara y demas
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          //un widget que permite poner un widget uno encima del otro
          child: Stack(
            children: [
              //widget para refrescar la pantalla deslizando para arriba
              RefreshIndicator(
                color: AppTheme.primaryColor,
                onRefresh: onRefresh,
                child: ListView.builder(
                  //para que pueda hacer el rebote sobrepasando para arriba o abajo
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return FadeInImage(
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/images/jar-loading.gif'),
                        image: NetworkImage(
                            'https://picsum.photos/500/300?image=${imagesId[index]}'));
                  },
                  itemCount: imagesId.length,
                ),
              ),
              //widget feedback para cargar
              if (isLoading)
                Positioned(
                    bottom: 40,
                    left: size.width * 0.5 - 30,
                    child: const _LoadingIcon()),
            ],
          ),
        ));
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: const CircularProgressIndicator(
        color: AppTheme.primaryColor,
      ),
    );
  }
}
