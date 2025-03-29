<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Gestion des Tickets</title>
    <style>
        /* 🌍 Style général */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        /* 🏷️ Titre principal */
        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        /* 📊 Style du tableau */
        table {
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        /* 🏷️ Entête du tableau */
        thead {
            background-color: #007bff;
            color: white;
        }

        /* 📌 Colonnes */
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        /* 🌟 Lignes alternées */
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* 🎯 Bouton "Traiter" */
        button {
            background-color: #28a745;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        /* ✨ Effet au survol */
        button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* 🔗 Lien de déconnexion */
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #dc3545;
            font-weight: bold;
            transition: 0.3s;
        }

        a:hover {
            color: #b32b3b;
            text-decoration: underline;
        }

        /* 📱 Responsive : adapter le tableau aux petits écrans */
        @media screen and (max-width: 768px) {
            table {
                width: 100%;
                font-size: 14px;
            }

            th, td {
                padding: 10px;
            }

            button {
                padding: 6px 12px;
                font-size: 12px;
            }
        }
        /* 🌟 Statut : couleurs dynamiques */
        .status-traité {
            color: #28a745; /* Vert */
            font-weight: bold;
        }

        .status-attente {
            color: #FFA500; /* Orange */
            font-weight: bold;
        }

        /* 🛑 Boutons dynamiques */
        button:disabled {
            background-color: #6c757d; /* Gris */
            cursor: not-allowed;
        }

    </style>
</head>
<body>

<h2>Tableau de Bord - Agent</h2>

<table>
    <thead>
    <tr>
        <th>Numéro de Ticket</th>
        <th>Statut</th>
        <th>Action</th>
        <th>Suppression</th>
    </tr>
    </thead>
    <tbody id="ticketTableBody">
    <!-- 🔥 Tickets seront insérés ici dynamiquement -->
    </tbody>
</table>

<a href="${pageContext.request.contextPath}/logout">Se déconnecter</a>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const tickets = JSON.parse('${ticketsJson}');
        const tableBody = document.getElementById("ticketTableBody");

        if (tickets.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='4'>Aucun ticket disponible</td></tr>";
            return;
        }

        tickets.forEach(ticket => {
            const row = document.createElement("tr");

            // 📌 Numéro de ticket
            const numCell = document.createElement("td");
            numCell.textContent = ticket.numero;

            // 📌 Statut
            const statusCell = document.createElement("td");
            statusCell.textContent = ticket.statut;

            if (ticket.statut === "TRAITÉ") {
                statusCell.classList.add("status-traité");
            } else if (ticket.statut === "EN ATTENTE") {
                statusCell.classList.add("status-attente");
            }

            // 📌 Bouton Traiter
            const actionCell = document.createElement("td");
            const formTraiter = document.createElement("form");
            formTraiter.action = "/agent/traiter-ticket";
            formTraiter.method = "post";

            const hiddenId = document.createElement("input");
            hiddenId.type = "hidden";
            hiddenId.name = "idTicket";
            hiddenId.value = ticket.id;

            const traiterButton = document.createElement("button");
            traiterButton.type = "submit";
            traiterButton.textContent = "Traiter";

            if (ticket.statut === "TRAITÉ") {
                traiterButton.disabled = true;
            }

            formTraiter.appendChild(hiddenId);
            formTraiter.appendChild(traiterButton);
            actionCell.appendChild(formTraiter);

            // 📌 Bouton Supprimer
            const deleteCell = document.createElement("td");
            if (ticket.statut === "TRAITÉ") {
                const formSupprimer = document.createElement("form");
                formSupprimer.action = "/agent/ticket/supprimer";
                formSupprimer.method = "post";
                formSupprimer.onsubmit = () => confirm("Supprimer ce ticket ?");

                const hiddenDeleteId = document.createElement("input");
                hiddenDeleteId.type = "hidden";
                hiddenDeleteId.name = "ticketId";
                hiddenDeleteId.value = ticket.id;

                const deleteButton = document.createElement("button");
                deleteButton.type = "submit";
                deleteButton.textContent = "Supprimer";
                deleteButton.style.backgroundColor = "#dc3545";
                deleteButton.style.marginLeft = "5px";

                formSupprimer.appendChild(hiddenDeleteId);
                formSupprimer.appendChild(deleteButton);
                deleteCell.appendChild(formSupprimer);
            } else {
                deleteCell.textContent = "-";
            }

            row.appendChild(numCell);
            row.appendChild(statusCell);
            row.appendChild(actionCell);
            row.appendChild(deleteCell);
            tableBody.appendChild(row);
        });
    });
</script>

</body>
</html>
