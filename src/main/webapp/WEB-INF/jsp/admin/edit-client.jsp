<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier Client</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px;
        }

        .buton {
            display: block;
            text-align: center;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .buton:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<h1>Modifier Client</h1>

<div class="container">
    <div class="nav">
        <a href="/admin/clients" class="buton">Retour</a>
    </div>
    <form action="/admin/update-client" method="post">
        <input type="hidden" name="id" value="${client.id}">

        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" value="${client.nom}" required>

        <label for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom" value="${client.prenom}" required>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" value="${client.email}" required>

        <label for="telephone">Téléphone :</label>
        <input type="text" id="telephone" name="telephone" value="${client.telephone}" required>

        <button type="submit">Modifier</button>
    </form>
</div>

</body>
</html>
