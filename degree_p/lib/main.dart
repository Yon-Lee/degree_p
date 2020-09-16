import 'package:degree_p/pages/calculadora_imc.dart';
import 'package:degree_p/pages/nosotros.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'App Fitness',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //En esta parte se crea un arreglo donde va a llamar las imagenes junto con el nombre del ejercicio que muestra.
  List<Container> listamos = List();

  var arreglox = [
    {"nombre": "Crunch Invertido", "imagen": "crunch invertido.JPG", "deporte": "Entrenadores"},//{"nombre": "TRAINING", "imagen": "Intro.jpeg", "deporte": "Intro"},
    {"nombre": "Dominadas Agarre Prono", "imagen": "dominadas agarre prono.JPG", "deporte": "Entrenadores"},
    {"nombre": "TRAINING", "imagen": "Intro.jpeg", "deporte": "Entrenadores"},
    {"nombre": "TRAINING", "imagen": "Intro.jpeg", "deporte": "Entrenadores"},
    {"nombre": "TRAINING", "imagen": "Intro.jpeg", "deporte": "Entrenadores"},
    {"nombre": "TRAINING", "imagen": "Intro.jpeg", "deporte": "Entrenadores"},
  ];

// en esta parte se hace un arreglo para que haga el recorrido del listado esto se hace con un ciclo for:
// async, también hacemos un arreglo con un incremento i++

  _listado() async {
    for (var i = 0; i < arreglox.length; i++) {
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];

      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: arregloxyz['nombre'],
                child: new Material(
                  child: new InkWell(
                    onTap: () => // función cuando presiona el usuario, realiza acción tap
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Detalle(
                              nombre: arregloxyz['nombre'],
                              imagen: imagen,
                              deporte: arregloxyz['deporte']
                          ),
                        )),
                    child: new Image.asset(
                        "img/$imagen",
                        fit: BoxFit.contain
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(3.0),
              ),
              new Text(
                arregloxyz['nombre'],
                style: new TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _listado();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Healty Challenge ®'), backgroundColor: Colors.orange,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Ejercicios'),
              accountEmail: new Text('@misena.edu.co'),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('img/Intro.jpeg'),
                  )
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Calculadora"),
              trailing: new Icon(Icons.android), //new Icon(Icons.fitness_center),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => MyCalculatorApp(),
              )),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Entrenadores"),
              trailing: new Icon(Icons.stars),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => Nosotros(),
              )),
            ),
          ],
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2, //numero de columas de la primera pagina
        mainAxisSpacing: 0.1, //espacio entre card
        childAspectRatio: 0.700, //espacio del largo de cada una de las card
        children: listamos,
      ),
    );
  }

}

//creamos el metodo detalle
//este se usa cuando pulsamos para ver segunda pantalla la descripcion del ejercicio
class Detalle extends StatelessWidget {
  Detalle({this.nombre, this.imagen, this.deporte});
  final String nombre;
  final String imagen;
  final String deporte;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 387.0,//tamaño de la segunda imagen
              child: new Hero(
                tag: nombre,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$imagen",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new IniciarNombre(
            nombre: nombre,
          ),
          new IniciarIcon(),
          new Informacion(
            deporte: deporte,
          ),
        ],
      ),
    );
  }

}

class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.nombre});
  final String nombre;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nombre,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nombre\@correo.com",
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(//icono que agrega estrellas calificacion
                Icons.star,
                size: 30.0,
                color: Colors.yellow,
              ),
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.orange,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconTec(
              icon: Icons.call,
              tec: "Llamar"
          ),
          new IconTec(
              icon: Icons.message,
              tec: "WhastApp"
          ),
          new IconTec(
              icon: Icons.photo,
              tec: "Foto"
          ),
        ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.icon, this.tec});
  final IconData icon;
  final String tec;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.deporte});
  final String deporte;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            deporte,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}