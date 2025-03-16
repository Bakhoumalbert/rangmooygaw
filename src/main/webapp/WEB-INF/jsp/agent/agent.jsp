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

            // 🎨 Appliquer un style en fonction du statut
            if (ticket.statut === "TRAITÉ") {
                statusCell.style.color = "#28a745"; // Vert
                statusCell.style.fontWeight = "bold";
            } else if (ticket.statut === "EN ATTENTE") {
                statusCell.style.color = "#FFA500"; // Orange
                statusCell.style.fontWeight = "bold";
            }

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

            // 🎨 Style du bouton en fonction du statut
            if (ticket.statut === "TRAITÉ") {
                button.style.backgroundColor = "#6c757d"; // Gris (désactivé)
                button.style.cursor = "not-allowed";
                button.disabled = true; // Désactiver le bouton
            } else if (ticket.statut === "EN ATTENTE") {
                button.style.backgroundColor = "#28a745"; // Vert (actionnable)
                button.style.cursor = "pointer";
            }

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
