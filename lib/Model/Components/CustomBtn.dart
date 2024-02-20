import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {


  void Function()? onTap;
  String? text;
  Color? color;
  Color? textColor;
  Color? borderColor;
  double? btnHeight;
  double? btnWidth;
  double? borderWidth;
  BorderRadiusGeometry? borderRadius;
  IconData? icon;
  Color? iconColor;
  CustomButton({super.key,required this.text , required this.color , required this.onTap , this.borderColor , this.textColor , this.btnHeight , this.borderWidth , this.icon , this.iconColor , this.borderRadius,this.btnWidth});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: btnHeight,
        width: btnHeight,
        decoration: BoxDecoration(
          borderRadius:borderRadius,
          border: Border.all(
            color: borderColor ?? Colors.white ,
            width: borderWidth ?? 0,
          ),
          color: color,
        ),
        child: TextButton(

            onPressed: onTap,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( text ?? "No Pain No Gain",
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    )),
                if(icon!=null)
                  Icon(icon , color: iconColor,),
              ],
            )));
  }
}