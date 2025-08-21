<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (session.getAttribute("userName") == null) {
    response.sendRedirect("login.jsp");
    return;
} %>
<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
<div class="bg-white p-8 rounded shadow-md text-center">
    <h2 class="text-2xl font-bold mb-4">Welcome, <%= session.getAttribute("userName") %>!</h2>
    <p class="mb-4">Your student number: <%= session.getAttribute("studentNumber") %></p>
    <a href="logout" class="bg-red-500 text-white px-4 py-2 rounded">Logout</a>
</div>
</body>
</html>