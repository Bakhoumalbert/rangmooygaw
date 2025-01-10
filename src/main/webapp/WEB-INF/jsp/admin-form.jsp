<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Admin</title>
</head>
<body>
<h1>Ajouter un Admin</h1>
<form action="/admin" method="post">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="${admin.nom}" required>
    <br>
    <label for="email">Email :</label>
    <input type="email" id="email" name="email" value="${admin.email}" required>
    <br>
    <button type="submit">Enregistrer</button>
</form>
</body>
</html>
