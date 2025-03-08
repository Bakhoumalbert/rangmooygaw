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
    <h1>Modifier l'Agence</h1>
    <form action="/admin/update-agence" method="post">
        <input type="hidden" name="id_agence" value="${agence.id_agence}">

        <label for="nom">Nom de l'agence :</label>
        <input type="text" id="nom" name="nom" value="${agence.nom}" placeholder="Ex: Orange agence" required>

        <label for="localisation">Localisation :</label>
        <input type="text" id="localisation" name="localisation" value="${agence.localisation}" required>

        <button type="submit">Modifier</button>
    </form>
</div>
</body>
</html>
