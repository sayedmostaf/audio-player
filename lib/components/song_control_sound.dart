import 'package:audio_player/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SongControlSound extends StatelessWidget {
  const SongControlSound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var value = 30.0;
    return SfRadialGauge(
      animationDuration: 1,
      enableLoadingAnimation: true,
      axes: [
        RadialAxis(
          useRangeColorForAxis: true,
          startAngle: 0,
          endAngle: 180,
          canRotateLabels: false,
          interval: 10,
          isInversed: false,
          maximum: 100,
          minimum: 0,
          showAxisLine: true,
          showLabels: false,
          showTicks: false,
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: value.toDouble(),
              color: primaryColor,
              startWidth: 10,
              endWidth: 10,
            ),
          ],
          pointers: [
            MarkerPointer(
              color: primaryColor,
              borderWidth: 20,
              value: value.toDouble(),
              onValueChanged: (newValue) {},
              enableAnimation: true,
              enableDragging: true,
              markerType: MarkerType.circle,
              markerWidth: 10,
              markerHeight: 10,
            ),
          ],
          annotations: [
            GaugeAnnotation(
              horizontalAlignment: GaugeAlignment.center,
              positionFactor: 0.02,
              widget: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/cover.jpg'),
                  ),
                  color: divColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
