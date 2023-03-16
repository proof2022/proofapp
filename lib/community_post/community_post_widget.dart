import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_post_model.dart';
export 'community_post_model.dart';

class CommunityPostWidget extends StatefulWidget {
  const CommunityPostWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  final String? post;

  @override
  _CommunityPostWidgetState createState() => _CommunityPostWidgetState();
}

class _CommunityPostWidgetState extends State<CommunityPostWidget> {
  late CommunityPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityPostModel());

    _model.textController ??= TextEditingController();
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
                ..complete(PostsGroup.getPostCall.call(
                  postId: widget.post,
                  profileId: FFAppState().userProfileId,
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
            final listViewGetPostResponse = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async {
                setState(() => _model.apiRequestCompleter = null);
                await _model.waitForApiRequestCompleted();
              },
              child: ListView(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            functions.imagePath(
                                                valueOrDefault<String>(
                                              getJsonField(
                                                listViewGetPostResponse
                                                    .jsonBody,
                                                r'''$.posterProfileImage''',
                                              ).toString(),
                                              'https://api.proof.ma/uploads/Asset_17_b7f5d7bdbc.png?315316325.6',
                                            )),
                                            'https://api.proof.ma/uploads/Asset_17_b7f5d7bdbc.png?315316325.6',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FutureBuilder<ApiCallResponse>(
                                                  future: PostsGroup
                                                      .getUsernameCall
                                                      .call(
                                                    userId: getJsonField(
                                                      listViewGetPostResponse
                                                          .jsonBody,
                                                      r'''$.data.by.id''',
                                                    ).toString(),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitDoubleBounce(
                                                            color: Color(
                                                                0xFF7E2D4E),
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final textGetUsernameResponse =
                                                        snapshot.data!;
                                                    return Text(
                                                      getJsonField(
                                                        listViewGetPostResponse
                                                            .jsonBody,
                                                        r'''$.username''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    );
                                                  },
                                                ),
                                                if (functions
                                                    .isVerified(getJsonField(
                                                  listViewGetPostResponse
                                                      .jsonBody,
                                                  r'''$.posterBadge''',
                                                ).toString()))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      Icons.verified,
                                                      color: Color(0xFF7E2D4E),
                                                      size: 15.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  listViewGetPostResponse
                                                      .jsonBody,
                                                  r'''$.created_at''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0x9B57636C),
                                                          fontSize: 10.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!getJsonField(
                                    listViewGetPostResponse.jsonBody,
                                    r'''$.profileFollowingPoster''',
                                  ))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.apiResultog0 =
                                            await PostsGroup.followCall.call(
                                          posterId: getJsonField(
                                            listViewGetPostResponse.jsonBody,
                                            r'''$.posterId''',
                                          ).toString(),
                                          followerId:
                                              FFAppState().userProfileId,
                                          action: 'follow',
                                        );

                                        setState(() {});
                                      },
                                      text: 'Follow',
                                      options: FFButtonOptions(
                                        width: 80.0,
                                        height: 30.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF7E2D4E),
                                              fontSize: 10.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0xFF7E2D4E),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  if (getJsonField(
                                    listViewGetPostResponse.jsonBody,
                                    r'''$.profileFollowingPoster''',
                                  ))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.apiResultog0333 =
                                            await PostsGroup.followCall.call(
                                          posterId: getJsonField(
                                            listViewGetPostResponse.jsonBody,
                                            r'''$.posterId''',
                                          ).toString(),
                                          followerId:
                                              FFAppState().userProfileId,
                                          action: 'unfollow',
                                        );

                                        setState(() {});
                                      },
                                      text: 'Following',
                                      options: FFButtonOptions(
                                        width: 80.0,
                                        height: 30.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF9B9B9B),
                                              fontSize: 1.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0xFF9B9B9B),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    listViewGetPostResponse.jsonBody,
                                    r'''$.text''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (getJsonField(
                              listViewGetPostResponse.jsonBody,
                              r'''$.image''',
                            ) !=
                            null)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                imageUrl: functions.imagePath(getJsonField(
                                  listViewGetPostResponse.jsonBody,
                                  r'''$.image''',
                                ).toString()),
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 190.0,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!getJsonField(
                                listViewGetPostResponse.jsonBody,
                                r'''$.profileLikedIt''',
                              ))
                                Icon(
                                  Icons.favorite_border,
                                  color: Color(0xFF939393),
                                  size: 24.0,
                                ),
                              if (getJsonField(
                                listViewGetPostResponse.jsonBody,
                                r'''$.profileLikedIt''',
                              ))
                                Icon(
                                  Icons.favorite_sharp,
                                  color: Color(0xFF7E2D4E),
                                  size: 24.0,
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    listViewGetPostResponse.jsonBody,
                                    r'''$.nbOfLikes''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF939393),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.commentDots,
                                  color: Color(0xFF939393),
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    listViewGetPostResponse.jsonBody,
                                    r'''$.nbOfComments''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF939393),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        onTap: () async {
                                          context.pushNamed(
                                            'actionOnPost',
                                            queryParams: {
                                              'postId': serializeParam(
                                                getJsonField(
                                                  listViewGetPostResponse
                                                      .jsonBody,
                                                  r'''$.id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'posterId': serializeParam(
                                                getJsonField(
                                                  listViewGetPostResponse
                                                      .jsonBody,
                                                  r'''$.posterId''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 400),
                                              ),
                                            },
                                          );
                                        },
                                        child: Text(
                                          '•••',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF939393),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Add you comment...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFDADADA),
                                          fontSize: 12.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDADADA),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  maxLines: 2,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    if (_model.textController.text != null &&
                                        _model.textController.text != '') {
                                      _model.apiResultehf = await PostsGroup
                                          .commentOnPostCall
                                          .call(
                                        postId: getJsonField(
                                          listViewGetPostResponse.jsonBody,
                                          r'''$.id''',
                                        ).toString(),
                                        commenterId: FFAppState().userProfileId,
                                        text: _model.textController.text,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Comment was been added.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFF7E2D4E),
                                        ),
                                      );
                                      setState(() {
                                        _model.textController?.clear();
                                      });
                                      setState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    }

                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFF7E2D4E),
                                    size: 28.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final postComments = getJsonField(
                                listViewGetPostResponse.jsonBody,
                                r'''$.postComments''',
                              ).toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: postComments.length,
                                itemBuilder: (context, postCommentsIndex) {
                                  final postCommentsItem =
                                      postComments[postCommentsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 30.0,
                                          height: 30.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              functions.imagePath(
                                                  valueOrDefault<String>(
                                                getJsonField(
                                                  postCommentsItem,
                                                  r'''$.profilePhoto''',
                                                ).toString(),
                                                'https://api.proof.ma/uploads/Asset_17_b7f5d7bdbc.png?315316325.6',
                                              )),
                                              'https://api.proof.ma/uploads/Asset_17_b7f5d7bdbc.png?315316325.6',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        postCommentsItem,
                                                        r'''$.username''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                              ),
                                                    ),
                                                    if (functions.isVerified(
                                                        getJsonField(
                                                      postCommentsItem,
                                                      r'''$.badge''',
                                                    ).toString()))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xFF7E2D4E),
                                                          size: 12.0,
                                                        ),
                                                      ),
                                                    Expanded(
                                                      child: Text(
                                                        getJsonField(
                                                          postCommentsItem,
                                                          r'''$.when''',
                                                        ).toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0x9B57636C),
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          getJsonField(
                                                            postCommentsItem,
                                                            r'''$.text''',
                                                          ).toString(),
                                                          maxLines: 5,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
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
    );
  }
}
