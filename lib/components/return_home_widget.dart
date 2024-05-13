import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'return_home_model.dart';
export 'return_home_model.dart';

class ReturnHomeWidget extends StatefulWidget {
  const ReturnHomeWidget({super.key});

  @override
  State<ReturnHomeWidget> createState() => _ReturnHomeWidgetState();
}

class _ReturnHomeWidgetState extends State<ReturnHomeWidget> {
  late ReturnHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReturnHomeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: FlutterFlowIconButton(
        borderColor: FlutterFlowTheme.of(context).transparentColor,
        borderRadius: 20.0,
        borderWidth: 1.0,
        buttonSize: 60.0,
        fillColor: FlutterFlowTheme.of(context).transparentColor,
        icon: Icon(
          Icons.home_rounded,
          color: FlutterFlowTheme.of(context).alwaysWhite,
          size: 32.0,
        ),
        onPressed: () async {
          context.pushNamed(
            'b_MenuPrincipal',
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
              ),
            },
          );
        },
      ),
    );
  }
}
