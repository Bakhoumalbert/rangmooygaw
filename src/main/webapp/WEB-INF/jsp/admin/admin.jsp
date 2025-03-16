<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <title>Tableau de Bord Admin</title>
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

      /* Sidebar */
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
        transition: transform 0.3s ease-in-out;
      }

      .sidebar.closed {
        transform: translateX(-250px);
      }

      .sidebar h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 22px;
      }

      .sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
      }

      .sidebar ul li {
        margin: 15px 0;
      }

      .sidebar ul li a {
        color: white;
        text-decoration: none;
        font-size: 16px;
        display: block;
        padding: 10px 15px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
      }

      .sidebar ul li a:hover,
      .sidebar ul li a.active {
        background-color: #0056b3;
      }

      .sidebar-content {
        margin-top: 70px;
      }

      .logo {
        display: flex;
        justify-content: center;
      }

      /* Main content */
      .main {
        flex: 1;
        margin-left: 250px;
        padding: 20px;
        background-color: #ffffff;
        transition: margin-left 0.3s ease-in-out;
      }

      .main.expanded {
        margin-left: 0;
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

      table,
      th,
      td {
        border: 1px solid #ddd;
      }

      th,
      td {
        padding: 10px;
        text-align: left;
      }

      th {
        background-color: #007bff;
        color: white;
      }

      tr:nth-child(even) {
        background-color: #f9f9f9;
      }

      tr:hover {
        background-color: #f1f1f1;
      }

      /* Sidebar toggle button */
      .toggle-btn {
        position: fixed;
        top: 20px;
        left: 20px;
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 5px;
        font-size: 16px;
        z-index: 1000;
      }

      .toggle-btn:hover {
        background-color: #0056b3;
      }
    </style>
  </head>
  <body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
      <div class="sidebar-content">
        <h2>Rangmooygaw</h2>
        <div class="logo">
          <img
            src="../../../resources/images/logo1.png"
            alt="Logo"
            style="height: 50px; margin-right: 15px"
          />
        </div>
        <ul>
          <li>
            <a href="/admin/clients" class="menu-item" id="clientsLink"
              >Clients</a
            >
          </li>
          <li>
            <a href="/admin/services" class="menu-item" id="servicesLink"
              >Services</a
            >
          </li>
          <li>
            <a href="/admin/agences" class="menu-item" id="agencesLink"
              >Agences</a
            >
          </li>
          <li>
            <a href="/admin/agents" class="menu-item" id="agentsLink">Agents</a>
          </li>
          <li>
            <a href="/logout" class="menu-item" id="logoutLink"
              >Déconnexion</a>
          </li>
        </ul>
      </div>
      <!-- Sidebar Toggle Button -->
    </div>

    <button class="toggle-btn" id="toggleBtn">☰</button>

    <!-- Main Content -->
    <div class="main" id="main">
      <h1>Tableau de Bord Admin</h1>

      <div class="section" id="files">
        <h2>Files d'Attente</h2>
        <table id="fileAttenteTable">
          <thead>
            <tr>
              <th>Service</th>
              <th>Agence</th>
              <th>Numéro en cours</th>
              <th>Date de Création</th>
            </tr>
          </thead>
          <tbody>
            <!-- Les données seront ajoutées ici par le script -->
          </tbody>
        </table>
      </div>
    </div>

    <!-- Scripts -->
    <script>
      // Gestion de l'ouverture et fermeture de la sidebar
      const sidebar = document.getElementById("sidebar");
      const mainContent = document.getElementById("main");
      const toggleBtn = document.getElementById("toggleBtn");

      toggleBtn.addEventListener("click", () => {
        sidebar.classList.toggle("closed");
        mainContent.classList.toggle("expanded");
      });

      // Gestion dynamique des liens actifs
      const menuItems = document.querySelectorAll(".menu-item");
      menuItems.forEach((item) => {
        item.addEventListener("click", function () {
          menuItems.forEach((link) => link.classList.remove("active"));
          this.classList.add("active");
        });
      });

      // Simuler des données de files d'attente
      const fileAttente = JSON.parse("${fileAttente}");
      const fileTableBody = document.querySelector("#fileAttenteTable tbody");

      fileAttente.forEach((file) => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${file.service.nom}</td>
            <td>${file.agence.localisation}</td>
            <td>${file.numeroEnCours}</td>
            <td>${file.dateCreation}</td>
        `;
        fileTableBody.appendChild(row);
      });
    </script>
  </body>
</html>
