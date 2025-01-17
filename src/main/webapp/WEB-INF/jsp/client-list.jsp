<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des Clients</title>
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
            text-align: left;
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

        .add-client {
            display: block;
            width: 150px;
            margin: 0 auto;
            text-align: center;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .add-client:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Liste des Clients</h1>

    <a href="/admin/create-client" class="add-client">+ Ajouter un Client</a>
    <table id="clientTable" border="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Téléphone</th>
        </tr>
        </thead>
        <tbody>
        <!-- Les lignes seront insérées ici par JavaScript -->
        </tbody>
    </table>

    <!-- JavaScript en bas -->
    <script>
        const clients = JSON.parse('${clients}');
        console.log("Clients :", clients);

        const tableBody = document.querySelector("#clientTable tbody");
        if (tableBody) {
            clients.forEach(client => {
                const row = document.createElement("tr");

                const idCell = document.createElement("td");
                idCell.textContent = client.idClient;

                const nomCell = document.createElement("td");
                nomCell.textContent = client.nom;

                const prenomCell = document.createElement("td");
                prenomCell.textContent = client.prenom;

                const emailCell = document.createElement("td");
                emailCell.textContent = client.email;

                const telephoneCell = document.createElement("td");
                telephoneCell.textContent = client.telephone;

                row.appendChild(idCell);
                row.appendChild(nomCell);
                row.appendChild(prenomCell);
                row.appendChild(emailCell);
                row.appendChild(telephoneCell);

                tableBody.appendChild(row);
            });
        } else {
            console.error("L'élément #clientTable tbody est introuvable dans le DOM.");
        }
    </script>
</div>
</body>
</html>
