import 'package:flutter/material.dart';

class UpdateView extends StatefulWidget {
  final String id;

  const UpdateView({Key? key, required this.id}) : super(key: key);
  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              height: 50), // Ajoute un espace entre l'app bar et le conteneur
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: _textEditingController,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.edit,
                  color: Colors.black87,
                  size: 18,
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 25,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: "Edit todo item",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
              height:
                  20), // Ajoute un espace entre le champ de texte et le bouton
          Padding(
            padding: const EdgeInsets.only(left: 320, right: 320),
            child: SizedBox(
              height: 60,
              width: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  String newText = _textEditingController.text;
                  Navigator.pop(context,
                      newText); // Retourne le nouveau texte à l'écran précédent
                },
                child: Text('Edit todo item',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
