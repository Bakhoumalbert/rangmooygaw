<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vue Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Vue Admin</h1>
    <table>
        <thead>
        <tr>
            <th>Localisation</th>
            <th>Numéro en cours</th>
            <th>Dernier numéro délivré</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="entry" items="${queues}">
            <tr>
                <td>${entry.key}</td>
                <td>${entry.value.currentNumber}</td>
                <td>${entry.value.lastIssuedNumber}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
