import 'package:flutter/material.dart';
import 'package:screen/model/add-user.dart';
import 'package:screen/model/data.dart';
import 'package:screen/model/model.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => add(),
            ),
          );
          if (res != null) {
            final hh =
                imf(Name: res["name"].toString(), age: int.parse(res["age"]));
            setState(() {
              data.add(hh);
            });
          }
        },
        child: Icon(Icons.add),
      ),

      // appBar: AppBar(
      //   title: Text("User-Add"),
      // ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap:(){
                showDialog(context: context, builder: (context){
return AlertDialog(
  title: Text("Person Data"),
  content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data[index].Name),
                Text(data[index].age.toString()),
              ],
            ),
             actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Done"))
            ],
);
                });
              },
              title: Text(data[index].Name),
              subtitle: Text(data[index].age.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => add(
                                
                                    data: data[index],
                                    isupdate: true,
                                  )));
                      if (result != null) {
                        setState(() {
                          data[index].Name = result["name"];
                          data[index].age = int.parse(result["age"]);
                        });
                      }
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        data.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
