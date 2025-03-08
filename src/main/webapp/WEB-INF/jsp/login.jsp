<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion</title>
</head>
<body>
<h2>Connexion</h2>
<form action="login" method="post">
    <label>Email :</label>
    <input type="email" name="email" required>
    <br>
    <label>Mot de passe :</label>
    <input type="password" name="motDePasse" required>
    <br>
    <button type="submit">Se connecter</button>
</form>
<p><a href="register">Créer un compte</a></p>
</body>
</html>
