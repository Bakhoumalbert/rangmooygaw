<%@ page import="multiservice.sn.rangmooygaw.entite.Services" %>
<%@ page import="multiservice.sn.rangmooygaw.entite.Agence" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Modifier une Agence</h1>
    <form action="/admin/update-agence" method="post">
        <input type="hidden" name="id" value="${agence.id}">

        <label for="nom">Nom de l'agence :</label>
        <input type="text" id="nom" name="nom" value="${agence.nom}" required>

        <label for="localisation">Localisation :</label>
        <input type="text" id="localisation" name="localisation" value="${agence.localisation}" required>

<%--        <label for="services">Choisir les services associés :</label>--%>
<%--        <select id="services" name="servicesId" multiple>--%>
<%--            <% for (Services service : (List<Services>) request.getAttribute("services")) { %>--%>
<%--            <option value="<%= service.getIdService() %>"--%>
<%--                    <%= agence.getServices().contains(service) ? "selected" : "" %>><%= service.getNom() %>--%>
<%--            </option>--%>
<%--            <% } %>--%>
<%--        </select>--%>

        <button type="submit">Mettre à Jour</button>
    </form>
</div>
</body>
</html>
