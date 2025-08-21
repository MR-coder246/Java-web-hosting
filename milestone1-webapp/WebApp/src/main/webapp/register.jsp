<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
<div class="bg-white p-8 rounded shadow-md w-96">
    <h2 class="text-2xl font-bold mb-4 text-center">Register</h2>
    <% if (request.getAttribute("error") != null) { %>
    <p class="text-red-500 mb-4"><%= request.getAttribute("error") %></p>
    <% } %>
    <form action="register" method="post">
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Student Number</label>
            <input type="text" name="studentNumber" class="mt-1 p-2 w-full border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Name</label>
            <input type="text" name="name" class="mt-1 p-2 w-full border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Surname</label>
            <input type="text" name="surname" class="mt-1 p-2 w-full border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Email</label>
            <input type="email" name="email" class="mt-1 p-2 w-full border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Phone</label>
            <input type="text" name="phone" class="mt-1 p-2 w-full border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" name="password" class="mt-1 p-2 w-full border rounded" required>
        </div>
        <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded w-full">Register</button>
    </form>
    <p class="mt-4 text-center">Already have an account? <a href="login.jsp" class="text-blue-500">Login</a></p>
</div>
</body>
</html>
