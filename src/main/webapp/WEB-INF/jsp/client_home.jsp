<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Portail Client</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .services, .localisations, .agencies {
            margin-top: 20px;
        }
        .button {
            display: inline-block;
            margin: 5px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .hidden {
            display: none;
        }
    </style>
    <script>
        // Localisations et agences
        // Données dynamiques simulées
        const localisations = JSON.parse(${localisations});
        const agencies = JSON.parse(${agencies});
        const clients = JSON.parse(${clients});

        function showLocalisations(serviceName) {
            const localisationContainer = document.getElementById("localisation-container");
            localisationContainer.innerHTML = ""; // Réinitialiser la liste des localisations
            localisationContainer.classList.remove("hidden");

            if (localisations[serviceName]) {
                localisations[serviceName].forEach(localisation => {
                    const button = document.createElement("button");
                    button.className = "button";
                    button.textContent = localisation;
                    button.onclick = function () {
                        showAgencies(localisation);
                    };
                    localisationContainer.appendChild(button);
                });
            }
        }

        function showAgencies(localisationName) {
            const agencyContainer = document.getElementById("agency-container");
            agencyContainer.innerHTML = ""; // Réinitialiser la liste des agences
            agencyContainer.classList.remove("hidden");

            if (agencies[localisationName]) {
                agencies[localisationName].forEach(agency => {
                    const div = document.createElement("div");
                    div.textContent = `Agence : ${agency}`;
                    agencyContainer.appendChild(div);
                });
            } else {
                agencyContainer.innerHTML = "<p>Aucune agence trouvée pour cette localisation.</p>";
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Portail Client</h1>
    <div class="services">
        <h2>Services disponibles :</h2>
        <c:forEach var="service" items="${services}">
            <button class="button" onclick="showLocalisations('${service.name}')">
                    ${service.name}
            </button>
        </c:forEach>
    </div>
    <div id="localisation-container" class="localisations hidden">
        <h2>Localisations :</h2>
        <!-- Les localisations seront ajoutées dynamiquement ici -->
    </div>
    <div id="agency-container" class="agencies hidden">
        <h2>Agences :</h2>
        <!-- Les agences seront ajoutées dynamiquement ici -->
    </div>
</div>
</body>
</html>
