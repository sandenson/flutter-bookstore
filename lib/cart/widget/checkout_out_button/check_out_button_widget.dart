import 'package:flutter/material.dart';

class CheckOutButtonWidget extends StatelessWidget {
  const CheckOutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(color: Colors.white),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(40, 40))),
              onPressed: () => {},
              child: Text(
                'FINALIZAR PEDIDO',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
