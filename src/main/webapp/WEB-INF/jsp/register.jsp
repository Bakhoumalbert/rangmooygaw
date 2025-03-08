<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inscription</title>
</head>
<body>
<h2>Inscription</h2>
<form action="register" method="post">
    <label>Nom :</label>
    <input type="text" name="nom" required>
    <br>
    <label>Email :</label>
    <input type="email" name="email" required>
    <br>
    <label>Mot de passe :</label>
    <input type="password" name="motDePasse" required>
    <br>
    <label>Rôle :</label>
    <select name="role">
        <option value="ADMIN">Admin</option>
        <option value="AGENT">Agent</option>
        <option value="CLIENT">Client</option>
    </select>
    <br>
    <button type="submit">S'inscrire</button>
</form>
<p><a href="login">Déjà un compte ? Se connecter</a></p>
</body>
</html>
