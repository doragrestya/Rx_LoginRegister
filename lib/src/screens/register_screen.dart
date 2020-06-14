import 'package:flutter/material.dart';
import 'package:rx_logreg/src/blocs/bloc.dart';
import 'package:rx_logreg/src/blocs/provider.dart';
import 'package:rx_logreg/src/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Center(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/gbb.jpg'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 40),
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                      letterSpacing: 10,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 150, bottom: 50, left: 20, right: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50, left: 30, right: 50, bottom: 50),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              nameField(bloc),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                              ),
                              TextField(
                                decoration: InputDecoration(hintText: 'Username'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                              ),
                              emailField(bloc),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                              ),
                              passwordField(bloc),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                              ),
                              registerButton(bloc)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget nameField(Bloc bloc) {
  return StreamBuilder(
      stream: bloc.name,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeName,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Nama Lengkap',
            errorText: snapshot.error,
          ),
        );
      });
}

Widget emailField(Bloc bloc) {
  return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            hintText: 'Email',
            errorText: snapshot.error,
          ),
        );
      });
}

Widget passwordField(Bloc bloc) {
  return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'Password',
            errorText: snapshot.error,
          ),
        );
      });
}

Widget registerButton(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.registerButton,
    builder: (context, snapshot) {
      return SizedBox(
        height: 50,
        width: 320,
        child: RaisedButton(
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    },
  );
}
