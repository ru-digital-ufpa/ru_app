import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie asset of a broken internet connection
            Lottie.asset(
              'assets/animations/network_error.json',
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            // Text asking the user to try again later
            const Text(
              'Sem conexão com o servidor...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              semanticsLabel: 'Sem conexão com o servidor...',
            ),
            // Another text with the same message
            const Text(
              'Por favor, tente novamente mais tarde.',
              style: TextStyle(
                fontSize: 15,
              ),
              semanticsLabel: 'Por favor, tente novamente mais tarde.',
            ),
          ],
        ),
      ),
    );
  }
}
