import 'package:flutter/material.dart';
import 'package:trogontask/controller/api_service_provider.dart';
import 'package:trogontask/helpers/app_colors.dart';

class CoinContainer extends StatelessWidget {
  ApiServiceProvider provider;
   CoinContainer({
    super.key,
    required this.provider
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.coinBackgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              '${provider.user?.coins ?? ''}',
              style: TextStyle(
                  color: Color.fromARGB(
                      255, 225, 135, 10)),
            ),
          ),
          Image.asset('assets/coin.png'),
        ],
      ),
    );
  }
}