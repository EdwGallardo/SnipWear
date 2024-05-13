import '/backend/supabase/supabase.dart';
import '/components/account_button_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pujar_descompte_widget.dart' show PujarDescompteWidget;
import 'package:flutter/material.dart';

class PujarDescompteModel extends FlutterFlowModel<PujarDescompteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDownBotiga widget.
  String? dropDownBotigaValue;
  FormFieldController<String>? dropDownBotigaValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDownBotiga widget.
  List<BotigaRow>? intBotiga;
  // State field(s) for Descripcio widget.
  FocusNode? descripcioFocusNode;
  TextEditingController? descripcioController;
  String? Function(BuildContext, String?)? descripcioControllerValidator;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<TipusDescompteRow>? intDescompte;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Model for SettingsButton component.
  late SettingsButtonModel settingsButtonModel;
  // Model for AccountButton component.
  late AccountButtonModel accountButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    settingsButtonModel = createModel(context, () => SettingsButtonModel());
    accountButtonModel = createModel(context, () => AccountButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    descripcioFocusNode?.dispose();
    descripcioController?.dispose();

    settingsButtonModel.dispose();
    accountButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
