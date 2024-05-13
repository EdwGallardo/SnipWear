import '/components/account_button_widget.dart';
import '/components/return_home_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'configuracions_usuari_widget.dart' show ConfiguracionsUsuariWidget;
import 'package:flutter/material.dart';

class ConfiguracionsUsuariModel
    extends FlutterFlowModel<ConfiguracionsUsuariWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TxbName widget.
  FocusNode? txbNameFocusNode;
  TextEditingController? txbNameController;
  String? Function(BuildContext, String?)? txbNameControllerValidator;
  // State field(s) for TxbSurname widget.
  FocusNode? txbSurnameFocusNode;
  TextEditingController? txbSurnameController;
  String? Function(BuildContext, String?)? txbSurnameControllerValidator;
  // State field(s) for TxbEmail widget.
  FocusNode? txbEmailFocusNode;
  TextEditingController? txbEmailController;
  String? Function(BuildContext, String?)? txbEmailControllerValidator;
  // State field(s) for TxbPassword widget.
  FocusNode? txbPasswordFocusNode;
  TextEditingController? txbPasswordController;
  late bool txbPasswordVisibility;
  String? Function(BuildContext, String?)? txbPasswordControllerValidator;
  // State field(s) for TxbPasswordBis widget.
  FocusNode? txbPasswordBisFocusNode;
  TextEditingController? txbPasswordBisController;
  late bool txbPasswordBisVisibility;
  String? Function(BuildContext, String?)? txbPasswordBisControllerValidator;
  // Stores action output result for [Custom Action - updatePassword] action in BtnGuardar widget.
  bool? resultChange;
  // Model for SettingsButton component.
  late SettingsButtonModel settingsButtonModel;
  // Model for AccountButton component.
  late AccountButtonModel accountButtonModel;
  // Model for ReturnHome component.
  late ReturnHomeModel returnHomeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    txbPasswordVisibility = false;
    txbPasswordBisVisibility = false;
    settingsButtonModel = createModel(context, () => SettingsButtonModel());
    accountButtonModel = createModel(context, () => AccountButtonModel());
    returnHomeModel = createModel(context, () => ReturnHomeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txbNameFocusNode?.dispose();
    txbNameController?.dispose();

    txbSurnameFocusNode?.dispose();
    txbSurnameController?.dispose();

    txbEmailFocusNode?.dispose();
    txbEmailController?.dispose();

    txbPasswordFocusNode?.dispose();
    txbPasswordController?.dispose();

    txbPasswordBisFocusNode?.dispose();
    txbPasswordBisController?.dispose();

    settingsButtonModel.dispose();
    accountButtonModel.dispose();
    returnHomeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
