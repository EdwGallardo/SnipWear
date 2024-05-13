import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:provider/provider.dart';
import 'package:snip_wear/app_state.dart';
import 'package:snip_wear/flutter_flow/flutter_flow_drop_down.dart';

import '/backend/supabase/supabase.dart';
import '/components/account_button_widget.dart';
import '/components/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'b_menu_principal_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as LatLongReal;
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'QRScanner.dart';
export 'b_menu_principal_model.dart';

class BMenuPrincipalWidget extends StatefulWidget {
  const BMenuPrincipalWidget({super.key});

  @override
  State<BMenuPrincipalWidget> createState() => _BMenuPrincipalWidgetState();
}

class _BMenuPrincipalWidgetState extends State<BMenuPrincipalWidget> {
  late BMenuPrincipalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BMenuPrincipalModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    FlutterMap(
                      options: const MapOptions(
                        initialCenter: LatLongReal.LatLng(
                            41.394781652847115, 2.1279228488718807),
                        initialZoom: 17.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://api.mapbox.com/styles/v1/spacesky/clu1f1u2l00og01qsb4ru1gd6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic3BhY2Vza3kiLCJhIjoiY2x1MWV2MXVtMGtodTJxb2FvdTJqY3Y0MyJ9.G1Z9pqkbx_gF4ssIvnbzCw',
                          userAgentPackageName: 'com.example.app',
                        ),
                        CurrentLocationLayer(
                          style: LocationMarkerStyle(
                            accuracyCircleColor: FlutterFlowTheme.of(context)
                                .secondary
                                .withOpacity(0.5),
                            headingSectorColor:
                                FlutterFlowTheme.of(context).primary,
                            headingSectorRadius: 80,
                            marker: DefaultLocationMarker(
                              color: Color(0xFFFEC24B),
                            ),
                            markerDirection: MarkerDirection.heading,
                          ),
                        ),
                        FutureBuilder<List<Marker>>(
                            future: getListOfBotigas(context),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return MarkerLayer(rotate: true, markers: []);
                              } else {
                                return MarkerLayer(
                                    rotate: true, markers: snapshot.data!);
                              }
                            } //AQUI
                            ),
                        SimpleAttributionWidget(
                          backgroundColor: Color(0xFFA7203C),
                          source: Text('OpenStreetMap contributors'),
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).secondary,
                          borderRadius: 40.0,
                          borderWidth: 0.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.qr_code_scanner_rounded,
                            color: FlutterFlowTheme.of(context).alwaysWhite,
                            size: 25.0,
                          ),
                          onPressed: () async {
                            // Este botón abrirá la cámara para escanear un código QR
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QRScannerWidget(),
                              ),
                            );
                            if (result != null) {
                              Uri? uri = Uri.tryParse(result);
                              if (uri != null &&
                                  uri.scheme == 'snipwear' &&
                                  uri.host == 'www.snipwear') {
                                String? shopId =
                                    uri.queryParameters['idBotiga'];
                                if (shopId != null && isNumeric(shopId)) {
                                  int intValue = int.parse(shopId);
                                  // Abrir ShopDetails con el ID de la tienda
                                  context.pushNamed(
                                    'ShopDetails',
                                    queryParameters: {
                                      'idBotiga': serializeParam(
                                        intValue,
                                        ParamType.int,
                                      )
                                    },
                                  );
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Resultado'),
                                      content: Text(result),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cerrar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).secondary,
                          borderRadius: 50.0,
                          borderWidth: 0.0,
                          buttonSize: 60.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.add_location_rounded,
                            color: FlutterFlowTheme.of(context).alwaysWhite,
                            size: 40.0,
                          ),
                          onPressed: () async {
                            setState(() {
                              _model.showAllOptions = true;
                            });
                          },
                        ),
                      ),
                    ),
                    Align(
                        alignment: const AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: FFAppState()
                                  .discountFilter
                                  .map((e) => Card(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        child: SizedBox(
                                            width: 50.0,
                                            height: 20.0,
                                            child: Center(
                                              child: Text(
                                                indexToShortCode(e),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alwaysWhite,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                              ),
                                            )),
                                      ))
                                  .toList(),
                            ))),
                    if (_model.showAllOptions == true)
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 120.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: 50.0,
                                    borderWidth: 0.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: FlutterFlowTheme.of(context)
                                          .alwaysWhite,
                                      size: 40.0,
                                    ),
                                    onPressed: () async {
                                      final selectedMedia = await selectMedia(
                                        storageFolderPath: 'descomptes',
                                        maxWidth: 1000.00,
                                        maxHeight: 1000.00,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading1 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls =
                                              await uploadSupabaseStorageFiles(
                                            bucketName: 'descomptes',
                                            selectedFiles: selectedMedia,
                                          );
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading1 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile1 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl1 =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      context.goNamed(
                                        'PujarDescompte',
                                        queryParameters: {
                                          'uploadedPicture': serializeParam(
                                            _model.uploadedFileUrl1,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: 50.0,
                                    borderWidth: 0.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.videocam_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .alwaysWhite,
                                      size: 40.0,
                                    ),
                                    onPressed: () async {
                                      final selectedMedia = await selectMedia(
                                        storageFolderPath: 'descomptes',
                                        isVideo: true,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading2 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls =
                                              await uploadSupabaseStorageFiles(
                                            bucketName: 'descomptes',
                                            selectedFiles: selectedMedia,
                                          );
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading2 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile2 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl2 =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      context.goNamed(
                                        'PujarDescompte',
                                        queryParameters: {
                                          'uploadedPicture': serializeParam(
                                            _model.uploadedFileUrl2,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: 50.0,
                                    borderWidth: 0.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.video_collection,
                                      color: FlutterFlowTheme.of(context)
                                          .alwaysWhite,
                                      size: 40.0,
                                    ),
                                    onPressed: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        storageFolderPath: 'descomptes',
                                        maxWidth: 1000.00,
                                        maxHeight: 1000.00,
                                        allowPhoto: true,
                                        allowVideo: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading3 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls =
                                              await uploadSupabaseStorageFiles(
                                            bucketName: 'descomptes',
                                            selectedFiles: selectedMedia,
                                          );
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading3 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile3 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl3 =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      context.goNamed(
                                        'PujarDescompte',
                                        queryParameters: {
                                          'uploadedPicture': serializeParam(
                                            _model.uploadedFileUrl3,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 15.0)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String indexToShortCode(int e) {
    String shortCode;
    switch (e) {
      case 0:
        shortCode = "%";
        break;
      case 1:
        shortCode = "2x1";
        break;
      case 2:
        shortCode = "TDT";
        break;
      case 3:
        shortCode = "PRO";
        break;
      case 4:
        shortCode = "SOC";
        break;
      case 5:
        shortCode = "FID";
        break;
      case 6:
        shortCode = "PRM";
        break;
      case 7:
        shortCode = "LIQ";
        break;
      case 8:
        shortCode = "MAY";
        break;
      case 9:
        shortCode = "3x2";
        break;
      case 10:
        shortCode = "IVA";
        break;
      default:
        shortCode = "SPC";
        break;
    }
    return shortCode;
  }

  Future<List<Marker>> getListOfBotigas(BuildContext context) async {
    List<Marker> markersBotiga = [];
    var llistaBotigues = await Supabase.instance.client
        .from('Botiga')
        .select('id, nomBotiga, latitut, longitut, Descompte (tipusDescompte)');
    var length = llistaBotigues.length;

    for (var i = 0; i < length; i++) {
      var currentBotiga = llistaBotigues[i];
      var lat = currentBotiga["latitut"];
      var lng = currentBotiga["longitut"];
      var id = currentBotiga["id"];
      var shopName = currentBotiga["nomBotiga"];
      var currentBotigaDescomptes = currentBotiga["Descompte"] as List;

      if (FFAppState().discountFilter.isEmpty) {
        addNewMarker(lat, lng, id, shopName, context, markersBotiga);
      } else {
        //si hay descuentos
        var isAlreadyAdded = false;
        for (var i = 0;
            i < currentBotigaDescomptes.length && !isAlreadyAdded;
            i++) {
          var valor = currentBotigaDescomptes[i] as Map;
          var tipusDescompte = valor["tipusDescompte"];
          if (FFAppState().discountFilter.contains(tipusDescompte - 1)) {
            isAlreadyAdded = true;
            addNewMarker(lat, lng, id, shopName, context, markersBotiga);
          }
        }
      }
    }
    print("sent");
    return markersBotiga;
  }

  void addNewMarker(lat, lng, id, shopName, BuildContext context,
      List<Marker> markersBotiga) {
    var marking = Marker(
      point: LatLongReal.LatLng(double.parse(lat), double.parse(lng)),
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            iconSize: 45.0,
            tooltip: shopName.toString(),
            icon: Icon(Icons.location_pin),
            color: Color(0xFFFEC24B),
            onPressed: () async {
              print(id);
              context.pushNamed(
                'ShopDetails',
                queryParameters: {
                  'idBotiga': serializeParam(
                    id,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
          ),
          // Text(id.toString()),
        ],
      ),
    );
    print(id);
    markersBotiga.add(marking);
  }
}
