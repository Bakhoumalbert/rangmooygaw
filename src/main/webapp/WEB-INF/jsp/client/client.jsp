<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Espace Client</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        .buton {
            display: inline-block;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .buton:hover {
            background-color: #218838;
        }

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

        .status {
            font-weight: bold;
        }

        .pending {
            color: orange;
        }

        .done {
            color: green;
        }
    </style>
</head>
<body>

<h2>Bienvenue sur votre espace client</h2>
<p>Accédez à vos services ici.</p>

<!-- ✅ Lien pour accéder à la file d'attente -->
<a href="/client/file-attente" class="buton">Accéder au file d'attente</a>

<h2>Mes Tickets</h2>

<!-- ✅ Tableau pour afficher les tickets -->
<table>
    <thead>
    <tr>
        <th>Numéro</th>
        <th>Date</th>
        <th>Service</th>
        <th>Statut</th>
    </tr>
    </thead>
    <tbody id="ticketTableBody">
    <tr><td colspan='3'>Chargement des tickets...</td></tr> <!-- Message temporaire -->
    </tbody>
</table>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 📌 Récupération des tickets envoyés par le backend en JSON
        const tickets = JSON.parse('${ticketJson}');

        const tableBody = document.getElementById("ticketTableBody");

        // Vérifier s'il y a des tickets
        if (tickets.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='3'>Aucun ticket disponible</td></tr>";
            return;
        }

        // 🏷️ Remplissage dynamique du tableau
        tableBody.innerHTML = ""; // Nettoyer avant ajout
        tickets.forEach(ticket => {
            let row = document.createElement("tr");

            let cellNumero = document.createElement("td");
            cellNumero.textContent = ticket.numero;

            let cellDate = document.createElement("td");
            cellDate.textContent = ticket.dateCreation; // 📌 Vérifie le format côté backend

            let serviceCell = document.createElement("td");
            serviceCell.textContent = ticket.service.nom; // Nom du service

            let cellStatut = document.createElement("td");
            cellStatut.textContent = ticket.statut;
            cellStatut.classList.add("status", ticket.statut === "EN ATTENTE" ? "pending" : "done");



            row.appendChild(cellNumero);
            row.appendChild(cellDate);
            row.appendChild(serviceCell);
            row.appendChild(cellStatut);

            tableBody.appendChild(row);
        });
    });
</script>

</body>
</html>
