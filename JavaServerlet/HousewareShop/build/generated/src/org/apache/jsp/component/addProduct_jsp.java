package org.apache.jsp.component;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form class=\"modal-content animate\" style=\"padding: 5px;border-top:none;border-bottom: none\" action=\"uploadFile\" method=\"post\" enctype=\"multipart/form-data\" accept-charset=\"UTF-8\">\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <label for=\"code\"><b>Code of product</b></label><br>\n");
      out.write("                <input class=\"text\" type=\"text\" placeholder=\"Enter code of product\" name=\"code\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.code}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required><br>\n");
      out.write("\n");
      out.write("                <label for=\"name\"><b>Name of Product</b></label><br>\n");
      out.write("                <input class=\"text\" type=\"text\" placeholder=\"Enter name of product\" name=\"name\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <label for=\"image\" ><b>Images Product</b></label><br>\n");
      out.write("\n");
      out.write("                <input type=\"file\" name=\"fileName\" class=\"form-control-file\" multiple><br>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"exampleFormControlSelect1\"><b>Category</b></label>\n");
      out.write("                    <select class=\"form-control\" name=\"subCategory\"id=\"exampleFormControlSelect1\">\n");
      out.write("                        <c:forEach items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${listSubCategory}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" var=\"subCategory\">\n");
      out.write("                            <option value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${subCategory.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write('"');
      out.write('>');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${subCategory.subCategoryName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</option>\n");
      out.write("                        </c:forEach>\n");
      out.write("                    </select>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"quantity\"><b>Quantity of product</b></label>\n");
      out.write("                    <input class=\"text\" class=\"form-control\" type=\"number\" placeholder=\"Enter quantity of product\" name=\"quantity\" required>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"price\"><b>Price of Product</b></label>\n");
      out.write("                    <input class=\"text\" class=\"form-control\" type=\"number\" placeholder=\"Enter price of product\" name=\"price\" required>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"status\"><b>status of Product</b></label>\n");
      out.write("                    <select class=\"form-control\" name=\"status\"id=\"exampleFormControlSelect1\">\n");
      out.write("                        <c:forEach items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${listStatusProduct}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" var=\"statusProduct\">\n");
      out.write("                            <option value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${statusProduct.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write('"');
      out.write('>');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${statusProduct.status}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</option>\n");
      out.write("                        </c:forEach>\n");
      out.write("                    </select>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"exampleFormControlTextarea1\"><b>Description of Product</b></label>\n");
      out.write("                    <textarea class=\"form-control\" id=\"exampleFormControlTextarea1\" rows=\"3\" name=\"description\"></textarea>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <button class=\"btn btn-outline-info\" style=\"width: 55%\" type=\"submit\" ><i class=\"fas fa-sync-alt mr-2\"></i>Update</button>\n");
      out.write("                <a data-dismiss=\"modal\" class=\"btn btn-outline-danger\" style=\"width: 44%\" ><i class=\"fas fa-window-close mr-2\"></i></i>Cancel</a>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
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
}
