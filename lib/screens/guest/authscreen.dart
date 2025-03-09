import "package:flutter/material.dart";
import "package:flutter_emoji/flutter_emoji.dart";

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emojiParser = EmojiParser();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.only(top: 5.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 227, 67, 101),
            title: const Text("ReDress"),
          ),
          body: Center(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "EVERY PIECE OF\n",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                    children: [
                      const TextSpan(
                          text: "CLOTHING\n",
                          style: TextStyle(
                              color: Color.fromARGB(255, 227, 67, 101))),
                      const TextSpan(text: "DESERVES\n"),
                      TextSpan(
                          text:
                              "A NEW STORY ${emojiParser.emojify(':sparkles:')}"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Yours starts here!",
                  style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //crossAxisAlignment: how the children are aligned
                  children: [
                    const Text("Enter your email:"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "ex:johnsmith@gmail.com",
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
                      onPressed: () => print("send"),
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 15.0)),
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 206, 117, 117)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
          )),
        ));
  }
}
