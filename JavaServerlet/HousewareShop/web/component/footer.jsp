<%-- 
    Document   : footer
    Created on : Oct 7, 2019, 8:35:17 PM
    Author     : ThinkPro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!-- Footer -->
<section id="footer">
    <div class="container">
        <div class="row text-center text-xs-center text-sm-left text-md-left">
            <div class="col-xs-12 col-sm-4 col-md-4">
                <ul class="list-unstyled quick-links">
                    <img src="images/My_Facebook_Code.png" alt="" style="height: 250px"/>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <h5>About Website</h5>
                <ul class="list-unstyled quick-links">
                    <li><a href="http://localhost:8080/HousewareShop/home"><i class="fa fa-angle-double-right"></i>Home</a></li>
                    <li><a href="#"><i class="fa fa-angle-double-right"></i>About</a></li>
                    <li><a href="http://localhost:8080/HousewareShop/sort-product"><i class="fa fa-angle-double-right"></i>Product</a></li>
                    <li><a href="http://localhost:8080/HousewareShop/get-list-sale"><i class="fa fa-angle-double-right"></i>Sale now</a></li>
                    <li><a href="http://localhost:8080/HousewareShop/sign-up"><i class="fa fa-angle-double-right"></i>Singup</a></li>
                    <li><a href="<c:if test="${sessionScope.account ne null}">http://localhost:8080/HousewareShop/my-profile"></c:if>
                            <c:if test="${sessionScope.account eq null}">http://localhost:8080/HousewareShop/login">
                            </c:if><i class="fa fa-angle-double-right"></i>Your-Profile</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <h5>Contact</h5>

                <ul class="list-unstyled quick-links">
                    <li><a><i class="fas fa-phone-volume"></i>0866823499</a><a><i class="fa fa-envelope ml-3"></i>lehonguan15a@gmail.com</a></li>
                    <li><a href="https://www.google.com/maps?ll=20.994897,105.523648&z=15&t=m&hl=vi&gl=US&mapclient=embed&saddr=QL21,+Th%E1%BA%A1ch+Ho%C3%A0,+Th%E1%BA%A1ch+Th%E1%BA%A5t,+H%C3%A0+N%E1%BB%99i&daddr=Ng%C3%A3+ba+H%C3%B2a+L%E1%BA%A1c+-+QL+21,+H%C3%B2a+L%E1%BA%A1c,+Th%E1%BA%A1ch+Th%E1%BA%A5t,+H%C3%A0+N%E1%BB%99i&dirflg=d"><i class="fa fa-angle-double-right"></i>21, Thôn 6, Xã Thạch Hòa, Huyện Thạch Thất, Hà Nội, Việt Nam</a></li>
                    <div id="map" style="height:150px;">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d28951.161087040786!2d105.51070539259248!3d20.995169088270938!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e0!4m3!3m2!1d20.9946236!2d105.52396399999999!4m5!1s0x31345b9f825d11d7%3A0x1772bcf973ec956c!2zTmfDoyBiYSBIw7JhIEzhuqFjIC0gUUwgMjEsIEjDsmEgTOG6oWMsIFRo4bqhY2ggVGjhuqV0LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!3m2!1d20.994598999999997!2d105.523479!5e0!3m2!1svi!2s!4v1573398015876!5m2!1svi!2s" width="250" height="100" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                    </div>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                <ul class="list-unstyled list-inline social text-center">
                    <li class="list-inline-item"><a href="https://www.facebook.com/messages/t/xb.jamesgosling"><i class="fab fa-facebook"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                    <li class="list-inline-item"><a href="https://www.instagram.com/xbjamesgosling/?hl=vi"><i class="fab fa-instagram"></i></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fas fa-phone-volume"></i></a></li>
                    <li class="list-inline-item"><a href="mailto:lehongquan15a@gmail.com?cc=name2@rapidtables.com&bcc=name3@rapidtables.com
                                                    &amp;subject=The%20subject%20of%20the%20email
                                                    &amp;body=The%20body%20of%20the%20email" target="_blank"><i class="fa fa-envelope"></i></a></li>
                </ul>
            </div>
            </hr>
        </div>	
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
                <p><u><a href="https://www.nationaltransaction.com/">National Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
                <p class="h6">&copy copyright by <a class="text-green" href="http://localhost:8080/HousewareShop/home" target="_blank">HousewareShop</a></p>
            </div>
            </hr>
        </div>	
    </div>
</section>
<!-- ./Footer -->





<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
