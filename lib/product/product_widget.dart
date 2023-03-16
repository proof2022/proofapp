import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
export 'product_model.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  final String? id;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late ProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductModel());
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(ProductsGroup.productsCall.call(
              id: widget.id,
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
        final productProductsResponse = snapshot.data!;
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
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: Image.network(
                                        functions.imagePath(getJsonField(
                                          productProductsResponse.jsonBody,
                                          r'''$.topPhoto.url''',
                                        ).toString()),
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: false,
                                      tag: functions.imagePath(getJsonField(
                                        productProductsResponse.jsonBody,
                                        r'''$.topPhoto.url''',
                                      ).toString()),
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: functions.imagePath(getJsonField(
                                  productProductsResponse.jsonBody,
                                  r'''$.topPhoto.url''',
                                ).toString()),
                                transitionOnUserGestures: true,
                                child: Image.network(
                                  functions.imagePath(getJsonField(
                                    productProductsResponse.jsonBody,
                                    r'''$.topPhoto.url''',
                                  ).toString()),
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (getJsonField(
                                  productProductsResponse.jsonBody,
                                  r'''$.photos''',
                                ) !=
                                null)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final productImages = getJsonField(
                                      productProductsResponse.jsonBody,
                                      r'''$.photos''',
                                    ).toList();
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(productImages.length,
                                              (productImagesIndex) {
                                        final productImagesItem =
                                            productImages[productImagesIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      functions.imagePath(
                                                          getJsonField(
                                                        productImagesItem,
                                                        r'''$.url''',
                                                      ).toString()),
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: functions
                                                        .imagePath(getJsonField(
                                                      productImagesItem,
                                                      r'''$.url''',
                                                    ).toString()),
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: functions
                                                  .imagePath(getJsonField(
                                                productImagesItem,
                                                r'''$.url''',
                                              ).toString()),
                                              transitionOnUserGestures: true,
                                              child: Image.network(
                                                functions
                                                    .imagePath(getJsonField(
                                                  productImagesItem,
                                                  r'''$.url''',
                                                ).toString()),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.75,
                                                height: 300.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.55,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getJsonField(
                                        productProductsResponse.jsonBody,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 26.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Text(
                                        '${getJsonField(
                                          productProductsResponse.jsonBody,
                                          r'''$.category''',
                                        ).toString()}  |  ${getJsonField(
                                          productProductsResponse.jsonBody,
                                          r'''$.producer.name''',
                                        ).toString()}',
                                        style: TextStyle(
                                          color: Color(0xB3000000),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: RatingBarIndicator(
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFF7E2D4E),
                                            ),
                                            direction: Axis.horizontal,
                                            rating: getJsonField(
                                              productProductsResponse.jsonBody,
                                              r'''$.totalRating''',
                                            ),
                                            unratedColor: Color(0xB3000000),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${getJsonField(
                                          productProductsResponse.jsonBody,
                                          r'''$.discount''',
                                        ) != null ? functions.priceForDiscountedProduct(getJsonField(
                                          productProductsResponse.jsonBody,
                                          r'''$.up''',
                                        ), getJsonField(
                                          productProductsResponse.jsonBody,
                                          r'''$.discount''',
                                        )).toString() : getJsonField(
                                        productProductsResponse.jsonBody,
                                        r'''$.up''',
                                      ).toString()} DH',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF7E2D4E),
                                          fontSize: 24.0,
                                        ),
                                  ),
                                  if (getJsonField(
                                        productProductsResponse.jsonBody,
                                        r'''$.discount''',
                                      ) !=
                                      null)
                                    Text(
                                      '${getJsonField(
                                        productProductsResponse.jsonBody,
                                        r'''$.up''',
                                      ).toString()} DH',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xCC101213),
                                            fontSize: 16.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: ProductsGroup.productAlreadyInCartCall.call(
                            productId: widget.id,
                            clientId: FFAppState().userProfileId,
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
                            final rowProductAlreadyInCartResponse =
                                snapshot.data!;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (!rowProductAlreadyInCartResponse.jsonBody)
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 160.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0x009E9E9E),
                                              width: 0.0,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? Color(0xDD000000)
                                                  : Color(0xFFEEEEEE),
                                              size: 20.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? Color(0xFF7E2D4E)
                                                  : Color(0xFFEEEEEE),
                                              size: 20.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            count: _model
                                                .countControllerValue ??= 0,
                                            updateCount: (count) => setState(
                                                () => _model
                                                        .countControllerValue =
                                                    count),
                                            stepSize: 1,
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.apiResultyep =
                                                await ProductsGroup
                                                    .addItemToOrderCall
                                                    .call(
                                              productId: widget.id,
                                              clientId:
                                                  FFAppState().userProfileId,
                                              quantity: _model
                                                  .countControllerValue
                                                  ?.toString(),
                                            );
                                            if ((_model
                                                    .apiResultyep?.succeeded ??
                                                true)) {
                                              setState(() => _model
                                                  .apiRequestCompleter = null);
                                              await _model
                                                  .waitForApiRequestCompleted();
                                            }

                                            setState(() {});
                                          },
                                          text: 'Ajouter',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF7E2D4E),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                      FutureBuilder<ApiCallResponse>(
                        future: ProductsGroup.productAlreadyInCartCall.call(
                          productId: widget.id,
                          clientId: FFAppState().userProfileId,
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
                          final rowProductAlreadyInCartResponse =
                              snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (rowProductAlreadyInCartResponse.jsonBody)
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Produit ajouté au panier',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF7E2D4E),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final specsList = getJsonField(
                              productProductsResponse.jsonBody,
                              r'''$.specs''',
                            ).toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(specsList.length,
                                  (specsListIndex) {
                                final specsListItem = specsList[specsListIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 7.0, 0.0, 0.0),
                                          child: Container(
                                            width: 8.0,
                                            height: 8.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF7E2D4E),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                specsListItem,
                                                r'''$.specText''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Html(
                            data: getJsonField(
                              productProductsResponse.jsonBody,
                              r'''$.description''',
                            ).toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
