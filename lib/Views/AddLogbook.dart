import 'package:flutter/material.dart';
import 'package:my_andalas/Models/AddLogbookModel.dart';
import 'package:my_andalas/Services/Api.dart';

class AddLogbookForm extends StatefulWidget {
  final String supervisorId;

  const AddLogbookForm({super.key, required this.supervisorId});

  @override
  _AddLogbookFormState createState() => _AddLogbookFormState();
}

class _AddLogbookFormState extends State<AddLogbookForm> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _date;
  late String _problem;
  late String _progress;

  final Api api = Api();

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _problem = '';
    _progress = '';
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      AddLogbookModel logbook = AddLogbookModel(
        supervisorId: widget.supervisorId,
        date: _date,
        problem: _problem,
        progress: _progress,
      );

      try {
        await api.addLogbook(widget.supervisorId, logbook);
        // Logbook successfully added, you can navigate or show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logbook successfully added')),
        );
        // Optionally, navigate back to the previous screen or refresh data
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add logbook: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Logbook'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date'),
                readOnly: true,
                controller: TextEditingController(
                  text: _date.toString(),
                ),
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null && pickedDate != _date) {
                    setState(() {
                      _date = pickedDate;
                    });
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Problem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the problem';
                  }
                  return null;
                },
                onSaved: (newValue) => _problem = newValue!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Progress'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the progress';
                  }
                  return null;
                },
                onSaved: (newValue) => _progress = newValue!,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
