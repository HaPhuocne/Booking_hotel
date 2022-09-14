<%-- 
    Document   : homeForUser.jsp
    Created on : Oct 14, 2021, 9:23:44 PM
    Author     : Phước Hà
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        

    </head>
    <body>
        <h1>HomeForUser</h1>
        <!-- Header -->
        <div id="header">
            <div class="shell">
                <!-- Logo + Top Nav -->
                <div id="top">
                    <h1><a href="LoadHotelUserServlet">SpringTime</a></h1>
                    <div id="top-navigation">

                        <c:if test="${sessionScope.ACC != null}">
                            <c:if test="${sessionScope.ACC.roleId eq '1'}">
                                <c:redirect url="login.html"></c:redirect>
                            </c:if>
                            <c:if test="${sessionScope.ACC.roleId ne '1'}">
                                Welcome, ${sessionScope.ACC.userId}
                                <a href="MainController?btnAction=logout">Log out</a>
                            </c:if>
                            <span>|</span>

                        </c:if>
                        <c:if test="${sessionScope.ACC == null}">
                            <span>|</span>
                            <a href="MainController?btnAction=loginPage">Log In</a>
                        </c:if>




                    </div>
                </div>
                <!-- End Logo + Top Nav -->
                <!-- Main Nav -->
                <div id="navigation">
                    <ul>
                        <li><a href="MainController?btnAction=" class="active" ><span>Home Page</span></a></li>
                        <li><a href="MainController?btnAction=ViewCart"><span>View Cart</span></a></li>
                        <li><a href="MainController?btnAction=ViewOrder"><span>View Order</span></a></li>
                    </ul>
                </div>
                <!-- End Main Nav -->
            </div>
        </div>
        <!-- End Header -->
        <!-- Container -->
        <div id="container">
            <div class="shell">
                <!-- Small Nav -->
                <!-- End Small Nav -->
                <!-- Message OK -->
                <!-- End Message OK -->
                <!-- Message Error -->
                <!-- End Message Error -->
                <br />
                <!-- Main -->
                <div id="main">
                    <div class="cl">&nbsp;</div>
                    <!-- Content -->
                    <div id="content">
                        <!-- Box -->
                        <div class="box">
                            <!-- Box Head -->
                            <div class="box-head">
                                <h2 class="left">Current Articles</h2>
                                <div class="right">
                                    <label style="color: white">${requestScope.SEARCH_MSG}</label>
                                </div>
                                <div class="right">
                                    <label style="color: white">${requestScope.ORDER_MSG}</label>
                                </div>



                            </div>
                            <!-- End Box Head -->
                            <!-- Table -->
                            <div class="table">
                                <c:if test="${requestScope.LIST_HOTEL != null}">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th>No.</th>
                                            <th>Hotel Name</th>
                                            <th>Hotel Address</th>
                                            <th>Available</th>
                                          
                                            <th width="110" class="ac">Content Control</th>
                                        </tr>

                                        <c:forEach var="h" items="${requestScope.LIST_HOTEL}" varStatus="count">
                                            <tr>
                                                <td>${count.count}</td>
                                                <td><h3><a href="#">${h.hotelName}</a></h3></td>
                                                <td>${h.hotelAddress}</td>
                                                <td>${h.available}</td>
                                                
                                                <td><a href="MainController?btnAction=viewListRoom&hotelId=${h.hotelId}" class="ico edit">Detail</a></td>
                                            </tr>
                                        </c:forEach>


                                    </table>
                                </c:if>

                                <!-- Pagging -->

                                <!-- End Pagging -->
                            </div>
                            <!-- Table -->
                        </div>
                        <!-- End Box -->
                        <!-- Box -->
                        <!-- End Box -->
                    </div>
                    <!-- End Content -->
                    <!-- Sidebar -->
                    <div id="sidebar">
                        <!-- Box -->
                        <div class="box">
                            <form action="MainController">
                                <!-- Box Head -->
                                <div class="box-head">
                                    <h2>Management</h2>
                                </div>

                                <!-- Date Picker -->
                                Search: <input type="text" name="searchValue" class="field small-field" value="${sessionScope.SEARCH_VALUE}" />
                                <hr>
                                <input  type="date" name="checkIn" class="" value="${sessionScope.CHECKIN_DATE}" >
                                <input  type="date" name="checkOut" class="" value="${sessionScope.CHECKOUT_DATE}" >
                                 <hr>
                                Available Room:<input style="width: 50px"  type="number" name="avaiRoom" class="" value="${sessionScope.AVAIROOM}" >
                                <!-- Date Picker -->
                                <!-- End Box Head-->
                                <!-- Sort -->
                                <hr>
                                
                                <!-- End Sort -->
                                <button name="btnAction" value="SearchHotel" class="btn btn-primary" style="width: 100%">Search</button>
                            </form>
                        </div>

                        <!-- End Box -->
                    </div>
                    <!-- End Sidebar -->
                    <div class="cl">&nbsp;</div>
                </div>
                <!-- Main -->
            </div>
        </div>
        <!-- End Container -->
        <!-- Footer -->
        <div id="footer">
            <div class="shell"> <span class="left">&copy; 2010 - CompanyName</span> <span class="right"> Design by <a href="http://chocotemplates.com">Chocotemplates.com</a> </span> </div>
        </div>
        <!-- End Footer -->
    </body>
</html>
