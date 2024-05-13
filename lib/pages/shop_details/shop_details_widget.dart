import 'package:snip_wear/flutter_flow/flutter_flow_icon_button.dart';

import 'qr_generator.dart';

import '/backend/supabase/supabase.dart';
import '/components/account_button_widget.dart';
import '/components/return_home_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'shop_details_model.dart';
export 'shop_details_model.dart';

class ShopDetailsWidget extends StatefulWidget {
  const ShopDetailsWidget({
    super.key,
    int? idBotiga,
  }) : idBotiga = idBotiga ?? 0;

  final int idBotiga;

  @override
  State<ShopDetailsWidget> createState() => _ShopDetailsWidgetState();
}

class _ShopDetailsWidgetState extends State<ShopDetailsWidget> {
  late ShopDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopDetailsModel());
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
          leading: wrapWithModel(
            model: _model.settingsButtonModel,
            updateCallback: () => setState(() {}),
            child: const SettingsButtonWidget(),
          ),
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                setState(() {
                  _model.likeButtonPressed = false;
                });
              },
              child: wrapWithModel(
                model: _model.returnHomeModel,
                updateCallback: () => setState(() {}),
                child: const ReturnHomeWidget(),
              ),
            ),
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
          child: FutureBuilder<List<BotigaRow>>(
            future: BotigaTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                widget.idBotiga,
              ),
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
              List<BotigaRow> columnDescompteBotigaRowList = snapshot.data!;
              final columnDescompteBotigaRow =
                  columnDescompteBotigaRowList.isNotEmpty
                      ? columnDescompteBotigaRowList.first
                      : null;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 385.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          columnDescompteBotigaRow!.urlFoto!,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .transparentColor,
                                    borderRadius: 60.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.qr_code_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .alwaysWhite,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      var idBotiga = widget.idBotiga;
                                      Widget qrWidget = QRGenerator.generateQR(
                                          idBotiga.toString(), context);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            content: qrWidget,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Text(
                                valueOrDefault<String>(
                                  columnDescompteBotigaRow.nomBotiga,
                                  'Descripcio desconeguda',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 20.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FutureBuilder<List<DescompteRow>>(
                                future: DescompteTable().queryRows(
                                  queryFn: (q) => q.eq(
                                    'idBotiga',
                                    widget.idBotiga,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<DescompteRow> listViewDescompteRowList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewDescompteRowList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewDescompteRow =
                                          listViewDescompteRowList[
                                              listViewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'VeureDescompte',
                                            queryParameters: {
                                              'idDescompte': serializeParam(
                                                listViewDescompteRow.id,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .topToBottom,
                                              ),
                                            },
                                          );
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.discount_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          title: Text(
                                            listViewDescompteRow.descripcio!,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                          subtitle: Text(
                                            dateTimeFormat(
                                              'd/M/y',
                                              listViewDescompteRow.dataFi!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ).maybeHandleOverflow(
                                              maxChars: 20,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          dense: false,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
