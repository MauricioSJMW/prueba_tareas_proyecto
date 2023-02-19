// Clase para crear, listar y eliminar todas las tareas.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_proyecto_tareas/models/models.dart';
import 'package:prueba_proyecto_tareas/pages/pages.dart';
import 'package:prueba_proyecto_tareas/services/services.dart';
import 'package:prueba_proyecto_tareas/theme/app_themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TareaService())],
      child: const _ListaTareas(),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  const _ListaTareas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tareasProvider = Provider.of<TareaService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas realizadas'),
        centerTitle: true,
      ),
      //Lista que ira mstrando las tareas que se tienen hasta el momento.
      body: ListView.builder(
        itemCount: tareasProvider.tareas.length,
        itemBuilder: (BuildContext context, int index) {
          return tareasProvider.tareas.isEmpty
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _Tareas(
                    tarea: tareasProvider.tareas[index],
                  ),
                );
        },
      ),

      //Boton para agregar una tarea.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Se mando los valores que espera recivir la calse Tareas
          Tareas nuevaTarea = Tareas(
            title: '',
            isCompleted: 0,
            dueDate: null,
            comments: '',
            description: '',
            tags: '',
            token: '',
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgregarTareaPage(
                tarea: nuevaTarea,
                service: tareasProvider,
                tipo: 'Agregar tarea',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class _Tareas extends StatelessWidget {
  const _Tareas({
    Key? key,
    required this.tarea,
  }) : super(key: key);
  final Tareas tarea;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TareaService>(context);
    return Material(
      elevation: 10,
      //Gesture Detector para visualizar una tarea por id
      child: GestureDetector(
        onTap: () async {
          await provider.consultaPorId(tarea.id.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => InformacionTareaPage(
                    tarea: tarea,
                    service: provider,
                  )),
            ),
          );
        },
        
        child: ListTile(
          hoverColor: AppThemes.primary,
          leading: const Icon(Icons.home_work),
          title: Text(tarea.title),
          subtitle: tarea.isCompleted.toString() == '0'
              ? const Text('No completada')
              : const Text('Completada'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Botonque elimina tareas
              GestureDetector(
                child: const Icon(
                  Icons.delete,
                  color: Colors.blueAccent
                ),
                onTap: () {
                  provider.eliminarTarea(tarea);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
