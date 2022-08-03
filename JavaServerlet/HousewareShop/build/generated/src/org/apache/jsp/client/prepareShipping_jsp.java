package org.apache.jsp.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entity.SubCategory;
import java.util.List;
import entity.Category;

public final class prepareShipping_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/client/../component/navbar.jsp");
    _jspx_dependants.add("/client/../component/footer.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_varStatus_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_choose;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_fmt_formatNumber_value_type_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_fmt_setLocale_value_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_otherwise;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_when_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_forEach_varStatus_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_choose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_fmt_formatNumber_value_type_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_fmt_setLocale_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_otherwise = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_when_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
    _jspx_tagPool_c_forEach_varStatus_var_items.release();
    _jspx_tagPool_c_if_test.release();
    _jspx_tagPool_c_choose.release();
    _jspx_tagPool_fmt_formatNumber_value_type_nobody.release();
    _jspx_tagPool_fmt_setLocale_value_nobody.release();
    _jspx_tagPool_c_otherwise.release();
    _jspx_tagPool_c_when_test.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      if (_jspx_meth_fmt_setLocale_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <!-- Required meta tags -->\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.3.1/css/all.css\" integrity=\"sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"css/newcss.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>Prepare shipping</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("\n");
      out.write("    ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("    .btn-group{\n");
      out.write("        margin: auto;\n");
      out.write("    }\n");
      out.write("    #login{\n");
      out.write("        border-top-right-radius: .25rem !important;\n");
      out.write("        border-bottom-right-radius: .25rem !important;\n");
      out.write("    }\n");
      out.write("    .btn-outline-warning{\n");
      out.write("        color: white;\n");
      out.write("        border-color: none;\n");
      out.write("    }\n");
      out.write("    .btn-outline-warning:hover{\n");
      out.write("        color: white;\n");
      out.write("        background-color: #00ACE9;\n");
      out.write("    }\n");
      out.write("</style>\n");
      out.write("<nav class=\"navbar fixed-top navbar-expand-lg navbar-dark bg-dark\" style=\"height: 4rem; opacity: .9; background-color: #404040 !important\">\n");
      out.write("    <a class=\"navbar-brand\" href=\"http://localhost:8080/HousewareShop/home\">HouseWareShop</a>\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\"\n");
      out.write("            aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("    </button>\n");
      out.write("\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("\n");
      out.write("        <div class=\"navigationDesktop ml-5\">\n");
      out.write("            <nav class=\"nav\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a class=\"link btn btn-outline-warning\" style=\"background-color:  #404040; border-color: #404040 !important;color: white;margin-top: -2px;\" href=\"http://localhost:8080/HousewareShop/get-list-product\">Products</a>\n");
      out.write("                        <ul>\n");
      out.write("                            ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <ul class=\"navbar-nav mr-auto\">\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"btn btn-outline-warning ml-5\" style=\"border-color: #404040 !important;font-size: 13pt\" href=\"http://localhost:8080/HousewareShop/get-list-sale\">Sale Items</i></a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"btn btn-outline-warning ml-5\" style=\"border-color: #404040 !important;font-size: 13pt\" href=\"https://www.facebook.com/xb.jamesgosling/about?section=overview&lst=100013406340780%3A100013406340780%3A1572076900\">Contact Us</i></a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form target=\"_self\" id=\"frm\" action=\"http://localhost:8080/HousewareShop/search\" method=\"get\" onchange=\"this.form.submit()\">\n");
      out.write("            <div class=\"search-box\">\n");
      out.write("                <input class=\"search-txt\" name=\"inputSearch\" type=\"text\" placeholder=\"Type to search\">\n");
      out.write("                <input type=\"hidden\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${page}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"page\">\n");
      out.write("                <a href=\"#\" class=\"search-btn\">\n");
      out.write("                    <i class=\"fas fa-search text-center\" style=\"margin-top:12px;color: white\"></i>\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("        <ul class=\"navbar-nav ml-auto mr-2\">\n");
      out.write("            <li class=\"nav-item dropdown active\">\n");
      out.write("                <a class=\"nav-link dropdown-toggle mr-5\" href=\"#\" id=\"navbarDropdown\" style=\"color: green; font-size: 2.5rem\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                    <i class=\"fas fa-cart-plus mr-2\" style=\"color: #e9ecef; font-size: 2.5rem\"></i>");
      if (_jspx_meth_c_if_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                    </a>\n");
      out.write("                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                    ");
      if (_jspx_meth_c_choose_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <!-- Example single danger button -->\n");
      out.write("            <div class=\"btn-group\">\n");
      out.write("                ");
      if (_jspx_meth_c_if_2(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                ");
      if (_jspx_meth_c_if_3(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"dropdown-menu\">\n");
      out.write("                    <a class=\"dropdown-item\" href=\"http://localhost:8080/HousewareShop/my-profile\">My profile</a>\n");
      out.write("                    <a class=\"dropdown-item\" href=\"http://localhost:8080/HousewareShop/my-profile\" onclick=\"openOrder()\">Orders</a>\n");
      out.write("                    <a class=\"dropdown-item\" href=\"#\">History</a>\n");
      out.write("                    <div class=\"dropdown-divider\"></div>\n");
      out.write("                    <a class=\"dropdown-item\" href=\"http://localhost:8080/HousewareShop/logout\">Logout</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12 mt-5\">\n");
      out.write("                    <div class=\"card\" >\n");
      out.write("                        <div class=\"card-body mt-5\" style=\"border: 1px solid #ced4da;border-radius: 5px\">\n");
      out.write("                            <h4 style=\"color: orange\">List of Products</h4>\n");
      out.write("                            <table class=\"w-100 table mt-3\">   \n");
      out.write("                                <tr>\n");
      out.write("                                    <th>STT</th>\n");
      out.write("                                    <th>Image</th>\n");
      out.write("                                    <th>Name of Product</th>\n");
      out.write("                                    <th>Price</th>\n");
      out.write("                                    <th>Quantity</th>\n");
      out.write("                                    <th>Total Price</th>\n");
      out.write("                                </tr>\n");
      out.write("                                ");
      if (_jspx_meth_c_forEach_3(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                            </table>\n");
      out.write("                            <hr/>\n");
      out.write("                            <div class=\"text-right\">\n");
      out.write("                                <h4>Total price:");
      if (_jspx_meth_fmt_formatNumber_2(_jspx_page_context))
        return;
      out.write("</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"mt-5\"><a onclick=\"document.getElementById('inf').submit()\" class=\"btn btn-outline-success ml-auto w-100\">Payment in cash</a></div>\n");
      out.write("                            <div class=\"mt-3\"><a  onclick=\"document.getElementById('address').style.display = 'block'\" class=\"btn btn-outline-info ml-auto w-100\">Payment via ATM card</a></div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-9 mt-3\">\n");
      out.write("                            <form id=\"inf\" action=\"prepare-shipping\" method=\"post\" style=\"border: 1px solid #ced4da !important; border-radius: 5px !important\"> \n");
      out.write("                                <div class=\"card\" >\n");
      out.write("                                    <div class=\"card-body\">\n");
      out.write("                                        <h4 style=\"color: orange\">Adress Shipping</h4>\n");
      out.write("                                        <h6 style=\"overflow: visible !important\">Products will be delivered at the address below</h6><br>\n");
      out.write("                                        <div>Full Name:<span class=\"ml-4\"> <b>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${shipping.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</b><span></div>\n");
      out.write("                                                    <input id=\"c-name\" type=\"hidden\" name=\"name\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${shipping.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                                                    <input id=\"c-mobile\" type=\"hidden\" name=\"mobile\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${shipping.phone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                                                    <input id=\"c-address\" type=\"hidden\" name=\"address\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${shipping.address}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                                                    <input id=\"c-note\" type=\"hidden\" name=\"note\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${note}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                                                    <div>Phone number: <span class=\"ml-4\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${shipping.phone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("<span></div>\n");
      out.write("                                                                <div>Address: <span class=\"ml-4\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${shipping.address}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></div>\n");
      out.write("                                                                <div>Note <span class=\"ml-4\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${note}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                                </form>\n");
      out.write("                                                                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                                </div>\n");
      out.write("                                                                <div class=\"row\">\n");
      out.write("\n");
      out.write("                                                                    <div class=\"col-md-3\">\n");
      out.write("\n");
      out.write("                                                                    </div>\n");
      out.write("                                                                    <div id=\"address\" class=\"col-md-9 mt-5\">\n");
      out.write("                                                                        <div class=\"card\">\n");
      out.write("                                                                            <div class=\"card-body\" style=\"border: 1px solid #ced4da;border-radius: 5px !important\">\n");
      out.write("                                                                                <h4 class=\"mt-3\" style=\"color: orange\">Online Payment</h4>\n");
      out.write("                                                                                <div class=\"card mt-3\">\n");
      out.write("                                                                                    <div class=\"card-body\">\n");
      out.write("                                                                                        <form id=\"frmPaymentOnline\" action=\"payment-online\" method=\"get\">\n");
      out.write("                                                                                            <input id=\"bank\" type=\"hidden\" value=\"\" name=\"bank\"/>\n");
      out.write("                                                                                            <div class=\"row\">\n");
      out.write("                                                                                                <div class=\"col-md-2\">\n");
      out.write("                                                                                                    <div class=\"card mt-3 mb-3\" style=\"padding: 0 !important\">\n");
      out.write("                                                                                                        <div class=\"card-body text-center\" id=\"VTB\" onclick=\"handleClickATM('VTB')\" style=\"padding: 1px\">\n");
      out.write("                                                                                                            <img width=\"100%\" src=\"https://salt.tikicdn.com/assets/img/zalopaygw/VTB.jpg\"/>\n");
      out.write("                                                                                                        </div>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                                </div>\n");
      out.write("                                                                                                <div class=\"col-md-2\">\n");
      out.write("                                                                                                    <div class=\"card mt-3 mb-3\" style=\"padding: 0 !important\">\n");
      out.write("                                                                                                        <div class=\"card-body text-center\" id=\"VCB\" onclick=\"handleClickATM('VCB')\" style=\"padding: 1px\">\n");
      out.write("                                                                                                            <img width=\"100%\" src=\"https://salt.tikicdn.com/assets/img/zalopaygw/VCB.jpg\"/>\n");
      out.write("                                                                                                        </div>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                                </div>\n");
      out.write("                                                                                                <div class=\"col-md-2\">\n");
      out.write("                                                                                                    <div class=\"card mt-3 mb-3\" style=\"padding: 0 !important\">\n");
      out.write("                                                                                                        <div class=\"card-body text-center\" id=\"SCB\" onclick=\"handleClickATM('SCB')\" style=\"padding: 1px\">\n");
      out.write("                                                                                                            <img width=\"100%\" src=\"https://salt.tikicdn.com/ts/upload/b3/67/8d/2feb0c1f3f3ec9f38dd4d462883459be.png\"/>\n");
      out.write("                                                                                                        </div>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                                </div>\n");
      out.write("                                                                                                <div class=\"col-md-2\">\n");
      out.write("                                                                                                    <div class=\"card mt-3 mb-3\" style=\"padding: 0 !important\">\n");
      out.write("                                                                                                        <div class=\"card-body text-center\" id=\"EIB\" onclick=\"handleClickATM('EIB')\" style=\"padding: 1px\">\n");
      out.write("                                                                                                            <img width=\"100%\" src=\"https://salt.tikicdn.com/assets/img/zalopaygw/EIB.jpg\"/>\n");
      out.write("                                                                                                        </div>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                                </div>\n");
      out.write("                                                                                                <div class=\"col-md-2\">\n");
      out.write("                                                                                                    <div class=\"card mt-3 mb-3\" style=\"padding: 0 !important\">\n");
      out.write("                                                                                                        <div class=\"card-body text-center\" id=\"BIDV\" onclick=\"handleClickATM('BIDV')\" style=\"padding: 1px\">\n");
      out.write("                                                                                                            <img width=\"100%\" src=\"https://salt.tikicdn.com/assets/img/zalopaygw/BIDV.jpg\"/>\n");
      out.write("                                                                                                        </div>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                                </div>\n");
      out.write("                                                                                                <div class=\"col-md-2\">\n");
      out.write("                                                                                                    <div class=\"card mt-3 mb-3\" style=\"padding: 0 !important\">\n");
      out.write("                                                                                                        <div class=\"card-body text-center\" id=\"MB\" onclick=\"handleClickATM('MB')\" style=\"padding: 1px\">\n");
      out.write("                                                                                                            <img width=\"100%\" src=\"https://salt.tikicdn.com/assets/img/zalopaygw/MB.jpg\"/>\n");
      out.write("                                                                                                        </div>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                                </div>\n");
      out.write("                                                                                                <div class=\"col-md-2\">\n");
      out.write("                                                                                                    <div class=\"card mt-3 mb-3\" style=\"padding: 0 !important\">\n");
      out.write("                                                                                                        <div class=\"card-body text-center\" id=\"TCB\" onclick=\"handleClickATM('TCB')\" style=\"padding: 1px\">\n");
      out.write("                                                                                                            <img width=\"100%\" src=\"https://salt.tikicdn.com/assets/img/zalopaygw/TCB.jpg\"/>\n");
      out.write("                                                                                                        </div>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                                </div>\n");
      out.write("                                                                                                <div class=\"col-md-2\">\n");
      out.write("                                                                                                    <div class=\"card mt-3 mb-3\" style=\"padding: 0 !important\">\n");
      out.write("                                                                                                        <div class=\"card-body text-center\" id=\"VPB\" onclick=\"handleClickATM('VPB')\" style=\"padding: 1px\">\n");
      out.write("                                                                                                            <img width=\"100%\" src=\"https://salt.tikicdn.com/assets/img/zalopaygw/VPB.jpg\"/>\n");
      out.write("                                                                                                        </div>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                                </div>\n");
      out.write("                                                                                                \n");
      out.write("                                                                                            </div>\n");
      out.write("\n");
      out.write("                                                                                            <a onclick=\"submitPaymentOnline()\" class=\"btn btn-success w-100 text-white\">Accept</a>\n");
      out.write("                                                                                        </form>\n");
      out.write("                                                                                    </div>\n");
      out.write("                                                                                </div>\n");
      out.write("                                                                            </div>\n");
      out.write("                                                                        </div>\n");
      out.write("                                                                    </div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                                <script>\n");
      out.write("                                                                    document.getElementById('address').style.display = 'none'\n");
      out.write("                                                                    let atm;\n");
      out.write("                                                                    function handleClickATM(id){\n");
      out.write("                                                                        let listATM = [\"VTB\",\"VCB\",\"SCB\",\"EIB\",\"BIDV\",\"MB\",\"TCB\",\"VPB\"]\n");
      out.write("                                                                        atm=id;\n");
      out.write("                                                                        for(let element of listATM){\n");
      out.write("                                                                            document.getElementById(element).style.border='none';\n");
      out.write("                                                                        }\n");
      out.write("                                                                        document.getElementById(id).style.border='1px solid red';\n");
      out.write("                                                                    }\n");
      out.write("                                                                    function submitPaymentOnline(){\n");
      out.write("                                                                        if(!atm){\n");
      out.write("                                                                            alert('please choose one ATM');\n");
      out.write("                                                                            return;\n");
      out.write("                                                                        }\n");
      out.write("                                                                        document.getElementById('bank').value=atm;\n");
      out.write("                                                                        let form = document.getElementById('frmPaymentOnline');\n");
      out.write("                                                                        let hiddenInput = document.createElement(\"input\");\n");
      out.write("                                                                        hiddenInput.type=\"hidden\";\n");
      out.write("                                                                        hiddenInput.value=document.getElementById('c-name');\n");
      out.write("                                                                        form.appendChild(hiddenInput);\n");
      out.write("//                                                                        document.getElementById('frmPaymentOnline').submit();\n");
      out.write("                                                                        \n");
      out.write("                                                                    }\n");
      out.write("                                                                </script>\n");
      out.write("                                                                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Footer -->\n");
      out.write("<section id=\"footer\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"row text-center text-xs-center text-sm-left text-md-left\">\n");
      out.write("            <div class=\"col-xs-12 col-sm-4 col-md-4\">\n");
      out.write("                <ul class=\"list-unstyled quick-links\">\n");
      out.write("                    <img src=\"images/My_Facebook_Code.png\" alt=\"\" style=\"height: 250px\"/>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-xs-12 col-sm-4 col-md-4\">\n");
      out.write("                <h5>About Website</h5>\n");
      out.write("                <ul class=\"list-unstyled quick-links\">\n");
      out.write("                    <li><a href=\"http://localhost:8080/HousewareShop/home\"><i class=\"fa fa-angle-double-right\"></i>Home</a></li>\n");
      out.write("                    <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>About</a></li>\n");
      out.write("                    <li><a href=\"http://localhost:8080/HousewareShop/get-list-product\"><i class=\"fa fa-angle-double-right\"></i>Product</a></li>\n");
      out.write("                    <li><a href=\"http://localhost:8080/HousewareShop/get-list-sale\"><i class=\"fa fa-angle-double-right\"></i>Sale now</a></li>\n");
      out.write("                    <li><a href=\"http://localhost:8080/HousewareShop/sign-up\"><i class=\"fa fa-angle-double-right\"></i>Singup</a></li>\n");
      out.write("                    <li><a href=\"");
      if (_jspx_meth_c_if_4(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                            ");
      if (_jspx_meth_c_if_5(_jspx_page_context))
        return;
      out.write("<i class=\"fa fa-angle-double-right\"></i>Your-Profile</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-xs-12 col-sm-4 col-md-4\">\n");
      out.write("                <h5>Contact</h5>\n");
      out.write("\n");
      out.write("                <ul class=\"list-unstyled quick-links\">\n");
      out.write("                    <li><a><i class=\"fas fa-phone-volume\"></i>0866823499</a><a><i class=\"fa fa-envelope ml-3\"></i>lehonguan15a@gmail.com</a></li>\n");
      out.write("                    <li><a href=\"https://www.google.com/maps?ll=20.994897,105.523648&z=15&t=m&hl=vi&gl=US&mapclient=embed&saddr=QL21,+Th%E1%BA%A1ch+Ho%C3%A0,+Th%E1%BA%A1ch+Th%E1%BA%A5t,+H%C3%A0+N%E1%BB%99i&daddr=Ng%C3%A3+ba+H%C3%B2a+L%E1%BA%A1c+-+QL+21,+H%C3%B2a+L%E1%BA%A1c,+Th%E1%BA%A1ch+Th%E1%BA%A5t,+H%C3%A0+N%E1%BB%99i&dirflg=d\"><i class=\"fa fa-angle-double-right\"></i>21, Thôn 6, Xã Thạch Hòa, Huyện Thạch Thất, Hà Nội, Việt Nam</a></li>\n");
      out.write("                    <div id=\"map\" style=\"height:150px;\">\n");
      out.write("                        <iframe src=\"https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d28951.161087040786!2d105.51070539259248!3d20.995169088270938!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e0!4m3!3m2!1d20.9946236!2d105.52396399999999!4m5!1s0x31345b9f825d11d7%3A0x1772bcf973ec956c!2zTmfDoyBiYSBIw7JhIEzhuqFjIC0gUUwgMjEsIEjDsmEgTOG6oWMsIFRo4bqhY2ggVGjhuqV0LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!3m2!1d20.994598999999997!2d105.523479!5e0!3m2!1svi!2s!4v1573398015876!5m2!1svi!2s\" width=\"250\" height=\"100\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>\n");
      out.write("                    </div>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5\">\n");
      out.write("                <ul class=\"list-unstyled list-inline social text-center\">\n");
      out.write("                    <li class=\"list-inline-item\"><a href=\"https://www.facebook.com/messages/t/xb.jamesgosling\"><i class=\"fab fa-facebook\"></i></a></li>\n");
      out.write("                    <li class=\"list-inline-item\"><a href=\"#\"><i class=\"fab fa-google-plus-g\"></i></a></li>\n");
      out.write("                    <li class=\"list-inline-item\"><a href=\"https://www.instagram.com/xbjamesgosling/?hl=vi\"><i class=\"fab fa-instagram\"></i></i></a></li>\n");
      out.write("                    <li class=\"list-inline-item\"><a href=\"#\"><i class=\"fas fa-phone-volume\"></i></a></li>\n");
      out.write("                    <li class=\"list-inline-item\"><a href=\"mailto:lehongquan15a@gmail.com?cc=name2@rapidtables.com&bcc=name3@rapidtables.com\n");
      out.write("                                                    &amp;subject=The%20subject%20of%20the%20email\n");
      out.write("                                                    &amp;body=The%20body%20of%20the%20email\" target=\"_blank\"><i class=\"fa fa-envelope\"></i></a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            </hr>\n");
      out.write("        </div>\t\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white\">\n");
      out.write("                <p><u><a href=\"https://www.nationaltransaction.com/\">National Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>\n");
      out.write("                <p class=\"h6\">&copy copyright by <a class=\"text-green\" href=\"http://localhost:8080/HousewareShop/home\" target=\"_blank\">HousewareShop</a></p>\n");
      out.write("            </div>\n");
      out.write("            </hr>\n");
      out.write("        </div>\t\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("<!-- ./Footer -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Optional JavaScript -->\n");
      out.write("<!-- jQuery first, then Popper.js, then Bootstrap JS -->\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("                                                                </body>\n");
      out.write("                                                                </html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_fmt_setLocale_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:setLocale
    org.apache.taglibs.standard.tag.rt.fmt.SetLocaleTag _jspx_th_fmt_setLocale_0 = (org.apache.taglibs.standard.tag.rt.fmt.SetLocaleTag) _jspx_tagPool_fmt_setLocale_value_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.SetLocaleTag.class);
    _jspx_th_fmt_setLocale_0.setPageContext(_jspx_page_context);
    _jspx_th_fmt_setLocale_0.setParent(null);
    _jspx_th_fmt_setLocale_0.setValue(new String("en_US"));
    int _jspx_eval_fmt_setLocale_0 = _jspx_th_fmt_setLocale_0.doStartTag();
    if (_jspx_th_fmt_setLocale_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_setLocale_value_nobody.reuse(_jspx_th_fmt_setLocale_0);
      return true;
    }
    _jspx_tagPool_fmt_setLocale_value_nobody.reuse(_jspx_th_fmt_setLocale_0);
    return false;
  }

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.account != null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("        .btn-group:hover>.dropdown-menu {\n");
        out.write("            display: block;\n");
        out.write("        }\n");
        out.write("    ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${listCategory}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("C");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                <li class=\"sublink\">\n");
          out.write("                                    <a class=\"link\" href=\"http://localhost:8080/HousewareShop/filter?id=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${C.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\">\n");
          out.write("                                        ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${C.getCategory()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\n");
          out.write("                                        <ul>\n");
          out.write("                                            ");
          if (_jspx_meth_c_forEach_1((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_forEach_0, _jspx_page_context, _jspx_push_body_count_c_forEach_0))
            return true;
          out.write("\n");
          out.write("                                        </ul>\n");
          out.write("                                    </a>\n");
          out.write("                                </li>\n");
          out.write("                            ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_forEach_1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_forEach_0, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_forEach_0)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_1.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_forEach_0);
    _jspx_th_c_forEach_1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${C.getListSubCategory()}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_1.setVar("subC");
    int[] _jspx_push_body_count_c_forEach_1 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_1 = _jspx_th_c_forEach_1.doStartTag();
      if (_jspx_eval_c_forEach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                                <li class=\"sublink\"><a class=\"link\" href=\"http://localhost:8080/HousewareShop/filter?cid=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${subC.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${subC.getSubCategoryName()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a></li>\n");
          out.write("                                                ");
          int evalDoAfterBody = _jspx_th_c_forEach_1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_1.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_1);
    }
    return false;
  }

  private boolean _jspx_meth_c_if_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_1.setPageContext(_jspx_page_context);
    _jspx_th_c_if_1.setParent(null);
    _jspx_th_c_if_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.listCart.size() ne 0}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_1 = _jspx_th_c_if_1.doStartTag();
    if (_jspx_eval_c_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("<sup style=\"color: #fcae00 !important\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.listCart.size()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</sup>");
        int evalDoAfterBody = _jspx_th_c_if_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
    return false;
  }

  private boolean _jspx_meth_c_choose_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_choose_0 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _jspx_tagPool_c_choose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    _jspx_th_c_choose_0.setPageContext(_jspx_page_context);
    _jspx_th_c_choose_0.setParent(null);
    int _jspx_eval_c_choose_0 = _jspx_th_c_choose_0.doStartTag();
    if (_jspx_eval_c_choose_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                        ");
        if (_jspx_meth_c_when_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                        ");
        if (_jspx_meth_c_otherwise_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_choose_0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                    ");
        int evalDoAfterBody = _jspx_th_c_choose_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_choose_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_0);
      return true;
    }
    _jspx_tagPool_c_choose.reuse(_jspx_th_c_choose_0);
    return false;
  }

  private boolean _jspx_meth_c_when_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_when_0 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _jspx_tagPool_c_when_test.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    _jspx_th_c_when_0.setPageContext(_jspx_page_context);
    _jspx_th_c_when_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    _jspx_th_c_when_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.listCart eq null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_when_0 = _jspx_th_c_when_0.doStartTag();
    if (_jspx_eval_c_when_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            <span class=\"mx-3\">List Cart is empty</span>\n");
        out.write("                        ");
        int evalDoAfterBody = _jspx_th_c_when_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_when_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_0);
      return true;
    }
    _jspx_tagPool_c_when_test.reuse(_jspx_th_c_when_0);
    return false;
  }

  private boolean _jspx_meth_c_otherwise_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_choose_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:otherwise
    org.apache.taglibs.standard.tag.common.core.OtherwiseTag _jspx_th_c_otherwise_0 = (org.apache.taglibs.standard.tag.common.core.OtherwiseTag) _jspx_tagPool_c_otherwise.get(org.apache.taglibs.standard.tag.common.core.OtherwiseTag.class);
    _jspx_th_c_otherwise_0.setPageContext(_jspx_page_context);
    _jspx_th_c_otherwise_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_choose_0);
    int _jspx_eval_c_otherwise_0 = _jspx_th_c_otherwise_0.doStartTag();
    if (_jspx_eval_c_otherwise_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            <div class=\"popup-list-cart\">\n");
        out.write("                                <table>\n");
        out.write("                                    ");
        if (_jspx_meth_c_forEach_2((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_otherwise_0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                                </table>\n");
        out.write("                            </div>\n");
        out.write("                            <div class=\"dropdown-divider\"></div>\n");
        out.write("                            <a class=\"dropdown-item\" href=\"get-list-cart\">View List Cart</a>\n");
        out.write("                        ");
        int evalDoAfterBody = _jspx_th_c_otherwise_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_otherwise_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_otherwise.reuse(_jspx_th_c_otherwise_0);
      return true;
    }
    _jspx_tagPool_c_otherwise.reuse(_jspx_th_c_otherwise_0);
    return false;
  }

  private boolean _jspx_meth_c_forEach_2(javax.servlet.jsp.tagext.JspTag _jspx_th_c_otherwise_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_2 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_2.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_otherwise_0);
    _jspx_th_c_forEach_2.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.listCart}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_2.setVar("cart");
    int[] _jspx_push_body_count_c_forEach_2 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_2 = _jspx_th_c_forEach_2.doStartTag();
      if (_jspx_eval_c_forEach_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                        <tr>\n");
          out.write("                                            <td class=\"px-2\"><img src=\"images/");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.productImg}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\"></td>\n");
          out.write("                                            <td class=\"f-small\"><a href=\"detail?id=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.productId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.productName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a></td>\n");
          out.write("                                            <td class=\"px-3 f-small\">x ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.quantity}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                        </tr>\n");
          out.write("                                    ");
          int evalDoAfterBody = _jspx_th_c_forEach_2.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_2[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_2.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_2.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_2);
    }
    return false;
  }

  private boolean _jspx_meth_c_if_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_2.setPageContext(_jspx_page_context);
    _jspx_th_c_if_2.setParent(null);
    _jspx_th_c_if_2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.account eq null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_2 = _jspx_th_c_if_2.doStartTag();
    if (_jspx_eval_c_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                    <a id=\"login\" class=\"nav-link btn btn-outline-primary ml-2 mr-1\" style=\"margin: auto\" href=\"http://localhost:8080/HousewareShop/login\">\n");
        out.write("                        Login\n");
        out.write("                        <i class=\"fas fa-user-plus ml-2\"></i>\n");
        out.write("                    </a>\n");
        out.write("                ");
        int evalDoAfterBody = _jspx_th_c_if_2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
    return false;
  }

  private boolean _jspx_meth_c_if_3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_3 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_3.setPageContext(_jspx_page_context);
    _jspx_th_c_if_3.setParent(null);
    _jspx_th_c_if_3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.account != null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_3 = _jspx_th_c_if_3.doStartTag();
    if (_jspx_eval_c_if_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                    <a class=\"nav-link btn btn-outline-primary mt-2 ml-2\" href=\"http://localhost:8080/HousewareShop/home\">\n");
        out.write("                        ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.account.displayName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\n");
        out.write("                        <i class=\"fas fa-user-plus ml-2\"></i>\n");
        out.write("                    </a>\n");
        out.write("                ");
        int evalDoAfterBody = _jspx_th_c_if_3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_3);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_3);
    return false;
  }

  private boolean _jspx_meth_c_forEach_3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_3 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_varStatus_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_3.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_3.setParent(null);
    _jspx_th_c_forEach_3.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.listCart}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_3.setVar("cart");
    _jspx_th_c_forEach_3.setVarStatus("track");
    int[] _jspx_push_body_count_c_forEach_3 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_3 = _jspx_th_c_forEach_3.doStartTag();
      if (_jspx_eval_c_forEach_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                    <tr>\n");
          out.write("                                        <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${track.count}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                        <td>\n");
          out.write("                                            <img src=\"images/");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.productImg}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" style=\"width: 100px\">\n");
          out.write("                                        </td>\n");
          out.write("                                        <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.productName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                        <td>\n");
          out.write("                                            ");
          if (_jspx_meth_fmt_formatNumber_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_forEach_3, _jspx_page_context, _jspx_push_body_count_c_forEach_3))
            return true;
          out.write("\n");
          out.write("                                        </td>\n");
          out.write("                                        <td>\n");
          out.write("                                            ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.quantity}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\n");
          out.write("                                        </td>\n");
          out.write("                                        <td>\n");
          out.write("                                            ");
          if (_jspx_meth_fmt_formatNumber_1((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_forEach_3, _jspx_page_context, _jspx_push_body_count_c_forEach_3))
            return true;
          out.write("\n");
          out.write("                                        </td>\n");
          out.write("                                    </tr>\n");
          out.write("                                    <span style=\"display: none\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${totalPrice=totalPrice+(cart.productPrice * cart.quantity)}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</span>\n");
          out.write("                                ");
          int evalDoAfterBody = _jspx_th_c_forEach_3.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_3[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_3.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_3.doFinally();
      _jspx_tagPool_c_forEach_varStatus_var_items.reuse(_jspx_th_c_forEach_3);
    }
    return false;
  }

  private boolean _jspx_meth_fmt_formatNumber_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_forEach_3, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_forEach_3)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:formatNumber
    org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag _jspx_th_fmt_formatNumber_0 = (org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag) _jspx_tagPool_fmt_formatNumber_value_type_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag.class);
    _jspx_th_fmt_formatNumber_0.setPageContext(_jspx_page_context);
    _jspx_th_fmt_formatNumber_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_forEach_3);
    _jspx_th_fmt_formatNumber_0.setType("currency");
    _jspx_th_fmt_formatNumber_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.productPrice}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_fmt_formatNumber_0 = _jspx_th_fmt_formatNumber_0.doStartTag();
    if (_jspx_th_fmt_formatNumber_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_formatNumber_value_type_nobody.reuse(_jspx_th_fmt_formatNumber_0);
      return true;
    }
    _jspx_tagPool_fmt_formatNumber_value_type_nobody.reuse(_jspx_th_fmt_formatNumber_0);
    return false;
  }

  private boolean _jspx_meth_fmt_formatNumber_1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_forEach_3, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_forEach_3)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:formatNumber
    org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag _jspx_th_fmt_formatNumber_1 = (org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag) _jspx_tagPool_fmt_formatNumber_value_type_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag.class);
    _jspx_th_fmt_formatNumber_1.setPageContext(_jspx_page_context);
    _jspx_th_fmt_formatNumber_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_forEach_3);
    _jspx_th_fmt_formatNumber_1.setType("currency");
    _jspx_th_fmt_formatNumber_1.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cart.productPrice * cart.quantity}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_fmt_formatNumber_1 = _jspx_th_fmt_formatNumber_1.doStartTag();
    if (_jspx_th_fmt_formatNumber_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_formatNumber_value_type_nobody.reuse(_jspx_th_fmt_formatNumber_1);
      return true;
    }
    _jspx_tagPool_fmt_formatNumber_value_type_nobody.reuse(_jspx_th_fmt_formatNumber_1);
    return false;
  }

  private boolean _jspx_meth_fmt_formatNumber_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:formatNumber
    org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag _jspx_th_fmt_formatNumber_2 = (org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag) _jspx_tagPool_fmt_formatNumber_value_type_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag.class);
    _jspx_th_fmt_formatNumber_2.setPageContext(_jspx_page_context);
    _jspx_th_fmt_formatNumber_2.setParent(null);
    _jspx_th_fmt_formatNumber_2.setType("currency");
    _jspx_th_fmt_formatNumber_2.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${totalPrice}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_fmt_formatNumber_2 = _jspx_th_fmt_formatNumber_2.doStartTag();
    if (_jspx_th_fmt_formatNumber_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_formatNumber_value_type_nobody.reuse(_jspx_th_fmt_formatNumber_2);
      return true;
    }
    _jspx_tagPool_fmt_formatNumber_value_type_nobody.reuse(_jspx_th_fmt_formatNumber_2);
    return false;
  }

  private boolean _jspx_meth_c_if_4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_4 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_4.setPageContext(_jspx_page_context);
    _jspx_th_c_if_4.setParent(null);
    _jspx_th_c_if_4.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.account ne null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_4 = _jspx_th_c_if_4.doStartTag();
    if (_jspx_eval_c_if_4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("http://localhost:8080/HousewareShop/my-profile\">");
        int evalDoAfterBody = _jspx_th_c_if_4.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_4);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_4);
    return false;
  }

  private boolean _jspx_meth_c_if_5(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_5 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_5.setPageContext(_jspx_page_context);
    _jspx_th_c_if_5.setParent(null);
    _jspx_th_c_if_5.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.account eq null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_5 = _jspx_th_c_if_5.doStartTag();
    if (_jspx_eval_c_if_5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("http://localhost:8080/HousewareShop/login\">\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_if_5.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_5);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_5);
    return false;
  }
}
