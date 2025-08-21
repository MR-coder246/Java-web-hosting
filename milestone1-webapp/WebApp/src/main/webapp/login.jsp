<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
<div class="bg-white p-8 rounded shadow-md w-96">
    <h2 class="text-2xl font-bold mb-4 text-center">Login</h2>
    <% if (request.getAttribute("error") != null) { %>
    <p class="text-red-500 mb-4"><%= request.getAttribute("error") %></p>
    <% } %>
    <% if (request.getAttribute("message") != null) { %>
    <p class="text-green-500 mb-4"><%= request.getAttribute("message") %></p>
    <% } %>
    <form action="login" method="post">
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Student Number</label>
            <input type="text" name="studentNumber" class="mt-1 p-2 w-full border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" name="password" class="mt-1 p-2 w-full border rounded" required>
        </div>
        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded w-full">Login</button>
    </form>
    <p class="mt-4 text-center">Don't have an account? <a href="register.jsp" class="text-blue-500">Register</a></p>
</div>
</body>
</html>