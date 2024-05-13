import '/backend/supabase/supabase.dart';
import '/components/account_button_widget.dart';
import '/components/return_home_widget.dart';
import '/components/settings_button_widget.dart';
import '/components/user_ranking_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ranking_model.dart';
export 'ranking_model.dart';

class RankingWidget extends StatefulWidget {
  const RankingWidget({super.key});

  @override
  State<RankingWidget> createState() => _RankingWidgetState();
}

class _RankingWidgetState extends State<RankingWidget> {
  late RankingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankingModel());
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<List<UsuarisRow>>(
                    future: UsuarisTable().queryRows(
                      queryFn: (q) => q.order('total_likes'),
                      limit: 10,
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
                      List<UsuarisRow> listViewUsuarisRowList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewUsuarisRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewUsuarisRow =
                              listViewUsuarisRowList[listViewIndex];
                          return UserRankingWidget(
                            key: Key(
                                'Keyt4t_${listViewIndex}_of_${listViewUsuarisRowList.length}'),
                            name: listViewUsuarisRow.nom,
                            points: listViewUsuarisRow.totalLikes?.toString(),
                            url: listViewUsuarisRow.urlFoto!,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
