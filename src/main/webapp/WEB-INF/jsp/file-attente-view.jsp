<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion de la File d'Attente</title>
</head>
<body>
<h1>File d'Attente</h1>
<p>Numéro en cours : ${fileAttente.numeroEnCours}</p>

<h2>Clients en attente</h2>
<table border="1">
    <tr>
        <th>Numéro de Ticket</th>
        <th>Nom</th>
        <th>Position</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="ticket" items="${tickets}">
        <tr>
            <td>${ticket.numero}</td>
            <td>${ticket.client.nom}</td>
            <td>${ticket.position}</td>
            <td>
                <form action="/agent/cancel/${ticket.id}" method="post">
                    <button type="submit">Annuler</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<form action="/agent/next/${fileAttente.id}" method="post">
    <button type="submit">Appeler Client Suivant</button>
</form>
</body>
</html>
