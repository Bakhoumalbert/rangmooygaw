<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Créer un Client</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .form-container {
            width: 50%;
            margin: auto;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Créer un Client</h1>
    <form action="/admin/create-client" method="post">
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" value="${client.nom}" required>

        <label for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom" value="${client.prenom}" required>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" value="${client.email}" required>

        <label for="telephone">Téléphone :</label>
        <input type="text" id="telephone" name="telephone" value="${client.telephone}" required>

        <button type="submit">Enregistrer</button>
    </form>
</div>
</body>
</html>
