<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier une Agence</title>
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
    </style>
</head>
<body>
<div class="container">
    <h1>Modifier le service</h1>
    <form action="/admin/update-service" method="post">
        <label for="nom">Nom du Service :</label>
        <input type="hidden" name="idService" value="${service.idService}">

        <input type="text" id="nom" name="nom" value="${service.nom}" placeholder="Ex : Banque" required>

        <label for="description">Description :</label>
        <textarea id="description" name="description" value="${service.description}" placeholder="Ex : Services bancaires pour particuliers et entreprises" required></textarea>

        <button type="submit">Enregistrer</button>
    </form>
</div>
</body>
</html>
