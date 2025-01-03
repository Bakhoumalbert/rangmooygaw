<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Spring Boot Tailwind</title>--%>
<%--    <!-- Lien vers le fichier CSS -->--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">--%>
<%--</head>--%>
<%--<body class="bg-slate-50">--%>
<%--<header class="bg-white container mx-auto py-8">--%>
<%--    <h1 class="text-4xl text-red-500 font-bold px-4">--%>
<%--        Welcome to Spring Boot Tailwind--%>
<%--    </h1>--%>
<%--    <div class="text-center text-blue-500">--%>
<%--        Bienvenue sur ma page JSP !--%>
<%--    </div>--%>
<%--</header>--%>
<%--</body>--%>
<%--</html>--%>


<%--<%@ page contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ page pageEncoding="UTF-8" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Gestion de File d'Attente</title>
    <style>
        body {
        <c:out value="${stl}" />; /* Injecté depuis le contrôleur */
            font-family: Arial, sans-serif;
        }
        header {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 1rem 0;
        }
        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 1rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        select, button {
            width: 100%;
            padding: 0.8rem;
            margin: 1rem 0;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border: none;
        }
        button:hover {
            background-color: #0056b3;
        }
        .result {
            margin-top: 1rem;
            padding: 1rem;
            background-color: #e9f7ff;
            border: 1px solid #007bff;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<header>
    <h1><c:out value="${home}" /></h1> <!-- Message injecté depuis le contrôleur -->
</header>
<div class="container">
    <form id="queueForm">
        <label for="service">Sélectionnez un service :</label>
        <select id="service">
            <option value="">-- Choisir un service --</option>
        </select>

        <label for="localisation">Sélectionnez une localisation :</label>
        <select id="localisation" disabled>
            <option value="">-- Choisir une localisation --</option>
        </select>

        <button type="button" id="getTicket" disabled>Obtenir mon ticket</button>
    </form>

    <div id="result" class="result" style="display: none;">
        <p><strong>Numéro de ticket :</strong> <span id="ticketNumber"></span></p>
        <p><strong>Position dans la file :</strong> <span id="queuePosition"></span></p>
        <p><strong>Nombre de personnes devant :</strong> <span id="peopleAhead"></span></p>
        <p><strong>Numéro en cours :</strong> <span id="currentNumber"></span></p>
    </div>
</div>

<script>
    // Exemple de données simulées (normalement récupérées depuis l'API backend)
    const data = {
        "services": [
            { "id": 1, "name": "Seneau" },
            { "id": 2, "name": "Orange" },
            { "id": 3, "name": "Senelec" },
            { "id": 4, "name": "Bank of Senegal" },
            { "id": 5, "name": "Poste du Sénégal" },
            { "id": 6, "name": "Sonatel" }
        ],
        "localisations": {
            "1": ["Dakar Plateau", "Guédiawaye", "Mbour", "Louga"],
            "2": ["Dakar Yoff", "Pikine", "Touba", "Diourbel"],
            "3": ["Thiès", "Saint-Louis", "Matam", "Podor"],
            "4": ["Ziguinchor", "Kaolack", "Sédhiou", "Kolda"],
            "5": ["Tambacounda", "Bakel", "Kédougou", "Kaffrine"],
            "6": ["Fatick", "Rufisque", "Joal-Fadiouth", "Ngaparou"]
        },
        "tickets": {
            "Dakar Plateau": { "ticketNumber": 445, "position": 19, "peopleAhead": 18, "currentNumber": 426 },
            "Guédiawaye": { "ticketNumber": 320, "position": 8, "peopleAhead": 7, "currentNumber": 312 },
            "Mbour": { "ticketNumber": 215, "position": 15, "peopleAhead": 14, "currentNumber": 200 },
            "Louga": { "ticketNumber": 180, "position": 12, "peopleAhead": 11, "currentNumber": 168 },
            "Dakar Yoff": { "ticketNumber": 510, "position": 7, "peopleAhead": 6, "currentNumber": 503 },
            "Pikine": { "ticketNumber": 550, "position": 5, "peopleAhead": 4, "currentNumber": 545 },
            "Touba": { "ticketNumber": 102, "position": 20, "peopleAhead": 19, "currentNumber": 82 },
            "Diourbel": { "ticketNumber": 98, "position": 2, "peopleAhead": 1, "currentNumber": 96 },
            "Thiès": { "ticketNumber": 670, "position": 22, "peopleAhead": 21, "currentNumber": 648 },
            "Saint-Louis": { "ticketNumber": 355, "position": 10, "peopleAhead": 9, "currentNumber": 345 },
            "Matam": { "ticketNumber": 40, "position": 4, "peopleAhead": 3, "currentNumber": 36 },
            "Podor": { "ticketNumber": 25, "position": 1, "peopleAhead": 0, "currentNumber": 25 },
            "Ziguinchor": { "ticketNumber": 225, "position": 30, "peopleAhead": 29, "currentNumber": 195 },
            "Kaolack": { "ticketNumber": 410, "position": 14, "peopleAhead": 13, "currentNumber": 396 },
            "Sédhiou": { "ticketNumber": 125, "position": 6, "peopleAhead": 5, "currentNumber": 120 },
            "Kolda": { "ticketNumber": 68, "position": 3, "peopleAhead": 2, "currentNumber": 65 },
            "Tambacounda": { "ticketNumber": 501, "position": 12, "peopleAhead": 11, "currentNumber": 489 },
            "Bakel": { "ticketNumber": 302, "position": 18, "peopleAhead": 17, "currentNumber": 284 },
            "Kédougou": { "ticketNumber": 150, "position": 8, "peopleAhead": 7, "currentNumber": 143 },
            "Kaffrine": { "ticketNumber": 230, "position": 4, "peopleAhead": 3, "currentNumber": 226 },
            "Fatick": { "ticketNumber": 98, "position": 1, "peopleAhead": 0, "currentNumber": 98 },
            "Rufisque": { "ticketNumber": 305, "position": 5, "peopleAhead": 4, "currentNumber": 300 },
            "Joal-Fadiouth": { "ticketNumber": 45, "position": 3, "peopleAhead": 2, "currentNumber": 42 },
            "Ngaparou": { "ticketNumber": 70, "position": 2, "peopleAhead": 1, "currentNumber": 68 }
        }
    };

    // Remplir la liste des services
    const serviceSelect = document.getElementById("service");
    data.services.forEach(service => {
        const option = document.createElement("option");
        option.value = service.id;
        option.textContent = service.name;
        serviceSelect.appendChild(option);
    });

    // Gérer la sélection de service
    serviceSelect.addEventListener("change", (e) => {
        const selectedService = e.target.value;
        const localisationSelect = document.getElementById("localisation");

        // Réinitialiser les localisations
        localisationSelect.innerHTML = '<option value="">-- Choisir une localisation --</option>';
        localisationSelect.disabled = true;

        if (data.localisations[selectedService]) {
            data.localisations[selectedService].forEach(localisation => {
                const option = document.createElement("option");
                option.value = localisation;
                option.textContent = localisation;
                localisationSelect.appendChild(option);
            });
            localisationSelect.disabled = false;
        }

        // Désactiver le bouton de ticket
        document.getElementById("getTicket").disabled = true;
    });

    // Activer le bouton de ticket lorsqu'une localisation est sélectionnée
    document.getElementById("localisation").addEventListener("change", (e) => {
        const selectedLocalisation = e.target.value;
        document.getElementById("getTicket").disabled = !selectedLocalisation;
    });

    // Gérer la génération de ticket
    document.getElementById("getTicket").addEventListener("click", () => {
        const localisation = document.getElementById("localisation").value;
        const ticketData = data.tickets[localisation];

        if (ticketData) {
            document.getElementById("ticketNumber").textContent = ticketData.ticketNumber;
            document.getElementById("queuePosition").textContent = ticketData.position;
            document.getElementById("peopleAhead").textContent = ticketData.peopleAhead;
            document.getElementById("currentNumber").textContent = ticketData.currentNumber;

            document.getElementById("result").style.display = "block";
        }
    });
</script>
</body>
</html>
