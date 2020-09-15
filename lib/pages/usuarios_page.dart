import 'package:flutter/material.dart';
import 'package:mimessenger/models/usuarios.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key key}) : super(key: key);

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = [
    Usuario(
        uid: '1', nombre: 'Carlos', email: 'balfaz@gmail.com', online: true),
    Usuario(uid: '2', nombre: 'Yaleidy', email: 'yale@gmail.com', online: true),
    Usuario(
        uid: '3', nombre: 'Samuel', email: 'samuel@gmail.com', online: false),
    Usuario(uid: '4', nombre: 'Adrian', email: 'adrian@gmail.com', online: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'User Name',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 2,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              onPressed: () {}),
          actions: [
            Container(
              child: Icon(
                Icons.check_circle,
                color: Colors.blue[400],
              ),
              /* child: Icon(
              Icons.offline_bolt,
              color: Colors.red[400],
            ) ,*/
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          child: _ListViewUsuarios(),
          enablePullDown: true,
          header: WaterDropHeader(
            complete: Icon(
              Icons.check,
              color: Colors.blue[400],
            ),
            waterDropColor: Colors.blue[400],
          ),
          onRefresh: _cargarUsuarios,
        ));
  }

  ListView _ListViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2)),
      ),
      trailing: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(100)),
      ),
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}
