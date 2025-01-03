<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vue Agent</title>
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
            max-width: 600px;
            margin: 2rem auto;
            padding: 1rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 1rem;
        }
        button {
            padding: 1rem 2rem;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button#next {
            background-color: #28a745;
            color: white;
        }
        button#next:hover {
            background-color: #218838;
        }
        button#previous {
            background-color: #dc3545;
            color: white;
        }
        button#previous:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<header>
    <h1>Vue de l'Agent</h1>
</header>
<div class="container">
    <h2>Localisation : <span id="location">Dakar Plateau</span></h2>
    <p>Numéro en cours de traitement : <span id="currentNumber">...</span></p>

    <div class="buttons">
        <button id="previous">Client Précédent</button>
        <button id="next">Client Suivant</button>
    </div>
</div>

<script>
    const location = "Dakar Plateau"; // Localisation actuelle (peut être dynamique)
    const currentNumberElement = document.getElementById("currentNumber");

    // Récupérer le numéro en cours
    function fetchCurrentNumber() {
        fetch(`/api/v1/agent/${location}/current`)
            .then(response => response.json())
            .then(data => {
                currentNumberElement.textContent = data;
            });
    }

    // Passer au client suivant
    document.getElementById("next").addEventListener("click", () => {
        fetch(`/api/v1/agent/${location}/next`, { method: "POST" })
            .then(response => response.json())
            .then(data => {
                currentNumberElement.textContent = data;
            });
    });

    // Revenir au client précédent
    document.getElementById("previous").addEventListener("click", () => {
        fetch(`/api/v1/agent/${location}/previous`, { method: "POST" })
            .then(response => response.json())
            .then(data => {
                currentNumberElement.textContent = data;
            });
    });

    // Charger le numéro en cours au chargement de la page
    fetchCurrentNumber();
</script>
</body>
</html>
