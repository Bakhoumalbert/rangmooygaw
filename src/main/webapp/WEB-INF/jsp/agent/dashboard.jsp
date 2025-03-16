<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Gestion des Tickets</title>
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

        button {
            background-color: #28a745;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
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
    </tr>
    </thead>
    <tbody id="ticketTableBody">
    <!-- 🔥 Tickets seront insérés ici dynamiquement -->
    </tbody>
</table>

<a href="${pageContext.request.contextPath}/logout">Se déconnecter</a>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 🔥 Récupération des tickets envoyés par le backend en JSON
        const tickets = JSON.parse('${ticketsJson}');

        console.log("Tickets chargés :", tickets);

        const tableBody = document.getElementById("ticketTableBody");

        // Vérifier si des tickets existent
        if (tickets.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='3'>Aucun ticket disponible</td></tr>";
            return;
        }

        // 🔁 Remplissage dynamique du tableau
        tickets.forEach(ticket => {
            let row = document.createElement("tr"); // ✅ Création d'une ligne

            let numCell = document.createElement("td");
            numCell.textContent = ticket.numero; // 🔥 Numéro du ticket

            let statusCell = document.createElement("td");
            statusCell.textContent = ticket.statut; // 🔥 Statut du ticket

            let actionCell = document.createElement("td"); // ✅ Création de la cellule Action

            let form = document.createElement("form");
            form.action = "/agent/traiter-ticket"; // 🚀 URL correcte
            form.method = "post"; // 🛑 Requête POST

            let inputHidden = document.createElement("input");
            inputHidden.type = "hidden";
            inputHidden.name = "idTicket"; // 🔥 Correspond à @RequestParam("idTicket")
            inputHidden.value = ticket.id; // ✅ Assure-toi que ticket.id est défini

            let button = document.createElement("button");
            button.type = "submit";
            button.textContent = "Traiter";

            // 🔍 Vérification
            console.log("Ajout du ticket :", ticket.id);

            form.appendChild(inputHidden);
            form.appendChild(button);
            actionCell.appendChild(form); // ✅ Maintenant `actionCell` existe

            // Ajout des cellules à la ligne
            row.appendChild(numCell);
            row.appendChild(statusCell);
            row.appendChild(actionCell);

            // Ajout de la ligne au tableau
            tableBody.appendChild(row);

            // 🔥 Vérifier si le formulaire est soumis
            form.addEventListener("submit", function(event) {
                console.log("Formulaire soumis avec ID Ticket :", inputHidden.value);
            });
        });

    });
</script>

</body>
</html>
