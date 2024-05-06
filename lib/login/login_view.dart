import 'package:blink_list/task/home_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey =
      GlobalKey<FormState>(); // Clé de formulaire pour la validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(),
      body: Form(
        key: _formKey, // Associer la clé de formulaire au formulaire
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            Text(
              'Welcome to ToDoList',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/images/computer_login.png',
              height: 280,
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: 400, left: 400),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // Champ de texte pour l'email
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black87,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      hintText: "Your email",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email'; // Message d'erreur si le champ est vide
                      }
                      return null;
                    },
                  ),
                  // Séparateur

                  Divider(
                    height: 10,
                  ),
                  // Champ de texte pour le mot de passe
                  TextFormField(
                    controller: _passwordController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black87,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      hintText: "Your password",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password'; // Message d'erreur si le champ est vide
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 500, right: 500),
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
                    // Vérifie si l'e-mail et le mot de passe correspondent aux valeurs spécifiques
                    if (_emailController.text == 'chams@gmail.com' &&
                        _passwordController.text == 'chams@123') {
                      // Si les valeurs correspondent, affiche un message de connexion réussie
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Connexion réussie!')),
                      );
                      // Redirige vers la page d'accueil
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      // Si les valeurs ne correspondent pas, affiche un message d'erreur
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('E-mail or password required!')),
                      );
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








// import 'package:blink_list/home_page.dart';
// import 'package:blink_list/onboarding_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class SignInPage extends StatefulWidget {
//   late bool? isObsecure;
//   TextInputType? keyboardType;
//   String? errorMessage;

//   SignInPage({Key? key, this.isObsecure, this.keyboardType, this.errorMessage});

//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final TextEditingController _emailcontroller = TextEditingController();
//   final TextEditingController _passwordcontroller = TextEditingController();
//   TextInputType? keyboardType;
//   final _formKey1 = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => OnBoardingScreen()));
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           width: size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Welcome to BlinkList",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               SvgPicture.asset(
//                 "images/login_livreur.svg",
//                 height: 100,
//               ),

//               Form(
//                   key: _formKey1,
//                   child: Column(children: [
//                     TextFormField(
//                       controller: _emailcontroller,
//                       keyboardType: keyboardType,
//                       cursorColor: Colors.black,
//                       obscureText: widget.isObsecure ?? false,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return widget.errorMessage ??
//                               'Ce champ est obligatoire';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           icon: Icon(
//                             Icons.email,
//                             color: Colors.deepPurple[50],
//                           ),
//                           hintText: "Your email",
//                           border: InputBorder.none),
//                     ),
//                     // Affichez un message sous le champ de texte indiquant s'il est rempli ou non
//                     TextFormField(
//                       controller: _passwordcontroller,
//                       keyboardType: keyboardType,
//                       cursorColor: Colors.black,
//                       obscureText: widget.isObsecure ?? true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return widget.errorMessage ??
//                               'Ce champ est obligatoire';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           icon: Icon(
//                             Icons.lock,
//                             color: Colors.deepPurple[50],
//                           ),
//                           hintText: "Your password",
//                           border: InputBorder.none),
//                     ),
//                   ])),

//               // Affichez un message sous le champ de texte indiquant s'il est rempli ou non

//               SizedBox(
//                 height: 10,
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(left: 320, right: 320),
//                 child: SizedBox(
//                   height: 60,
//                   width: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.deepPurple,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     onPressed: () {
//                       if (_formKey1.currentState!.validate()) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Connexion réussie!')),
//                         );
//                       }
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => HomePage()));
//                     },
//                     child: Text('Signin',
//                         style: TextStyle(
//                           color: Colors.white,
//                         )),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// SingleChildScrollView(
//   child: Column(
//     children: <Widget>[
//       // your widgets here
//     ],
//   ),
// )