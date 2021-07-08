import 'package:flutter/material.dart';

class CustomBottomButton extends StatelessWidget {
  String title = '';
  IconData button_icon = null;
  Color custom_color = Colors.blue;

  CustomBottomButton(title, IconData button_icon, [color]) {
    this.title = title;
    this.button_icon = button_icon;
    color != null ? this.custom_color = color : this.custom_color;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: new BoxDecoration(
                  color: custom_color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  // color: HexColor('#D60812'),
                ),
                padding: EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        // color: HexColor('#D60812'),
                      ),
                      child: Icon(
                        button_icon,
                        size: 18,
                        color: custom_color,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
