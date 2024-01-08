import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CabecalhoHome extends StatelessWidget {
  const CabecalhoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre o Drawer
              },
              icon: const Icon(Icons.menu, size: 25.0),
              color: LightColors.kDarkBlue, // Use a cor desejada
            ),
            const Icon(Icons.search, color: LightColors.kDarkBlue, size: 25.0),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //foto perfil
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 5.0,
                animation: true,
                percent: 0.75,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: LightColors.kRed,
                backgroundColor: LightColors.kDarkYellow,
                center: const CircleAvatar(
                  backgroundColor: LightColors.kBlue,
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/88728350?s=400&u=3f1fb1f47fc18e90605ebc54b2ecddf07e528e12&v=4', // Substitua 'URL_DA_IMAGEM' pela URL da imagem da web
                  ),
                ),
              ),
              //nome e cargo
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Felipe Alves',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: LightColors.kDarkBlue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'App Developer',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
