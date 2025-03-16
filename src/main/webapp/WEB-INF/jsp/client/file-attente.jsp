<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>File d'Attente</title>
    <style>
        /* 🎨 Style global */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #333;
        }

        .message {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
            text-align: left;
        }

        select, button {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        select {
            background-color: #f9f9f9;
        }

        button {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .logout {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #dc3545;
            font-weight: bold;
        }

        .logout:hover {
            color: #b32b3b;
        }
        .flash-container {
            position: fixed;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            text-align: center;
        }

        .back-button {
            width: 100%;
            padding: 10px;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .back-button:hover {
            background-color: #5a6268;
        }

    </style>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const agences = JSON.parse('${agencesJson}');
            const servicesParAgence = JSON.parse('${servicesParAgenceJson}'); // 🎯 Associe les services aux agences

            console.log("Agences chargées :", agences);
            console.log("Services par agence :", servicesParAgence);

            const agenceSelect = document.getElementById("agenceSelect");
            const serviceSelect = document.getElementById("serviceSelect");

            // 🏢 Ajouter dynamiquement les agences
            agences.forEach(agence => {
                let option = document.createElement("option");
                option.value = agence.idAgence;
                option.textContent = agence.nom;
                agenceSelect.appendChild(option);
            });

            // ⚡ Mettre à jour les services selon l'agence sélectionnée
            agenceSelect.addEventListener("change", function () {
                const agenceId = parseInt(this.value, 10); // Convertir en entier
                serviceSelect.innerHTML = ""; // Nettoyer la liste

                // Vérifier si `servicesParAgence` contient des données
                if (!servicesParAgence || Object.keys(servicesParAgence).length === 0) {
                    console.error("Erreur : servicesParAgence est vide ou non défini !");
                    return;
                }

                // Ajouter les services associés à cette agence
                if (servicesParAgence[agenceId] && servicesParAgence[agenceId].length > 0) {
                    servicesParAgence[agenceId].forEach(service => {
                        let option = document.createElement("option");
                        option.value = service.idService;
                        option.textContent = service.nom;
                        serviceSelect.appendChild(option);
                    });
                } else {
                    // Si aucun service trouvé
                    let option = document.createElement("option");
                    option.textContent = "Aucun service disponible";
                    option.disabled = true;
                    serviceSelect.appendChild(option);
                }
            });

            // 📌 Déclencher la mise à jour des services dès qu'une agence est pré-sélectionnée
            if (agenceSelect.value) {
                agenceSelect.dispatchEvent(new Event("change"));
            }
        });

        document.addEventListener("DOMContentLoaded", function () {
            // ✅ Récupérer les messages depuis les attributs de la session
            const successMessage = "${successMessage}";
            const errorMessage = "${errorMessage}";

            // ✅ Sélectionner le conteneur où afficher les messages
            const flashContainer = document.getElementById("flashMessages");

            function showMessage(type, message) {
                if (message && message !== "null") {
                    let div = document.createElement("div");
                    div.className = `flash-message ${type}`;
                    div.textContent = message;

                    // Ajouter le message dans le conteneur
                    flashContainer.appendChild(div);

                    // ✅ Disparaît après 3 secondes
                    setTimeout(() => {
                        div.classList.add("fade-out");
                        setTimeout(() => div.remove(), 1000);
                    }, 3000);
                }
            }

            // ✅ Afficher les messages si disponibles
            showMessage("success", successMessage);
            showMessage("error", errorMessage);
        });
    </script>
</head>
<body>


<div class="container">
    <h2>Bienvenue dans la file d'attente</h2>



    <!-- ✅ Messages Flash -->
    <div id="flashMessages" class="flash-container"></div>
    <!-- 🔙 Bouton de retour -->
    <button type="button" class="back-button" onclick="history.back()">⬅ Retour</button>

    <!-- 🔴 Lien de déconnexion -->
    <a href="${pageContext.request.contextPath}/logout" class="logout">Se déconnecter</a>
    <form id="ticketForm" action="${pageContext.request.contextPath}/client/prendre-ticket" method="post">
        <label for="agenceSelect">Choisir une agence :</label>
        <select id="agenceSelect" name="agenceId"></select>

        <label for="serviceSelect">Choisir un service :</label>
        <select id="serviceSelect" name="serviceId"></select>

        <button type="submit">Prendre un Ticket</button>
    </form>

</div>

</body>
</html>
