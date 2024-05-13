import 'package:snip_wear/app_state.dart';

import '/backend/supabase/supabase.dart';
import '/components/account_button_widget.dart';
import '/components/return_home_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'discount_selector_widget.dart' show DiscountSelectorWidget;
import 'package:flutter/material.dart';

class DiscountSelectorModel extends FlutterFlowModel<DiscountSelectorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SettingsButton component.
  late SettingsButtonModel settingsButtonModel;
  // Model for AccountButton component.
  late AccountButtonModel accountButtonModel;
  // Model for ReturnHome component.
  late ReturnHomeModel returnHomeModel;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for CheckboxListTile widget.

  Map<TipusDescompteRow, bool> checkboxListTileValueMap = {};

  List<TipusDescompteRow> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

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
