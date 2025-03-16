<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Mes Tickets</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

<h2>Mes Tickets</h2>

<table>
    <thead>
    <tr>
        <th>Numéro</th>
        <th>Date</th>
        <th>Statut</th>
        <th>Service</th>
    </tr>
    </thead>
    <tbody id="ticketTableBody">
    <!-- 🔥 Les tickets seront insérés ici dynamiquement -->
    </tbody>
</table>

<a href="${pageContext.request.contextPath}/client">Retour à l'accueil</a>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Récupération des tickets envoyés par le backend
        const tickets = JSON.parse('${ticketsJson}');

        const tableBody = document.getElementById("ticketTableBody");

        if (tickets.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='4'>Aucun ticket disponible</td></tr>";
            return;
        }

        // Remplissage du tableau
        tickets.forEach(ticket => {
            let row = document.createElement("tr");

            let numCell = document.createElement("td");
            numCell.textContent = ticket.numero;

            let dateCell = document.createElement("td");
            dateCell.textContent = new Date(ticket.dateCreation).toLocaleString(); // Formatage

            let statusCell = document.createElement("td");
            statusCell.textContent = ticket.statut;

            let serviceCell = document.createElement("td");
            serviceCell.textContent = ticket.service.nom; // Nom du service

            row.appendChild(numCell);
            row.appendChild(dateCell);
            row.appendChild(statusCell);
            row.appendChild(serviceCell);

            tableBody.appendChild(row);
        });
    });
</script>

</body>
</html>
