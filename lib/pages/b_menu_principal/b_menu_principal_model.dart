import '/components/account_button_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_menu_principal_widget.dart' show BMenuPrincipalWidget;
import 'package:flutter/material.dart';

class BMenuPrincipalModel extends FlutterFlowModel<BMenuPrincipalWidget> {
  ///  Local state fields for this page.

  bool showAllOptions = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

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
    settingsButtonModel.dispose();
    accountButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
