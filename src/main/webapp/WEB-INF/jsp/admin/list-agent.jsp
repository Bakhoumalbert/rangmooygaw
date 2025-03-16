<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Agents</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            text-align: center;
            padding: 12px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px;
        }

        .buton {
            display: block;
            text-align: center;
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

        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .edit-btn, .delete-btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            color: white;
        }

        .edit-btn {
            background-color: #ffc107;
        }

        .edit-btn:hover {
            background-color: #e0a800;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Liste des Agents</h1>

    <div class="nav">
        <a href="/admin" class="buton">Accueil</a>
        <a href="/admin/create-agent" class="buton">+ Nouveau Agent</a>
    </div>

    <table id="agentTable">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Email</th>
            <th>Agence</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- Les données seront ajoutées ici dynamiquement -->
        </tbody>
    </table>
</div>

<script>
    // Convertir les agents JSON en objet JavaScript
    const agents = JSON.parse('${agents}');
    const agences = JSON.parse('${agences}');

    // Référencer le tableau
    const tableBody = document.querySelector("#agentTable tbody");

    // Parcourir les agents et les ajouter au tableau
    agents.forEach(agent => {
        const row = document.createElement("tr");

        const nameCell = document.createElement("td");
        nameCell.textContent = agent.nom;

        const emailCell = document.createElement("td");
        emailCell.textContent = agent.email;

        // Colonne Agence
        const agencyCell = document.createElement("td");
        const agence1 = agences.find(a => Number(a.id_agence) === Number(agent.id_agence));

        agencyCell.textContent = agence1 ? agence1.localisation : "Non assignée";

        // Colonne Actions
        const actionsCell = document.createElement("td");
        actionsCell.classList.add("action-buttons");

        // Bouton Modifier
        const editButton = document.createElement("button");
        editButton.textContent = "Modifier";
        editButton.classList.add("edit-btn");
        editButton.onclick = function () {
            window.location.href = "/admin/edit-agent/" + agent.id_agent;
        };

        // Bouton Supprimer
        const deleteButton = document.createElement("button");
        deleteButton.textContent = "Supprimer";
        deleteButton.classList.add("delete-btn");
        deleteButton.onclick = function () {
            if (confirm("Voulez-vous vraiment supprimer l'agent" + agent.nom +" ?")) {
                fetch("/admin/delete-agent/" + agent.id_agent, { method: "DELETE" })
                    .then(response => {
                        if (response.ok) {
                            row.remove();
                        } else {
                            alert("Erreur lors de la suppression.");
                        }
                    })
                    .catch(error => console.error("Erreur :", error));
            }
        };

        actionsCell.appendChild(editButton);
        actionsCell.appendChild(deleteButton);

        row.appendChild(nameCell);
        row.appendChild(emailCell);
        row.appendChild(agencyCell);
        row.appendChild(actionsCell);

        tableBody.appendChild(row);
    });
</script>
</body>
</html>
