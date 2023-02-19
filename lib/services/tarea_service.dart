// En esta clase se realiza la conexion con el API proporcianada y se hacen las consultas

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_proyecto_tareas/models/models.dart';

class TareaService extends ChangeNotifier {
  //Como las url comienza de la misma forma se almacena la parte igual en _urlGlobal para ya no volver a escribir odo.
  static const String _urlGlobal = 'ecsdevapi.nextline.mx';
  final List<Tareas> tareas = [];
  final List<Tareas> datosPorId = [Tareas(title: '', isCompleted: 0)];
  final _url = Uri.https(_urlGlobal, 'vdev/tasks-challenge/tasks');
  static const String _token =
      'e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd';
  final Map<String, String> _header = {
    "Content-type": "application/json",
    'Accept': 'application/json',
    "Authorization": "Bearer $_token"
  };

  TareaService() {
    _listarTareas();
  }

  //Funcion que se encargara de listar  todas las tareas
  Future<void> _listarTareas() async {
    final resp = await http.get(_url, headers: _header);
    final List<dynamic> datos = json.decode(resp.body);
    for (var element in datos) {
      final tempVariable = Tareas.fromJson(element);
      tareas.add(tempVariable);
      notifyListeners();
    }
  }

  //Funcion para crear una nueva tare
  Future<void> crearTarea(Tareas tareaAdd) async {
    final resp = await http.post(
      _url,
      headers: _header,
      body: json.encode(tareaAdd),
    );
    final Map<String, dynamic> datos = json.decode(resp.body);
    //Datos que se esperan mandar
    Tareas nuevaTarea = Tareas(
      id: datos['task']['id'],
      title: datos['task']['title'],
      isCompleted: datos['task']['is_completed'],
      dueDate: datos['task']['due_date'],
    );
    if (resp.statusCode == 201 || resp.statusCode == 200) {
      tareas.add(nuevaTarea);
      notifyListeners();
    }
  }

  //Funcion para eliminar tarea seleccionada
  Future<void> eliminarTarea(Tareas tareaAdd) async {
    int? idElimiar = tareaAdd.id;
    final url = Uri.https(_urlGlobal, 'vdev/tasks-challenge/tasks/$idElimiar');
    final resp = await http.delete(url, headers: _header);
    if (resp.statusCode == 201 || resp.statusCode == 200) {
      for (int i = 0; i < tareas.length; i++) {
        if (idElimiar == tareas[i].id) {
          tareas.remove(tareas[i]);
        }
      }
      notifyListeners();
    }
  }

  //Funcion para consultar una taea seleccionada
  Future<void> consultaPorId(String id) async {
    if (id.isNotEmpty) {
      final url = Uri.https(_urlGlobal, 'vdev/tasks-challenge/tasks/$id');
      final resp = await http.get(url, headers: _header);
      final List<dynamic> datos = json.decode(resp.body);
      for (var element in datos) {
        if (resp.statusCode == 201 || resp.statusCode == 200) {
          final tempVariable = Tareas.fromJson(element);
          datosPorId[0] = tempVariable;
        }
      }
      notifyListeners();
    }
  }

  //Funcion para editar tareas
  Future<void> editarTarea(String id, Tareas tareaAdd) async {
    final url = Uri.https(_urlGlobal, 'vdev/tasks-challenge/tasks/$id');
    final resp =
        await http.put(url, headers: _header, body: json.encode(tareaAdd));
    if (resp.statusCode == 201 || resp.statusCode == 200) {
      for (int i = 0; i < tareas.length; i++) {
        if (tareaAdd.id == tareas[i].id) {
          tareas[i] = tareaAdd;
        }
      }
      notifyListeners();
    }
  }
}
