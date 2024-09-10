import 'package:audio_player/config/colors.dart';
import 'package:audio_player/controller/song_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SongControlSound extends StatelessWidget {
  const SongControlSound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Obx(
      () => SfRadialGauge(
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
            maximum: 1,
            minimum: 0,
            showAxisLine: true,
            showLabels: false,
            showTicks: false,
            ranges: [
              GaugeRange(
                startValue: 0,
                endValue: songPlayerController.volumeLevel.value,
                color: primaryColor,
                startWidth: 10,
                endWidth: 10,
              ),
            ],
            pointers: [
              MarkerPointer(
                color: primaryColor,
                borderWidth: 20,
                value: songPlayerController.volumeLevel.value,
                onValueChanged: (newValue) {
                  songPlayerController.changeVolume(newValue);
                },
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
      ),
    );
  }
}
