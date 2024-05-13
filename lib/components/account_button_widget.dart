import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'account_button_model.dart';
export 'account_button_model.dart';

class AccountButtonWidget extends StatefulWidget {
  const AccountButtonWidget({super.key});

  @override
  State<AccountButtonWidget> createState() => _AccountButtonWidgetState();
}

class _AccountButtonWidgetState extends State<AccountButtonWidget> {
  late AccountButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountButtonModel());
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
      buttonSize: 55.0,
      fillColor: FlutterFlowTheme.of(context).transparentColor,
      icon: Icon(
        Icons.account_circle_sharp,
        color: FlutterFlowTheme.of(context).alwaysWhite,
        size: 30.0,
      ),
      onPressed: () async {
        context.pushNamed(
          'ConfiguracionsUsuari',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.leftToRight,
            ),
          },
        );
      },
    );
  }
}
