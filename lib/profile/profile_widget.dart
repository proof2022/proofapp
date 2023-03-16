import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF7E2D4E),
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: InkWell(
          onTap: () async {
            context.pushNamed(
              'HomePage',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.leftToRight,
                  duration: Duration(milliseconds: 400),
                ),
              },
            );
          },
          child: Image.asset(
            'assets/images/logoForApp2.png',
            width: 35.0,
            height: 35.0,
            fit: BoxFit.cover,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.5,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: FutureBuilder<ApiCallResponse>(
          future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                ..complete(UsersGroup.getUserCall.call(
                  userProfileId: FFAppState().userProfileId,
                )))
              .future,
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitDoubleBounce(
                    color: Color(0xFF7E2D4E),
                    size: 50.0,
                  ),
                ),
              );
            }
            final listViewGetUserResponse = snapshot.data!;
            return ListView(
              padding: EdgeInsets.zero,
              primary: false,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: 100.0,
                  height: MediaQuery.of(context).size.height * 1.05,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    functions.imagePath(getJsonField(
                                              listViewGetUserResponse.jsonBody,
                                              r'''$.photo''',
                                            ) !=
                                            null
                                        ? getJsonField(
                                            listViewGetUserResponse.jsonBody,
                                            r'''$.photo.url''',
                                          ).toString()
                                        : '/uploads/Asset_17_b7f5d7bdbc.png?315316325.6'),
                                    'https://api.proof.ma/uploads/Asset_17_b7f5d7bdbc.png?315316325.6',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: Color(0x66000000),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isMediaUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isMediaUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }

                                    _model.imageResponse =
                                        await ImageUploadGroup
                                            .uploadImageTestCall
                                            .call(
                                      url: _model.uploadedFileUrl,
                                    );
                                    _shouldSetState = true;
                                    if ((_model.imageResponse?.succeeded ??
                                        true)) {
                                      _model.updatedUserProfile =
                                          await UsersGroup.updateUserImageCall
                                              .call(
                                        imageId: getJsonField(
                                          (_model.imageResponse?.jsonBody ??
                                              ''),
                                          r'''$.id''',
                                        ).toString(),
                                        userId: FFAppState().userProfileId,
                                      );
                                      _shouldSetState = true;
                                      if ((_model
                                              .updatedUserProfile?.succeeded ??
                                          true)) {
                                        FFAppState().update(() {
                                          FFAppState().userProfileImage =
                                              getJsonField(
                                            (_model.updatedUserProfile
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.photo.url''',
                                          ).toString();
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Your profile image was been updated.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 600),
                                            backgroundColor: Color(0xFF7E2D4E),
                                          ),
                                        );
                                        setState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  child: Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFAppState().userProfileUsername,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 24.0,
                                  ),
                            ),
                            if ((valueOrDefault(currentUserDocument?.firstName,
                                            '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument?.firstName,
                                            '') !=
                                        '') ||
                                (valueOrDefault(currentUserDocument?.lastName,
                                            '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument?.lastName,
                                            '') !=
                                        ''))
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  '${getJsonField(
                                    listViewGetUserResponse.jsonBody,
                                    r'''$.firstName''',
                                  ).toString()} , ${getJsonField(
                                    listViewGetUserResponse.jsonBody,
                                    r'''$.lastName''',
                                  ).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().update(() {
                                    FFAppState().userProfileId = '';
                                    FFAppState().userId = '';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().userProfileImage = '';
                                    FFAppState().userProfileUsername = '';
                                  });

                                  context.goNamed('signIn');
                                },
                                text: 'Log out',
                                icon: Icon(
                                  Icons.logout,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 110.0,
                                  height: 30.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
