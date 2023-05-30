import 'package:flutter/material.dart';

class DialogConnectionStatus extends StatelessWidget {
  const DialogConnectionStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 256,
              color: Colors.white,
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: (){},
              child: const Text("OK"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      )
                  )
              )
            )
          ],
        ),
      ),
    );
  }
}
