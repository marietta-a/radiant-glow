import 'package:reflectable/reflectable.dart';
import 'package:flutter/material.dart';
import 'package:radiantglow/models/user_profile.dart';

class MyReflectable extends Reflectable{
  const MyReflectable() : super(invokingCapability);
}

const myReflectable = MyReflectable();

@myReflectable
class FormBuilder extends StatefulWidget{
  const FormBuilder({super.key});

  @override
  State<FormBuilder> createState() => _FormBuilderState();
  
  getInstance(dynamic item){
     var result = myReflectable.reflect(item);
     return result;
  }
 
}

class _FormBuilderState extends State<FormBuilder>{
  
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
   var test = widget.getInstance( UserProfile(userName: "msquad"));

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
  
}