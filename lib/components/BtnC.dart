import 'package:flutter/material.dart';
class BtnC extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? colorTitle;
  final Color? colorBorderSide;
  final Color? overlayColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Function? onTap;
  final double radius;
  final Widget? leftChild;
  final Widget? rightChild;
  final bool isExpanded;
  final bool isActive;
  final bool inverse;
  final bool inverseWithBorder;
  final bool isCloseKeyboard;

  const BtnC({
    super.key,
    this.title = 'Aceptar',
    this.color,
    this.colorTitle,
    this.overlayColor,
    this.height = 55.0,
    this.width = 450.0,
    this.textStyle,
    this.onTap,
    this.radius = 10.0,
    this.colorBorderSide,
    this.leftChild,
    this.rightChild,
    this.isExpanded = true,
    this.isActive = true,
    this.inverse = false,
    this.inverseWithBorder = false,
    this.isCloseKeyboard = true,
  });

  @override
  Widget build(BuildContext context) {
    var colorAux = isActive ? primaryColor : primaryColor.withOpacity(0.4);
    var colorBorderAux = colorAux;
    if (inverse || inverseWithBorder) {
      colorAux = Colors.transparent;
      if (!inverseWithBorder) colorBorderAux = Colors.transparent;
    }
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(color ?? colorAux),
          overlayColor: MaterialStateProperty.all(overlayColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: colorBorderSide ?? colorBorderAux,
            ),
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftChild != null) leftChild!,
            if (isExpanded) ...[Expanded(child: texBtn())] else ...[texBtn()],
            if (rightChild != null) rightChild!,
          ],
        ),
        onPressed: () {
          if (isCloseKeyboard) closeKeyboard(context);
          if (onTap != null) onTap!();
        },
      ),
    );
  }

  Widget texBtn() {
    var colorTitleAux = colorTitle ?? Colors.white;
    if (inverse || inverseWithBorder) colorTitleAux = primaryColorContext();
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: textStyle ??
            TextStyle(
              color: colorTitleAux,
              fontSize: 18.0,
            ),
      ),
    );
  }
}