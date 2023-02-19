
//En esta clase se va a validar el formulario 
import 'package:flutter/cupertino.dart';
import 'package:prueba_proyecto_tareas/models/models.dart';

class FormService extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Tareas tarea;
  bool valorVista = false;
  FormService(this.tarea);

  updateAvailability(bool value) {
    int valor1;
    if (value == true) {
      valorVista = true;
      valor1 = 1;
      tarea.isCompleted = valor1;
      notifyListeners();
    } else {
      valorVista = false;
      valor1 = 0;
      tarea.isCompleted = valor1;
      notifyListeners();
    }
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
