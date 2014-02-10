<%--

    PHR_HTML5MobileWidget

    Copyright (C) 1999-2013 Photon Infotech Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

            http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Properties" %>			
<%@ page import="com.photon.phresco.configuration.ConfigReader" %>
<%@ page import="com.photon.phresco.configuration.Configuration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
		<title>E-Shop Mobile | Phresco</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <link type="text/css" rel="stylesheet" href="css/eshop/style.css">
        <link type="text/css" rel="stylesheet" href="css/eshop/style1.css"/>
        <link type="text/css" rel="stylesheet" href="css/eshop/jquery.loadmask.css"/>

        <script type="text/javascript" charset="utf-8" src="lib/jslibraries/files/jslib_jquery-amd/1.7.1-alpha-1/jslib_jquery-amd-1.7.1-alpha-1.js"></script>
        <script type="text/javascript" charset="utf-8" src="js/eshop/jquery.loadmask.js"></script>
        <script type="text/javascript" src="lib/yui/build/yui/yui-min.js"></script>
        <!-- <script type="text/javascript" src="lib/iscroll/iscroll.js"></script> -->
        <script type="text/javascript" src="lib/jslibraries/files/jslib_jsonpath-amd/0.8.0/jslib_jsonpath-amd-0.8.0.js"></script> 
        <script type="text/javascript" src="js/eshop/controller/eshopAPI.js"></script>

        <script type="text/javascript" src="js/eshop/widgets/phrescoWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/menuWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/headerWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/navigationWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/categoryWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/productsWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/productDetailsWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/footerWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/shoppingCartWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/reviewWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/myCartWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/checkoutFormWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/checkoutFormViewWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/checkoutSuccessWidget.js"></script>
		<script type="text/javascript" src="js/eshop/widgets/postReviewWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/registrationWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/registrationSuccessWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/loginWidget.js"></script>
        <script type="text/javascript" src="js/eshop/widgets/loginSuccessWidget.js"></script>
		<script type="text/javascript" src="js/eshop/widgets/WSConfig.js"></script>
		<script type="text/javascript" src="js/eshop/widgets/ConfigReader.js"></script>
		
		<%
			String currentEnv = System.getProperty("SERVER_ENVIRONMENT");
			if(currentEnv == null) {
				currentEnv = "Production";
			}
			String path = application.getRealPath("/WEB-INF/resources/phresco-env-config.xml");
			File file = new File(path);
			ConfigReader reader = new ConfigReader(file);
			String configJson = reader.getConfigAsJSON(currentEnv, "WebService");
			%>

        <script type="text/javascript">
             YUI({gallery: 'gallery-2012.06.20-20-07'}).use('node', 'widget', 'io-base', 'json-parse', 'io-xdr', 'querystring', "event-custom-base", "querystring-stringify-simple", 'eshopAPI', 'phrescoWidget', 'menuWidget', 'headerWidget', 'navigationWidget','categoryWidget', 'productsWidget', 'productDetailsWidget', 'footerWidget', 'shoppingCartWidget', 'reviewWidget', 'checkoutFormWidget', 'checkoutFormViewWidget','checkoutSuccessWidget' ,'myCartWidget','postReviewWidget','registrationWidget', 'registrationSuccessWidget', 'loginWidget', 'loginSuccessWidget','WSConfig','ConfigReader','',function(Y) {

                Y.on("domready", function () {
					var configJson = '<%= configJson %>';
                    var eshopAPI = new Y.Phresco.EShopAPI($.parseJSON(configJson));

                    // instantiate MenuWidget with the HTML
                    var menuWidget = new Y.Phresco.MenuWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#container",
                        apiReference : eshopAPI
                    });

                    // instantiate HeaderWidget with the HTML
                    var headerWidget = new Y.Phresco.HeaderWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#header",
                        apiReference : eshopAPI
                    });

                    // instantiate NavigationWidget with the HTML
                    var navigationWidget = new Y.Phresco.NavigationWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#header-tab",
                        apiReference : eshopAPI
                    });

                    // instantiate CategoryWidget with the HTML
                    var categoryWidget = new Y.Phresco.CategoryWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    // instantiate ProductsWidget with the HTML
                    var productsWidget = new Y.Phresco.ProductsWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    // instantiate ProductDetailsWidget with the HTML
                    var productDetailsWidget = new Y.Phresco.ProductDetailsWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    // instantiate FooterWidget with the HTML
                    var footerWidget = new Y.Phresco.FooterWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#footer",
                        apiReference : eshopAPI
                    });

                    // instantiate ShoppingCartWidget with the HTML
                    var shoppingCartWidget = new Y.Phresco.ShoppingCartWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    // instantiate ShoppingCartWidget with the HTML
                    var reviewWidget = new Y.Phresco.ReviewWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    // instantiate ShoppingCartWidget with the HTML
                    var myCartWidget = new Y.Phresco.MyCartWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                     var checkoutFormWidget = new Y.Phresco.CheckoutFormWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    var checkoutFormViewWidget = new Y.Phresco.CheckoutFormViewWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });
                    var checkoutSuccessWidget = new Y.Phresco.CheckoutSuccessWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });
                    var postReviewWidget = new Y.Phresco.PostReviewWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    var registrationWidget = new Y.Phresco.RegistrationWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    var registrationSuccessWidget = new Y.Phresco.RegistrationSuccessWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    var loginWidget = new Y.Phresco.LoginWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

                    var loginSuccessWidget = new Y.Phresco.LoginSuccessWidget({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });

					 var WSConfig = new Y.Phresco.WSConfig({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });
					
					 var ConfigReader = new Y.Phresco.ConfigReader({
                        // place holder can be decided by specifying the attribute
                        targetNode : "#scroller",
                        apiReference : eshopAPI
                    });
					
					
                    eshopAPI.getWsConfig();
                    eshopAPI.getConfig();
                    //eshopAPI.getCategories([categoryWidget]);
                    //eshopAPI.getNewProducts([productsWidget]);

                    //var slider = '#slider';

                    //categoryWidget.hideWidgets([slider]);
					
					menuWidget.addSelectedListener([categoryWidget, productsWidget, myCartWidget, registrationWidget,loginWidget]);

                    headerWidget.addBackListener([categoryWidget, productsWidget]);
                    categoryWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]);
                    categoryWidget.addSelectedListener([productsWidget]);
                    productsWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]);
                    productsWidget.addSelectedListener([productDetailsWidget]);
                    productsWidget.addReviewListener([reviewWidget]);
                    navigationWidget.addSelectedListener([categoryWidget, myCartWidget, productsWidget]);
					
					navigationWidget.addShowmycartListener([shoppingCartWidget]); // for displaying my cart 
					shoppingCartWidget.addOrderListener([checkoutFormWidget]); 
					//menuWidget.addShowmycartListener([shoppingCartWidget]); // for displaying my cart 
					
                    productDetailsWidget.addReviewListener([reviewWidget]);
                    productDetailsWidget.addCartListener(shoppingCartWidget);
                    footerWidget.addSelectedListener([myCartWidget, categoryWidget, productsWidget]);
					footerWidget.addHomeListener([menuWidget]);
					footerWidget.addShowmycartListener([shoppingCartWidget]);
					
                    myCartWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]);
                    shoppingCartWidget.addCartListener(shoppingCartWidget);
                    shoppingCartWidget.addSelectedListener([myCartWidget]);
                    myCartWidget.addOrderListener([checkoutFormWidget]);
                    checkoutFormWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]);
                    checkoutFormWidget.addOrderSubmitListener([checkoutFormViewWidget]);
                    checkoutFormWidget.addSelectedListener([productsWidget]);
                    checkoutFormViewWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]);
                    checkoutFormViewWidget.addOrderSuccessListener([checkoutSuccessWidget]);
                    checkoutSuccessWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]);
                    checkoutFormViewWidget.addOrderListener([checkoutFormWidget]);
					reviewWidget.addPostReviewListener([postReviewWidget]);
					postReviewWidget.addReviewListener([reviewWidget]);
                    registrationWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]);
                    registrationWidget.addSelectedListener(registrationSuccessWidget);
                    registrationWidget.addLoginListener(loginWidget);
                    registrationSuccessWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]);
                    loginWidget.addRenderListener([headerWidget, navigationWidget, footerWidget]); 
                    loginWidget.addSelectedListener([loginSuccessWidget,headerWidget]);
                    loginWidget.addLoginListener(registrationWidget);

                    //headerWidget.hideWidgets([slider]);
                    //headerWidget.addSearchListener(productsWidget);

                    menuWidget.render();
                    //checkoutFormWidget.renderUI();
                    //headerWidget.renderUI();
                    //navigationWidget.renderUI();
                    //categoryWidget.renderUI();
                    //footerWidget.renderUI();
                });
            });
        </script>
    </head>
    <body>

        <div id="splash" class="img_div">
            <img src="images/eshop/splash_logo.png">
        </div>

        <div id="container" style="display:none;">
        </div>

        <div id="eshop" style="display:none;">
            <div id="header">
            </div>
            <div id="header-tab" class="header_tab">
            </div>
            <div id="wrapper">
                <div id="scroller">

                </div>
            </div>
            <div id="footer">            </div>
    </div>
    </body>
</html>