package org.apache.jsp.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entity.SubCategory;
import java.util.List;
import entity.Category;

public final class detail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/client/../component/navbar.jsp");
    _jspx_dependants.add("/client/../component/footer.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_varStatus_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_varStatus_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_varStatus_var_items.release();
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
      out.write("        <title>Chi tiết</title>\n");
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

    List<Category> listCategory = (List<Category>)request.getAttribute("listCategory");

      out.write("\n");
      out.write("<nav class=\"navbar fixed-top navbar-expand-lg navbar-dark bg-dark\">\n");
      out.write("    <a class=\"navbar-brand\" href=\"http://localhost:8080/HousewareShop/home\">HouseWareShop</a>\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\"\n");
      out.write("      aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("      <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("    </button>\n");
      out.write("\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("        \n");
      out.write("        <div class=\"navigationDesktop ml-5\">\n");
      out.write("            <nav class=\"nav\">\n");
      out.write("              <ul>\n");
      out.write("                  <li><a class=\"link btn btn-outline-warning\" style=\"color: #ffc107;\" href=\"http://localhost:8080/HousewareShop/get-list-product\">Products</a>\n");
      out.write("<!--                  <ul>\n");
      out.write("                    <li class=\"sublink\"><a class=\"link\" href=\"#\">C++</a></li>\n");
      out.write("                    <li class=\"sublink\"><a class=\"link\" href=\"#\">C#</a></li>\n");
      out.write("                    <li class=\"sublink\"><a class=\"link\" href=\"#\">Java</a></li>\n");
      out.write("                    <li class=\"sublink\"><a class=\"link\" href=\"#\">Web Dev</a>\n");
      out.write("                      <ul>\n");
      out.write("                        <li class=\"sublink\"><a class=\"link\" href=\"#\">Javascript</a></li>\n");
      out.write("                        <li class=\"sublink\"><a class=\"link\" href=\"#\">PHP</a></li>\n");
      out.write("                        <li class=\"sublink\"><a class=\"link\" href=\"#\">Ruby</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"sublink\"><a class=\"link\" href=\"#\">Python</a></li>\n");
      out.write("                  </ul>-->\n");
      out.write("                <ul>\n");
      out.write("                    ");
for (Category C : listCategory) {
                    
      out.write("\n");
      out.write("                    <li class=\"sublink\">\n");
      out.write("                        <a class=\"link\" href=\"http://localhost:8080/HousewareShop/filter?id=");
      out.print(C.getId());
      out.write("\">\n");
      out.write("                            ");
      out.print(C.getCategory());
      out.write("\n");
      out.write("                        <ul>\n");
      out.write("                            ");
for (SubCategory subC : C.getListSubCategory()) {
                            
      out.write("\n");
      out.write("                        <li class=\"sublink\"><a class=\"link\" href=\"http://localhost:8080/HousewareShop/filter?cid=");
      out.print(subC.getId());
      out.write('"');
      out.write('>');
      out.print(subC.getSubCategoryName());
      out.write("</a></li>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                        </a></li>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </ul>\n");
      out.write("                </li>\n");
      out.write("              </ul>\n");
      out.write("            </nav>\n");
      out.write("          </div>\n");
      out.write("        \n");
      out.write("        <ul class=\"navbar-nav mr-auto\">\n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("            <a class=\"btn btn-outline-warning ml-5\" href=\"#\">Sale Items</i></a>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"nav-item\">\n");
      out.write("            <a class=\"btn btn-outline-warning ml-5\" href=\"#\">About Us</i></a>\n");
      out.write("        </li>\n");
      out.write("      </ul>\n");
      out.write("\n");
      out.write("      \n");
      out.write("        <form target=\"_self\" id=\"frm\" action=\"http://localhost:8080/HousewareShop/search\" method=\"get\" onchange=\"submitForm()\">\n");
      out.write("      <div class=\"search-box\">\n");
      out.write("          <input class=\"search-txt\" name=\"inputSearch\" type=\"text\" placeholder=\"Type to search\">\n");
      out.write("          <a href=\"#\" class=\"search-btn\">\n");
      out.write("              <i class=\"fas fa-search text-center\" style=\"margin-top:12px;\"></i>\n");
      out.write("          </a>\n");
      out.write("      </div>\n");
      out.write("        </form>\n");
      out.write("        <ul class=\"navbar-nav ml-auto mr-2\">\n");
      out.write("        <li class=\"nav-item mr-2\">\n");
      out.write("            <a class=\"nav-link\" href=\"http://localhost:8080/HousewareShop/get-list-cart\"><i id=\"cart\" class=\"fas fa-cart-plus\"></i><sup style=\"top: -1.6rem;color: red; font-size: 20px\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.listCart.size()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</sup></a>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"nav-item\"><a class=\"nav-link btn btn-outline-primary mt-2 ml-2\" href=\"#\">Login<i class=\"fas fa-user-plus ml-2\"></i></a></li>\n");
      out.write("        <li class=\"nav-item\"><a class=\"nav-link btn btn-outline-danger mt-2 ml-3 mr-0\" href=\"#\">Logout<i class=\"fas fa-sign-in-alt ml-2\"></i></a></li>\n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("<!--    <div id=\"mySidenav\" class=\"sidenav\">\n");
      out.write("        <a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a>\n");
      out.write("        <a href=\"#\" style=\"padding-left: 50%;\">About</a>\n");
      out.write("        <a href=\"#\" style=\"padding-left: 50%;\">Services</a>\n");
      out.write("        <a href=\"#\" style=\"padding-left: 50%;\">Clients</a>\n");
      out.write("        <a href=\"#\" style=\"padding-left: 50%;\">Contact</a>\n");
      out.write("        <div class=\"text middle\" style=\"margin-top: 5rem\">\n");
      out.write("          <span>L</span>\n");
      out.write("          <span class=\"hidden\">O</span>\n");
      out.write("          <span class=\"hidden\">G</span>\n");
      out.write("          <span></span>\n");
      out.write("          <span class=\"hidden\" style=\"margin-left: 25px !important\">I</span>\n");
      out.write("          <span class=\"hidden\">N</span>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"text middle\" style=\"margin-top: 10rem\">\n");
      out.write("          <span>S</span>\n");
      out.write("          <span class=\"hidden\">I</span>\n");
      out.write("          <span class=\"hidden\">G</span>\n");
      out.write("          <span>N</span>\n");
      out.write("          <span class=\"hidden\" style=\"margin-left: 25px !important\">U</span>\n");
      out.write("          <span class=\"hidden\">P</span>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"text middle\" style=\"margin-top: 15rem\">\n");
      out.write("          <span>C</span>\n");
      out.write("          <span class=\"hidden\">L</span>\n");
      out.write("          <span class=\"hidden\">I</span>\n");
      out.write("          <span class=\"hidden\">E</span>\n");
      out.write("          <span class=\"hidden\">N</span>\n");
      out.write("          <span class=\"hidden\">T</span>\n");
      out.write("          <span>S</span>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"text middle\" style=\"margin-top: 20rem\">\n");
      out.write("          <span>C</span>\n");
      out.write("          <span class=\"hidden\">O</span>\n");
      out.write("          <span class=\"hidden\">N</span>\n");
      out.write("          <span class=\"hidden\">T</span>\n");
      out.write("          <span class=\"hidden\">A</span>\n");
      out.write("          <span class=\"hidden\">C</span>\n");
      out.write("          <span>T</span>\n");
      out.write("          \n");
      out.write("        </div>\n");
      out.write("    </div>-->\n");
      out.write("  \n");
      out.write("<!--    <div id=\"main\">\n");
      out.write("        <span style=\"font-size:auto;cursor:pointer\" onclick=\"openNav()\">&#9776; open</span>\n");
      out.write("    </div>-->\n");
      out.write("    \n");
      out.write("  </nav>\n");
      out.write("<!--<script>\n");
      out.write("    function submitForm()\n");
      out.write("    {\n");
      out.write("        document.getElementById(\"frm\").submit();\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    function openNav() {\n");
      out.write("      document.getElementById(\"mySidenav\").style.width = \"100%\";\n");
      out.write("       document.getElementById(\"main\").style.opacity = \"0\";\n");
      out.write("      document.getElementById(\"mySidenav\").style.opacity = \"0.7\";\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    function closeNav() {\n");
      out.write("      document.getElementById(\"mySidenav\").style.width = \"0\";\n");
      out.write("      document.getElementById(\"main\").style.marginLeft= \"0\";\n");
      out.write("      document.getElementById(\"mySidenav\").style.opacity = \"0.1\";\n");
      out.write("      document.getElementById(\"main\").style.opacity = \"1\";\n");
      out.write("    }\n");
      out.write("</script>-->\n");
      out.write("\n");
      out.write("        <div class=\"container\" style=\"margin-top: 5rem\">\n");
      out.write("            <div class=\"row mt-5\">\n");
      out.write("                <div class=\"col-md-5 mt-5\">\n");
      out.write("                    ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("                    <!-- Next and previous buttons -->\n");
      out.write("                    <a class=\"prev\" onclick=\"plusSlides(-1)\">&#10094;</a>\n");
      out.write("                    <a class=\"next\" onclick=\"plusSlides(1)\">&#10095;</a>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <!-- Thumbnail images -->\n");
      out.write("                    <div class=\"row-image\">\n");
      out.write("                        ");
      if (_jspx_meth_c_forEach_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"col-md-6 pl-5\">\n");
      out.write("                    <h3 class=\"mt-5\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.product.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("<sup><span class=\"badge badge-success\">Success</span></sup></h3>\n");
      out.write("                    <p class=\"my-0\"><b>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.product.displayPrice}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</b><sup>đ</sup></p>\n");
      out.write("                    <h6 class=\"mt-5\">Mã sản phẩm:  ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.product.code}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h6>\n");
      out.write("                    <a href=\"add-to-cart?id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.product.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" class=\"btn btn-outline-danger w-50 mt-4\">Thêm vào giỏ hàng</a>\n");
      out.write("                    <a class=\"btn btn-outline-success w-25 mt-4 ml-2\">Mua ngay</a>\n");
      out.write("                    <p class=\"mt-4\"><b>Thông tin sản phẩm:</b></br></br>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.product.description}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Footer -->\n");
      out.write("<section id=\"footer\">\n");
      out.write("  <div class=\"container\">\n");
      out.write("    <div class=\"row text-center text-xs-center text-sm-left text-md-left\">\n");
      out.write("      <div class=\"col-xs-12 col-sm-4 col-md-4\">\n");
      out.write("        <h5>Quick links</h5>\n");
      out.write("        <ul class=\"list-unstyled quick-links\">\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>Home</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>About</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>FAQ</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>Get Started</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>Videos</a></li>\n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-xs-12 col-sm-4 col-md-4\">\n");
      out.write("        <h5>Quick links</h5>\n");
      out.write("        <ul class=\"list-unstyled quick-links\">\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>Home</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>About</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>FAQ</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>Get Started</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>Videos</a></li>\n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-xs-12 col-sm-4 col-md-4\">\n");
      out.write("        <h5>Quick links</h5>\n");
      out.write("        <ul class=\"list-unstyled quick-links\">\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>Home</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>About</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>FAQ</a></li>\n");
      out.write("          <li><a href=\"#\"><i class=\"fa fa-angle-double-right\"></i>Get Started</a></li>\n");
      out.write("          <li><a href=\"https://wwwe.sunlimetech.com\" title=\"Design and developed by\"><i class=\"fa fa-angle-double-right\"></i>Imprint</a></li>\n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"row\">\n");
      out.write("      <div class=\"col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5\">\n");
      out.write("        <ul class=\"list-unstyled list-inline social text-center\">\n");
      out.write("          <li class=\"list-inline-item\"><a href=\"#\"><i class=\"fab fa-facebook\"></i></a></li>\n");
      out.write("          <li class=\"list-inline-item\"><a href=\"#\"><i class=\"fab fa-google-plus-g\"></i></a></li>\n");
      out.write("          <li class=\"list-inline-item\"><a href=\"#\"><i class=\"fab fa-instagram\"></i></i></a></li>\n");
      out.write("          <li class=\"list-inline-item\"><a href=\"#\"><i class=\"fas fa-phone-volume\"></i></a></li>\n");
      out.write("          <li class=\"list-inline-item\"><a href=\"#\" target=\"_blank\"><i class=\"fa fa-envelope\"></i></a></li>\n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("      </hr>\n");
      out.write("    </div>\t\n");
      out.write("    <div class=\"row\">\n");
      out.write("      <div class=\"col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white\">\n");
      out.write("        <p><u><a href=\"https://www.nationaltransaction.com/\">National Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>\n");
      out.write("        <p class=\"h6\">&copy All right Reversed.<a class=\"text-green ml-2\" href=\"https://www.sunlimetech.com\" target=\"_blank\">Sunlimetech</a></p>\n");
      out.write("      </div>\n");
      out.write("      </hr>\n");
      out.write("    </div>\t\n");
      out.write("  </div>\n");
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
      out.write("        <script src=\"js/gallery.js\" type=\"text/javascript\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_varStatus_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.listImage}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("image");
    _jspx_th_c_forEach_0.setVarStatus("track");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                    <div class=\"mySlides\">\n");
          out.write("                        <div class=\"numbertext\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${track.count}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write(" / ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${listImage.size()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</div>\n");
          out.write("                        <img src=\"images/");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${image.imageName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" class=\"w-100\">\n");
          out.write("                    </div>\n");
          out.write("                    ");
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
      _jspx_tagPool_c_forEach_varStatus_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_forEach_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_varStatus_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_1.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_1.setParent(null);
    _jspx_th_c_forEach_1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.listImage}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_1.setVar("image");
    _jspx_th_c_forEach_1.setVarStatus("track");
    int[] _jspx_push_body_count_c_forEach_1 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_1 = _jspx_th_c_forEach_1.doStartTag();
      if (_jspx_eval_c_forEach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                            <div class=\"column\" >\n");
          out.write("                            <img class=\"demo cursor w-100\" src=\"images/");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${image.imageName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" onclick=\"currentSlide(");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${track.count}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write(")\">\n");
          out.write("                        </div>\n");
          out.write("                        ");
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
      _jspx_tagPool_c_forEach_varStatus_var_items.reuse(_jspx_th_c_forEach_1);
    }
    return false;
  }
}
