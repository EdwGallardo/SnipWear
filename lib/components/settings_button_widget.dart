import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'settings_button_model.dart';
export 'settings_button_model.dart';

class SettingsButtonWidget extends StatefulWidget {
  const SettingsButtonWidget({super.key});

  @override
  State<SettingsButtonWidget> createState() => _SettingsButtonWidgetState();
}

class _SettingsButtonWidgetState extends State<SettingsButtonWidget> {
  late SettingsButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: FlutterFlowTheme.of(context).transparentColor,
      borderRadius: 20.0,
      borderWidth: 1.0,
      buttonSize: double.infinity,
      fillColor: FlutterFlowTheme.of(context).transparentColor,
      icon: Icon(
        Icons.settings,
        color: FlutterFlowTheme.of(context).alwaysWhite,
        size: 30.0,
      ),
      onPressed: () async {
        context.pushNamed(
          'DiscountSelector',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.rightToLeft,
            ),
          },
        );
      },
    );
  }
}
