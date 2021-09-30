import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/utils/colors.dart';

class DisconnectButton extends StatelessWidget {
  final VoidCallback? onTap;
  const DisconnectButton({
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          'Desconectar',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
    );
  }
}
