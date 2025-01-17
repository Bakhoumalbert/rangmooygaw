<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sélectionnez une Localisation</title>
</head>
<body>
<h1>Veuillez sélectionner une localisation pour le service</h1>
<form action="/client/get-ticket" method="post">
    <input type="hidden" name="serviceId" value="${serviceId}" />
    <label for="localisation">Localisation :</label>
    <select id="localisation" name="localisationId">
        <c:forEach var="localisation" items="${localisations}">
            <option value="${localisation.idAgence}">${localisation.localisation}</option>
        </c:forEach>
    </select>
    <button type="submit">Obtenir un ticket</button>
</form>
</body>
</html>
