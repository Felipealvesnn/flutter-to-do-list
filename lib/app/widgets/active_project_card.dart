import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveProjectsCard extends StatelessWidget {
  final Color? cardColor;
  final double? loadingPercent;
  final String? title;
  final String? subtitle;

  const ActiveProjectsCard({
    super.key,
    this.cardColor,
    this.loadingPercent,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(15.0),
        height: 200,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: CircularPercentIndicator(
                animation: true,
                radius: 60,
                percent: loadingPercent!,
                lineWidth: 5.0,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.white10,
                progressColor: Colors.white,
                center: Text(
                  '${(loadingPercent! * 100).round()}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            
            Expanded(
              // Adicione um Expanded
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 150, // Defina um maxWidth adequado
                    child: Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Adiciona reticências no final do texto
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white54,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
