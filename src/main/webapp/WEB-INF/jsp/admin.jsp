<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vue Admin - File d'Attente</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Vue Admin</h1>
    <h2>Informations sur la File d'Attente</h2>

    <!-- Tableau pour afficher dynamiquement les informations -->
    <table id="fileAttenteTable">
        <thead>
        <tr>
            <th>Service</th>
            <th>Agence</th>
            <th>Numéro en cours</th>
            <th>Date de Création</th>
        </tr>
        </thead>
        <tbody>
        <!-- Les données seront ajoutées ici par le script -->
        </tbody>
    </table>
</div>

<script>
    // Convertir les données JSON de la file d'attente
    const fileAttente = JSON.parse('${fileAttente}');
    console.log("File d'attente :", fileAttente);

    // Référencer le tableau HTML
    const tableBody = document.getElementById("fileAttenteTable").querySelector("tbody");

    // Remplir le tableau avec les données
    fileAttente.forEach(file => {
        const row = document.createElement("tr");

        // Colonnes du tableau
        row.innerHTML = `
            <td>${file.service.nom}</td>
            <td>${file.agence.localisation}</td>
            <td>${file.numeroEnCours}</td>
            <td>${file.dateCreation}</td>
        `;

        // Ajouter la ligne au tableau
        tableBody.appendChild(row);
    });
</script>
</body>
</html>
