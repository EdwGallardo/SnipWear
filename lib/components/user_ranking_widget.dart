import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_ranking_model.dart';
export 'user_ranking_model.dart';

class UserRankingWidget extends StatefulWidget {
  const UserRankingWidget({
    super.key,
    String? username,
    String? name,
    String? points,
    required this.url,
  })  : username = username ?? 'missingUsername',
        name = name ?? 'missingName',
        points = points ?? '0';

  final String username;
  final String name;
  final String points;
  final String? url;

  @override
  State<UserRankingWidget> createState() => _UserRankingWidgetState();
}

class _UserRankingWidgetState extends State<UserRankingWidget> {
  late UserRankingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRankingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondary,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      widget.url!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Text(
                        widget.username,
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget.points,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
