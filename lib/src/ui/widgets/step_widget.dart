import 'package:flutter/material.dart';

import 'package:flutter_installer/src/ui/global/app_colors.dart';
import 'package:flutter_installer/src/ui/global/ui_helpers.dart';

enum StepWidgetState {
  done,
  doing,
  notDone,
}

class StepWidget extends StatelessWidget {
  const StepWidget({
    super.key,
    required this.stepName,
    required this.stepState,
  });

  final String stepName;
  final StepWidgetState stepState;

  static Widget _buildStepIcon(
    BuildContext context,
    StepWidgetState state,
  ) {
    switch (state) {
      case StepWidgetState.done:
        return Icon(
          Icons.done,
          size: blockSize(context) * 3,
          color: Theme.of(context).colorScheme.primary,
        );
      case StepWidgetState.doing:
        return Icon(
          Icons.fiber_manual_record,
          size: blockSize(context) * 3,
          color: Theme.of(context).colorScheme.primary,
        );
      case StepWidgetState.notDone:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: blockSize(context) * 1.5,
        horizontal: blockSize(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: blockSize(context) * 4,
            height: blockSize(context) * 4,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                _buildStepIcon(context, stepState),
              ],
            ),
          ),
          SizedBox(width: blockSize(context) * 3),
          Text(
            stepName,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: blockSize(context) * 2,
              fontWeight: FontWeight.bold,
              color: textColorWhite,
            ),
          ),
        ],
      ),
    );
  }
}