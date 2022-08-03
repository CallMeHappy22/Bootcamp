package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class management_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_fmt_setLocale_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_fmt_setLocale_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_fmt_setLocale_value_nobody.release();
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
      out.write("        <link href=\"../css/newcss.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.3.1/css/all.css\" integrity=\"sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"../css/admin.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>Giỏ hàng</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid mt-5\">\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"tab\">\n");
      out.write("                <button class=\"tablinks\" onclick=\"openCity(event, 'dashboard')\" id=\"defaultOpen\"><i class=\"fas fa-tachometer-alt\"></i>DashBoard</button>\n");
      out.write("                <button class=\"tablinks\" onclick=\"openCity(event, 'product')\"><i class=\"fas fa-tasks\"></i>Product</button>\n");
      out.write("                <button class=\"tablinks\" onclick=\"openCity(event, 'category')\"><i class=\"fas fa-tasks\"></i>Category</button>\n");
      out.write("                <button class=\"tablinks\" onclick=\"openCity(event, 'account')\"><i class=\"fas fa-user\"></i>Account</button>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"dashboard\" class=\"tabcontent\">\n");
      out.write("                <h3>London</h3>\n");
      out.write("                <p>London is the capital city of England.</p>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"product\" class=\"tabcontent\">\n");
      out.write("\n");
      out.write("                <table class=\"table\">\n");
      out.write("                    <thead class=\"thead-dark\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"col\">#</th>\n");
      out.write("                            <th scope=\"col\">First</th>\n");
      out.write("                            <th scope=\"col\">Last</th>\n");
      out.write("                            <th scope=\"col\">Handle</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"row\">1</th>\n");
      out.write("                            <td>Mark</td>\n");
      out.write("                            <td>Otto</td>\n");
      out.write("                            <td>@mdo</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"row\">2</th>\n");
      out.write("                            <td>Jacob</td>\n");
      out.write("                            <td>Thornton</td>\n");
      out.write("                            <td>@fat</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"row\">3</th>\n");
      out.write("                            <td>Larry</td>\n");
      out.write("                            <td>the Bird</td>\n");
      out.write("                            <td>@twitter</td>\n");
      out.write("                        </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("\n");
      out.write("                <table class=\"table\">\n");
      out.write("                    <thead class=\"thead-light\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"col\">#</th>\n");
      out.write("                            <th scope=\"col\">First</th>\n");
      out.write("                            <th scope=\"col\">Last</th>\n");
      out.write("                            <th scope=\"col\">Handle</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"row\">1</th>\n");
      out.write("                            <td>Mark</td>\n");
      out.write("                            <td>Otto</td>\n");
      out.write("                            <td>@mdo</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"row\">2</th>\n");
      out.write("                            <td>Jacob</td>\n");
      out.write("                            <td>Thornton</td>\n");
      out.write("                            <td>@fat</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"row\">3</th>\n");
      out.write("                            <td>Larry</td>\n");
      out.write("                            <td>the Bird</td>\n");
      out.write("                            <td>@twitter</td>\n");
      out.write("                        </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"category\" class=\"tabcontent\">\n");
      out.write("                <h3>Tokyo</h3>\n");
      out.write("                <p>Tokyo is the capital of Japan.</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"account\" class=\"tabcontent\">\n");
      out.write("                <h3>London</h3>\n");
      out.write("                <p>London is the capital city of England.</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <script>\n");
      out.write("                function openCity(evt, cityName) {\n");
      out.write("                    var i, tabcontent, tablinks;\n");
      out.write("                    tabcontent = document.getElementsByClassName(\"tabcontent\");\n");
      out.write("                    for (i = 0; i < tabcontent.length; i++) {\n");
      out.write("                        tabcontent[i].style.display = \"none\";\n");
      out.write("                    }\n");
      out.write("                    tablinks = document.getElementsByClassName(\"tablinks\");\n");
      out.write("                    for (i = 0; i < tablinks.length; i++) {\n");
      out.write("                        tablinks[i].className = tablinks[i].className.replace(\" active\", \"\");\n");
      out.write("                    }\n");
      out.write("                    document.getElementById(cityName).style.display = \"block\";\n");
      out.write("                    evt.currentTarget.className += \" active\";\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                // Get the element with id=\"defaultOpen\" and click on it\n");
      out.write("                document.getElementById(\"defaultOpen\").click();\n");
      out.write("            </script>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
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
    _jspx_th_fmt_setLocale_0.setValue(new String("vi_VN"));
    int _jspx_eval_fmt_setLocale_0 = _jspx_th_fmt_setLocale_0.doStartTag();
    if (_jspx_th_fmt_setLocale_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_setLocale_value_nobody.reuse(_jspx_th_fmt_setLocale_0);
      return true;
    }
    _jspx_tagPool_fmt_setLocale_value_nobody.reuse(_jspx_th_fmt_setLocale_0);
    return false;
  }
}
