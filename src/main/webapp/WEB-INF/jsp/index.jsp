<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion de File d'Attente</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
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
    <h1>Gestion de File d'Attente</h1>
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
        services: [
            { id: 1, name: "Seneau" },
            { id: 2, name: "Orange" },
            { id: 3, name: "Senelec" },
            { id: 4, name: "Bank of Senegal" }
        ],
        localisations: {
            1: ["Dakar Plateau", "Guédiawaye"],
            2: ["Dakar Yoff", "Pikine"],
            3: ["Thiès", "Saint-Louis"],
            4: ["Ziguinchor", "Kaolack"]
        },
        tickets: {
            "Dakar Plateau": { ticketNumber: 445, position: 19, peopleAhead: 18, currentNumber: 426 },
            "Pikine": { ticketNumber: 550, position: 5, peopleAhead: 4, currentNumber: 545 }
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
