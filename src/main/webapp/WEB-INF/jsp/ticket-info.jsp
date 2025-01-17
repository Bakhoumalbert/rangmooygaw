<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Votre Ticket</title>
</head>
<body>
<h1>Informations sur votre ticket</h1>
<p><strong>Numéro de ticket :</strong> ${ticket.numero}</p>
<p><strong>Position dans la file :</strong> ${ticket.position}</p>
<p><strong>Nombre de personnes devant :</strong> ${ticket.personnesDevant}</p>
<p><strong>Numéro en cours de traitement :</strong> ${ticket.numeroActuel}</p>
</body>
</html>
