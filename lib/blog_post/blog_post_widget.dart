import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blog_post_model.dart';
export 'blog_post_model.dart';

class BlogPostWidget extends StatefulWidget {
  const BlogPostWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  final String? post;

  @override
  _BlogPostWidgetState createState() => _BlogPostWidgetState();
}

class _BlogPostWidgetState extends State<BlogPostWidget> {
  late BlogPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogPostModel());

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
              child: FutureBuilder<ApiCallResponse>(
                future:
                    (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                          ..complete(BlogPostsGroup.blogPostCall.call(
                            id: widget.post,
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
                  final listViewBlogPostResponse = snapshot.data!;
                  return InkWell(
                    onDoubleTap: () async {
                      _model.apiResultfr3 =
                          await BlogPostsGroup.likeABlogPostCall.call(
                        id: getJsonField(
                          listViewBlogPostResponse.jsonBody,
                          r'''$.id''',
                        ),
                        likedProfileId: FFAppState().userProfileId,
                        action: 'like',
                      );
                      if ((_model.apiResultfr3?.succeeded ?? true)) {
                        setState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      }

                      setState(() {});
                    },
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      listViewBlogPostResponse.jsonBody,
                                      r'''$.title''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    maxLines: 5,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 10.0, 40.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0x23000000),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 0.0),
                          child: Html(
                            data: getJsonField(
                              listViewBlogPostResponse.jsonBody,
                              r'''$.text''',
                            ).toString(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: BlogPostsGroup.blogPostLikedByUserCall.call(
                              id: widget.post,
                              userId: FFAppState().userProfileId,
                            ),
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
                              final rowBlogPostLikedByUserResponse =
                                  snapshot.data!;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!getJsonField(
                                    rowBlogPostLikedByUserResponse.jsonBody,
                                    r'''$''',
                                  ))
                                    InkWell(
                                      onTap: () async {
                                        _model.apiResultmc4 =
                                            await BlogPostsGroup
                                                .likeABlogPostCall
                                                .call(
                                          id: getJsonField(
                                            listViewBlogPostResponse.jsonBody,
                                            r'''$.id''',
                                          ),
                                          likedProfileId:
                                              FFAppState().userProfileId,
                                          action: 'like',
                                        );

                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Color(0xFF939393),
                                        size: 24.0,
                                      ),
                                    ),
                                  if (getJsonField(
                                    rowBlogPostLikedByUserResponse.jsonBody,
                                    r'''$''',
                                  ))
                                    InkWell(
                                      onTap: () async {
                                        _model.apiResultmc8 =
                                            await BlogPostsGroup
                                                .likeABlogPostCall
                                                .call(
                                          id: getJsonField(
                                            listViewBlogPostResponse.jsonBody,
                                            r'''$.id''',
                                          ),
                                          likedProfileId:
                                              FFAppState().userProfileId,
                                          action: 'like',
                                        );

                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: Color(0xFF7E2D4E),
                                        size: 24.0,
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        listViewBlogPostResponse.jsonBody,
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
                                        listViewBlogPostResponse.jsonBody,
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
                                ],
                              );
                            },
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
                                      _model.apiResult73d = await BlogPostsGroup
                                          .commentOnBlogPostCall
                                          .call(
                                        id: getJsonField(
                                          listViewBlogPostResponse.jsonBody,
                                          r'''$.id''',
                                        ),
                                        commenterId: FFAppState().userProfileId,
                                        text: _model.textController.text,
                                      );
                                      if ((_model.apiResult73d?.succeeded ??
                                          true)) {
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                        setState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      }
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
                                listViewBlogPostResponse.jsonBody,
                                r'''$.blogPostComments''',
                              ).toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
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
                                                  r'''$.profileImage''',
                                                ).toString(),
                                                '/uploads/Asset_17_b7f5d7bdbc.png?88118382.29999998',
                                              )),
                                              'https://api.proof.ma/uploads/Asset_17_b7f5d7bdbc.png?88118382.29999998',
                                            ),
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
                                                            r'''$.comment''',
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
                        Container(
                          width: 100.0,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
