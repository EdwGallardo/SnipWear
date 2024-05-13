import '/backend/supabase/supabase.dart';
import '/components/account_button_widget.dart';
import '/components/return_home_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'veure_descompte_model.dart';
export 'veure_descompte_model.dart';

class VeureDescompteWidget extends StatefulWidget {
  const VeureDescompteWidget({
    super.key,
    int? idDescompte,
  }) : idDescompte = idDescompte ?? 0;

  final int idDescompte;

  @override
  State<VeureDescompteWidget> createState() => _VeureDescompteWidgetState();
}

class _VeureDescompteWidgetState extends State<VeureDescompteWidget> {
  late VeureDescompteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VeureDescompteModel());
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
          child: FutureBuilder<List<DescompteRow>>(
            future: DescompteTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                widget.idDescompte,
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
              List<DescompteRow> columnDescompteDescompteRowList =
                  snapshot.data!;
              final columnDescompteDescompteRow =
                  columnDescompteDescompteRowList.isNotEmpty
                      ? columnDescompteDescompteRowList.first
                      : null;
              return Column(
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Stack(
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
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          columnDescompteDescompteRow!.urlFoto!,
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
                                      Icons.shopping_bag,
                                      color: FlutterFlowTheme.of(context)
                                          .alwaysWhite,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'ShopDetails',
                                        queryParameters: {
                                          'idBotiga': serializeParam(
                                            columnDescompteDescompteRow
                                                .idBotiga,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Text(
                              valueOrDefault<String>(
                                columnDescompteDescompteRow.descripcio,
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '723l3y6m' /* Data final:  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    'd/M/y',
                                    columnDescompteDescompteRow.dataFi!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 20.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: FutureBuilder<List<TipusDescompteRow>>(
                              future: TipusDescompteTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  columnDescompteDescompteRow.tipusDescompte,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TipusDescompteRow>
                                    rowTipusDescompteRowList = snapshot.data!;
                                final rowTipusDescompteRow =
                                    rowTipusDescompteRowList.isNotEmpty
                                        ? rowTipusDescompteRowList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'r7jm18wp' /* Tipus: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        rowTipusDescompteRow?.tipus,
                                        'Desconegut',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: FutureBuilder<List<UsuarisRow>>(
                      future: UsuarisTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'id',
                          columnDescompteDescompteRow.idUsuari,
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
                        List<UsuarisRow> rowUsuarisRowList = snapshot.data!;
                        final rowUsuarisRow = rowUsuarisRowList.isNotEmpty
                            ? rowUsuarisRowList.first
                            : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).transparentColor,
                              borderRadius: 35.0,
                              borderWidth: 0.0,
                              buttonSize: 70.0,
                              fillColor: const Color(0xFFA7203C),
                              disabledColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              disabledIconColor:
                                  FlutterFlowTheme.of(context).alwaysWhite,
                              icon: Icon(
                                Icons.favorite_border,
                                color: FlutterFlowTheme.of(context).alwaysWhite,
                                size: 40.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: _model.likeButtonPressed
                                  ? null
                                  : () async {
                                      await UsuarisTable().update(
                                        data: {
                                          'total_likes':
                                              (rowUsuarisRow!.totalLikes!) + 1,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          columnDescompteDescompteRow.idUsuari,
                                        ),
                                      );
                                      setState(() {
                                        _model.likeButtonPressed = true;
                                      });
                                    },
                            ),
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).transparentColor,
                              borderRadius: 35.0,
                              borderWidth: 0.0,
                              buttonSize: 70.0,
                              fillColor: const Color(0xFFA7203C),
                              icon: Icon(
                                Icons.error_outline,
                                color: FlutterFlowTheme.of(context).alwaysWhite,
                                size: 40.0,
                              ),
                              onPressed: () {
                                print('ReportButton pressed ...');
                              },
                            ),
                          ].divide(const SizedBox(width: 20.0)),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
