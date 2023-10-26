import 'package:flutter/material.dart';
import 'package:screen/model/data.dart';

// class add extends StatelessWidget {
  class add extends StatelessWidget {
    final imf ? data;
  final bool isupdate;
 add({super.key, this.data, this.isupdate =false});

  TextEditingController  nameController = TextEditingController();

    TextEditingController  ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = data != null? data!.Name : "";
    ageController.text = data != null ? data!.age.toString(): "";
    return Scaffold(
      appBar: AppBar(
        title: Text(isupdate ? "Edit-User" : "Add-User-Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 250,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Name"),
            ),),
            
             SizedBox(width: 250,
            child: TextField(
              controller: ageController,
              decoration: InputDecoration(hintText: "Age"),
            ),),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              if (ageController.text.isNotEmpty && 
              ageController.text.isNotEmpty) {
                Navigator.pop(context,
{"name" : nameController.text, "age": ageController.text}

                );
                
              }

            }, child: Text(isupdate ? "Update" : "Add"),),
          ],
        ),
      ),
    );
  }
}