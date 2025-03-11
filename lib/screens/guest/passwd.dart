import 'package:flutter/material.dart';

class PasswdScreen extends StatefulWidget {
  final Function(int) onchangedStep;
  const PasswdScreen({super.key, required this.onchangedStep});

  @override
  State<PasswdScreen> createState() => _PasswdScreenState();
}

class _PasswdScreenState extends State<PasswdScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isSecret = true;
  String _passwd = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => widget.onchangedStep(0),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Text(
                "password".toUpperCase(),
                style: const TextStyle(fontSize: 30.0),
              ),
              const SizedBox(height: 50.0),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //crossAxisAlignment: how the children are aligned
                    children: [
                      const Text(
                        "Enter your password:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() {
                          _passwd = value;
                        }),
                        validator: (value) => value!.isEmpty
                            ? "Password cannot be empty"
                            : value.length < 6
                                ? "Password must be at least 6 characters"
                                : null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_isSecret
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isSecret = !_isSecret;
                              });
                            },
                          ),
                          hintText: "ex:acft345@",
                          hintStyle: const TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            debugPrint(_passwd);
                          }
                        },
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 15.0)),
                          backgroundColor:
                              WidgetStateProperty.resolveWith((states) {
                            if (_passwd.length < 6 || _passwd.isEmpty) {
                              return Colors.grey;
                            }
                            return Theme.of(context).primaryColor;
                          }),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          elevation: WidgetStateProperty.all(0.0),
                        ),
                        child: const Text("CONTINUE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
