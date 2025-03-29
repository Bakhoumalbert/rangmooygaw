<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Tableau de Bord Admin</title>
  <meta charset="UTF-8" />
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f0f0f0;
      display: flex;
      height: 100vh;
      overflow: hidden;
    }

    .sidebar {
      width: 200px;
      background-color: #007bff;
      color: white;
      height: 100%;
      position: fixed;
      top: 0;
      left: 0;
      display: flex;
      flex-direction: column;
      padding: 20px;
      box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }

    .sidebar h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .sidebar ul {
      list-style: none;
      padding: 0;
    }

    .sidebar ul li {
      margin: 15px 0;
    }

    .sidebar ul li a {
      color: white;
      text-decoration: none;
      padding: 10px 15px;
      display: block;
      border-radius: 5px;
      transition: background 0.3s ease;
    }

    .sidebar ul li a:hover,
    .sidebar ul li a.active {
      background-color: #0056b3;
    }

    .logo {
      text-align: center;
      margin-bottom: 20px;
    }

    .logo img {
      height: 50px;
    }

    .container {
      margin-left: 220px;
      padding: 30px;
      width: 100%;
    }

    h1 {
      text-align: center;
      color: #333;
    }

    h2 {
      margin-top: 30px;
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    th,
    td {
      padding: 12px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #007bff;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .info {
      font-size: 14px;
      color: #777;
      margin-top: 10px;
    }

    /* 🎨 Couleurs de statut */
    .en-attente {
      color: #ffa500;
      font-weight: bold;
    }

    .en-cours {
      color: #007bff;
      font-weight: bold;
    }

    .traite {
      color: #28a745;
      font-weight: bold;
    }

    .toggle-btn {
      display: none; /* optionnel : tu ne l'utilises pas ici */
    }
  </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
  <div class="logo">
    <img src="../../../resources/images/logo1.png" alt="Logo" />
  </div>
  <h2>Rangmooygaw</h2>
  <ul>
    <li><a href="/admin/clients">Clients</a></li>
    <li><a href="/admin/services">Services</a></li>
    <li><a href="/admin/agences">Agences</a></li>
    <li><a href="/admin/agents">Agents</a></li>
    <li><a href="/logout">Déconnexion</a></li>
  </ul>
</div>

<!-- Contenu principal -->
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
    <tr><td colspan="5">Chargement des données...</td></tr>
    </tbody>
  </table>

  <p class="info">Affichage des tickets en cours de traitement (statut <strong>EN COURS</strong>).</p>
</div>

<!-- Script pour affichage dynamique -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const tickets = JSON.parse('${fileJson}');
    const tableBody = document.getElementById("fileTableBody");

    tableBody.innerHTML = "";

    if (tickets.length === 0) {
      tableBody.innerHTML = "<tr><td colspan='5'>Aucune file d'attente active pour le moment.</td></tr>";
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

      // 🎨 Appliquer un style selon le statut
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
