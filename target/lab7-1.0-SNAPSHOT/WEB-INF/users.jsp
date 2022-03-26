
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>

    </head>
    <body>
        
        <div class="container">
            <h1 class="text-center">Simple User Management System</h1>
            <h2 class="text-left">Add new user:</h2>
                <form action="user" method="POST">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>Password</th>
                                <th>Role</th>
                                <th>Active</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="email" name="email">
                                </td>
                                <td>
                                    <input type="text" name="firstName">
                                </td>
                                <td>
                                    <input type="text" name="lastName">
                                </td>
                                <td>
                                    <input type="password" name="password">
                                </td>
                                <td>
                                    <select name="role">
                                        <option value="">Please select a role</option>
                                        <c:forEach var="role" items="${roles}">
                                            <option value="${role.name}">${role.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <input type="checkbox" name="active">
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-primary btn-sm" name="action" value="add">Add</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            
            <h2 class="text-center">Users</h2>
            <form action="user" method="POST" >
                <table class="table">
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Active</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.email}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.active ? "Y" : "N"}</td>
                                <td>
                                    <button type="submit" class="btn btn-primary btn-sm" name="action"  value="edit?${user.email}">Edit</button>
                                    <button type="submit" class="btn btn-danger btn-sm" name="action" value="delete?${user.email}">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </form>
            
            <h2 class="text-left">Edit user:</h2>
            <form action="user" method="POST">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Active</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="email" name="email" readonly value="${user.email}">
                            </td>
                            <td>
                                <input type="text" name="firstName" value="${user.firstName}">
                            </td>
                            <td>
                                <input type="text" name="lastName" value="${user.lastName}">
                            </td>
                            <td>
                                <input type="password" name="password" value="${user.password}">
                            </td>
                            <td>
                                <select name="role">
                                    <option value="">Please select a role</option>
                                    <c:forEach var="role" items="${roles}">
                                        <option value="${role.name}">${role.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <input type="checkbox" name="active">
                            </td>
                            <td>
                                <button type="submit" class="btn btn-primary btn-sm" name="action" value="edit">Save</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <p class="text-center alert alert-success">${message}</p>
        </div>
    </body>
</html>

