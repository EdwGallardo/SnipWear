import 'package:snip_wear/app_state.dart';

import '/backend/supabase/supabase.dart';
import '/components/account_button_widget.dart';
import '/components/return_home_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'discount_selector_model.dart';
export 'discount_selector_model.dart';

class DiscountSelectorWidget extends StatefulWidget {
  const DiscountSelectorWidget({super.key});

  @override
  State<DiscountSelectorWidget> createState() => _DiscountSelectorWidgetState();
}

class _DiscountSelectorWidgetState extends State<DiscountSelectorWidget> {
  late DiscountSelectorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscountSelectorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: Opacity(
            opacity: 0.0,
            child: wrapWithModel(
              model: _model.settingsButtonModel,
              updateCallback: () => setState(() {}),
              child: const SettingsButtonWidget(),
            ),
          ),
          title: wrapWithModel(
            model: _model.returnHomeModel,
            updateCallback: () => setState(() {}),
            child: const ReturnHomeWidget(),
          ),
          actions: [
            wrapWithModel(
              model: _model.accountButtonModel,
              updateCallback: () => setState(() {}),
              child: const AccountButtonWidget(),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('Ranking');
                        },
                        text: FFLocalizations.of(context).getText(
                          'jnvvgoky' /* Rankings */,
                        ),
                        icon: const Icon(
                          Icons.grade,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'kztpys8p' /* Percentatge mínim de descompte */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 10.0, 0.0, 10.0),
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primary,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 0.0,
                    max: 100.0,
                    value: _model.sliderValue ??= 1.0,
                    label: _model.sliderValue.toString(),
                    divisions: 100,
                    onChanged: null,
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '21y59p07' /* Altres ofertes */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FutureBuilder<List<TipusDescompteRow>>(
                    future: TipusDescompteTable().queryRows(
                      queryFn: (q) => q,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<TipusDescompteRow> listViewTipusDescompteRowList =
                          snapshot.data!;
                      listViewTipusDescompteRowList
                          .sort((a, b) => a.id.compareTo(b.id));
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTipusDescompteRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTipusDescompteRow =
                              listViewTipusDescompteRowList[listViewIndex];
                          return Theme(
                            data: ThemeData(
                              checkboxTheme: const CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValueMap[
                                      listViewTipusDescompteRow] ??=
                                  FFAppState()
                                      .discountFilter
                                      .contains(listViewIndex),
                              onChanged: (newValue) async {
                                setState(() => _model.checkboxListTileValueMap[
                                    listViewTipusDescompteRow] = newValue!);
                                if (FFAppState()
                                    .discountFilter
                                    .contains(listViewIndex)) {
                                  FFAppState()
                                      .discountFilter
                                      .remove(listViewIndex);
                                } else {
                                  FFAppState()
                                      .discountFilter
                                      .add(listViewIndex);
                                }
                                print(FFAppState().discountFilter);
                              },
                              title: Text(
                                listViewTipusDescompteRow.tipus!,
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                              tileColor:
                                  FlutterFlowTheme.of(context).transparentColor,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
