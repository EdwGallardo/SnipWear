import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/account_button_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'pujar_descompte_model.dart';
export 'pujar_descompte_model.dart';

class PujarDescompteWidget extends StatefulWidget {
  const PujarDescompteWidget({
    super.key,
    required this.uploadedPicture,
  });

  final String? uploadedPicture;

  @override
  State<PujarDescompteWidget> createState() => _PujarDescompteWidgetState();
}

class _PujarDescompteWidgetState extends State<PujarDescompteWidget> {
  late PujarDescompteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PujarDescompteModel());

    _model.descripcioController ??= TextEditingController();
    _model.descripcioFocusNode ??= FocusNode();

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
          leading: wrapWithModel(
            model: _model.settingsButtonModel,
            updateCallback: () => setState(() {}),
            child: const SettingsButtonWidget(),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).transparentColor,
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.network(
                                widget.uploadedPicture!,
                                width: 150.0,
                                height: 250.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FutureBuilder<List<BotigaRow>>(
                                    future: BotigaTable().queryRows(
                                      queryFn: (q) => q
                                          .not(
                                            'nomBotiga',
                                            'is',
                                            null,
                                          )
                                          .order('nomBotiga', ascending: true),
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<BotigaRow>
                                          dropDownBotigaBotigaRowList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownBotigaValueController ??=
                                            FormFieldController<String>(null),
                                        options: dropDownBotigaBotigaRowList
                                            .map((e) => e.nomBotiga)
                                            .withoutNulls
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.dropDownBotigaValue = val);
                                          _model.intBotiga =
                                              await BotigaTable().queryRows(
                                            queryFn: (q) => q.eq(
                                              'nomBotiga',
                                              _model.dropDownBotigaValue,
                                            ),
                                          );

                                          setState(() {});
                                        },
                                        width: 300.0,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'bbwr7dgm' /* Nom de la botiga */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.descripcioController,
                                    focusNode: _model.descripcioFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        '1roige69' /* Descripció */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      alignLabelWithHint: false,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'h166gvyt' /* Descripció de l'oferta */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      prefixIcon: Icon(
                                        Icons.pending,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    maxLines: null,
                                    validator: _model
                                        .descripcioControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          'd/M/y',
                                          _model.datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        'Escull una data',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        final datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: getCurrentTimestamp,
                                          lastDate: DateTime(2050),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 32.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (datePickedDate != null) {
                                          safeSetState(() {
                                            _model.datePicked = DateTime(
                                              datePickedDate.year,
                                              datePickedDate.month,
                                              datePickedDate.day,
                                            );
                                          });
                                        }
                                      },
                                      text: '',
                                      icon: const Icon(
                                        Icons.calendar_month,
                                        size: 30.0,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.14,
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ].divide(const SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '67jwtnha' /* Tipus ofertes */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FutureBuilder<List<TipusDescompteRow>>(
                    future: TipusDescompteTable().queryRows(
                      queryFn: (q) => q
                          .not(
                            'tipus',
                            'is',
                            null,
                          )
                          .order('id', ascending: true),
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
                      List<TipusDescompteRow> dropDownTipusDescompteRowList =
                          snapshot.data!;
                      return FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(null),
                        options: dropDownTipusDescompteRowList
                            .map((e) => e.tipus)
                            .withoutNulls
                            .toList(),
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue = val);
                          _model.intDescompte =
                              await TipusDescompteTable().queryRows(
                            queryFn: (q) => q.eq(
                              'tipus',
                              _model.dropDownValue,
                            ),
                          );

                          setState(() {});
                        },
                        width: 300.0,
                        height: 56.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'wpwfof0s' /* Please select... */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
                  ),
                ),
                if (_model.dropDownValue == 'Descompte de percentatge')
                  FutureBuilder<List<TipusDescompteRow>>(
                    future: TipusDescompteTable().querySingleRow(
                      queryFn: (q) => q.eq(
                        'tipus',
                        'Descompte de percentatge',
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
                      List<TipusDescompteRow> columnTipusDescompteRowList =
                          snapshot.data!;
                      final columnTipusDescompteRow =
                          columnTipusDescompteRowList.isNotEmpty
                              ? columnTipusDescompteRowList.first
                              : null;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'c3pi0ma0' /* Percentatge descompte */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                              inactiveColor:
                                  FlutterFlowTheme.of(context).alternate,
                              min: 0.0,
                              max: 100.0,
                              value: _model.sliderValue ??= 0.0,
                              label: _model.sliderValue.toString(),
                              divisions: 100,
                              onChanged: (newValue) {
                                newValue =
                                    double.parse(newValue.toStringAsFixed(0));
                                setState(() => _model.sliderValue = newValue);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await DescompteTable().insert({
                        'createdAT':
                            supaSerialize<DateTime>(getCurrentTimestamp),
                        'descripcio': _model.descripcioController.text,
                        'urlFoto': widget.uploadedPicture,
                        'dataFi': supaSerialize<DateTime>(_model.datePicked),
                        'tipusDescompte': _model.intDescompte?.first.id,
                        'idUsuari': currentUserUid,
                        'idBotiga': _model.intBotiga?.first.id,
                      });

                      context.pushNamed(
                        'b_MenuPrincipal',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'vgjj537d' /* Pujar
 */
                      ,
                    ),
                    options: FFButtonOptions(
                      width: 120.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
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
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
