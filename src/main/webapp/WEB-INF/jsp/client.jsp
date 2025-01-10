<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Espace Client</title>
</head>
<body>
<h1>Bienvenue, ${client.nom}</h1>
<section>
    <h2>Prendre un ticket</h2>
    <form action="takeTicket" method="post">
        <label for="service">Choisir un service :</label>
        <select name="serviceId" id="service">
            <c:forEach var="service" items="${services}">
                <option value="${service.idService}">${service.nom}</option>
            </c:forEach>
        </select>
        <button type="submit">Prendre un ticket</button>
    </form>
</section>
<section>
    <h2>Position actuelle</h2>
    <p>Numéro actuel : ${ticket.numeroActuel}</p>
    <p>Votre position : ${ticket.position}</p>
</section>
</body>
</html>
