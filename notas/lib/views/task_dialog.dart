import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskDialog extends StatefulWidget {
  final Task task;

  TaskDialog({this.task});

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Task _currentTask = Task();

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _currentTask = Task.fromMap(widget.task.toMap());
    }

    _titleController.text = _currentTask.title;
    _descriptionController.text = _currentTask.description;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.clear();
    _descriptionController.clear();
  }

  Widget buildtextField({TextEditingController controller, String labelText, String validatorMessage, bool autoFocus}){
      return 
       TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: labelText),
              autofocus: autoFocus,
              validator: (text) {
                return text.isEmpty ? validatorMessage : null;
              }
      ); 
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task == null ? 'Nova tarefa' : 'Editar tarefas'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildtextField(controller: _titleController, labelText: 'Título', validatorMessage: 'Insira o título', autoFocus: true),
                buildtextField(controller: _titleController, labelText: 'Descrição', validatorMessage: 'Insira a descrição', autoFocus:true),
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      setState(() {
                        _currentTask.title = _titleController.value.text;
                        _currentTask.description = _descriptionController.text;
                        Navigator.of(context).pop(_currentTask);
                      });
                    }
                  },
                ),
              ],
            ),
          ) 
        ],
        
      
      ),
    );
  }
}
