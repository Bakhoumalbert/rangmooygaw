<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ include file="header.jsp" %>--%>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Agences</title>
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
            margin-bottom: 20px;
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
            justify-content: end;
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
    <h1>Liste des Agences</h1>

    <div class="nav">
        <a href="/admin" class="buton">Accueil</a>
        <a href="/admin/create-agence" class="buton">+ Nouvelle Agence</a>
    </div>

    <table id="agenceTable" border="1">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Localisation</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- Les lignes seront insérées ici par JavaScript -->
        </tbody>
    </table>

    <!-- JavaScript -->
    <script>
        const agences = JSON.parse('${agences}');
        console.log("Agences :", agences);

        const tableBody = document.querySelector("#agenceTable tbody");

        if (tableBody) {
            agences.forEach(agence => {
                const row = document.createElement("tr");

                // Cellules ID et Localisation
                const nomCell = document.createElement("td");
                nomCell.textContent = agence.nom;

                const localisationCell = document.createElement("td");
                localisationCell.textContent = agence.localisation;

                // Cellule Actions
                const actionsCell = document.createElement("td");
                actionsCell.classList.add("action-buttons");

                // Bouton Modifier
                const editButton = document.createElement("button");
                editButton.textContent = "Modifier";
                editButton.classList.add("edit-btn");
                editButton.onclick = function () {
                    window.location.href = "/admin/edit-agence/" + agence.id_agence;
                };

                // Bouton Supprimer
                const deleteButton = document.createElement("button");
                deleteButton.textContent = "Supprimer";
                deleteButton.classList.add("delete-btn");
                deleteButton.onclick = function () {
                    if (confirm("Voulez-vous vraiment supprimer cette agence ?")) {
                        fetch("/admin/delete-agence/" + agence.id_agence, { method: "DELETE" })
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

                // Ajouter boutons à la cellule actions
                actionsCell.appendChild(editButton);
                actionsCell.appendChild(deleteButton);

                // Ajouter les cellules à la ligne
                row.appendChild(nomCell);
                row.appendChild(localisationCell);
                row.appendChild(actionsCell);

                tableBody.appendChild(row);
            });
        } else {
            console.error("L'élément #agenceTable tbody est introuvable dans le DOM.");
        }
    </script>
</div>
</body>
</html>
