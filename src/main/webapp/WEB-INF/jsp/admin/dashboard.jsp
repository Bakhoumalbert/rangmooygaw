<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de Bord Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        td {
            background-color: white;
        }

        .container {
            max-width: 1000px;
            margin: auto;
        }

        .info {
            font-size: 14px;
            color: #777;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Tableau de Bord Admin</h1>

    <h2>Files d'Attente</h2>

    <table>
        <thead>
        <tr>
            <th>Service</th>
            <th>Agence</th>
            <th>Numéro en cours</th>
            <th>Date de Création</th>
            <th>Statut</th>
        </tr>
        </thead>
        <tbody id="fileTableBody">
        <tr><td colspan="4">Chargement des données...</td></tr>
        </tbody>
    </table>

    <p class="info">Affichage des tickets en cours de traitement (statut <strong>EN COURS</strong>).</p>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const tickets = JSON.parse('${fileJson}'); // JSON injecté depuis le contrôleur
        const tableBody = document.getElementById("fileTableBody");

        tableBody.innerHTML = ""; // On vide la table

        if (tickets.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='4'>Aucune file d'attente active pour le moment.</td></tr>";
            return;
        }

        tickets.forEach(ticket => {
            const row = document.createElement("tr");

            const tdService = document.createElement("td");
            tdService.textContent = ticket.service;

            const tdAgence = document.createElement("td");
            tdAgence.textContent = ticket.agence;

            const tdNumero = document.createElement("td");
            tdNumero.textContent = ticket.numero;

            const tdDate = document.createElement("td");
            tdDate.textContent = ticket.dateCreation;

            const tdStatut = document.createElement("td");
            tdStatut.textContent = ticket.statut;
            tdStatut.classList.add("status");

            // 🎨 Appliquer une couleur selon le statut
            switch (ticket.statut) {
                case "EN ATTENTE":
                    tdStatut.classList.add("en-attente");
                    break;
                case "EN COURS":
                    tdStatut.classList.add("en-cours");
                    break;
                case "TRAITÉ":
                    tdStatut.classList.add("traite");
                    break;
            }


            row.appendChild(tdService);
            row.appendChild(tdAgence);
            row.appendChild(tdNumero);
            row.appendChild(tdDate);
            row.appendChild(tdStatut);

            tableBody.appendChild(row);
        });
    });
</script>

</body>
</html>
