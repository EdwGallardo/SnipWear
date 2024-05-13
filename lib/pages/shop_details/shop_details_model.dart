import '/components/account_button_widget.dart';
import '/components/return_home_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shop_details_widget.dart' show ShopDetailsWidget;
import 'package:flutter/material.dart';

class ShopDetailsModel extends FlutterFlowModel<ShopDetailsWidget> {
  ///  Local state fields for this page.

  bool likeButtonPressed = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SettingsButton component.
  late SettingsButtonModel settingsButtonModel;
  // Model for AccountButton component.
  late AccountButtonModel accountButtonModel;
  // Model for ReturnHome component.
  late ReturnHomeModel returnHomeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    settingsButtonModel = createModel(context, () => SettingsButtonModel());
    accountButtonModel = createModel(context, () => AccountButtonModel());
    returnHomeModel = createModel(context, () => ReturnHomeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    settingsButtonModel.dispose();
    accountButtonModel.dispose();
    returnHomeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
