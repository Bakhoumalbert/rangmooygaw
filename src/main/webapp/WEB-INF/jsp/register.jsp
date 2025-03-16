<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <style>
        /* Style global */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Carte du formulaire */
        .register-container {
            background-color: white;
            padding: 45px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 320px;
        }

        h2 {
            color: #333;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
            text-align: left;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        /* Style du bouton */
        button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        /* Style du lien */
        a {
            display: block;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h2>Inscription</h2>
    <form action="${pageContext.request.contextPath}/auth/register" method="post">
        <label>Nom :</label>
        <input type="text" name="nom" required>

        <label>Email :</label>
        <input type="email" name="email" required>

        <label>Mot de passe :</label>
        <input type="password" name="motDePasse" required>

        <label>Rôle :</label>
        <select name="role">
            <option value="ADMIN">Admin</option>
            <option value="AGENT">Agent</option>
            <option value="CLIENT">Client</option>
        </select>

        <button type="submit">S'inscrire</button>
    </form>

    <a href="login">Déjà un compte ? Se connecter</a>
</div>

</body>
</html>
