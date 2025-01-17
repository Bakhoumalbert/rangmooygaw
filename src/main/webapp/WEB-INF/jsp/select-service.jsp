<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sélectionnez un Service</title>
    <head>
        <title>Choisir un service</title>
        <script>
            // Convertir les données JSON des services (envoyées par le backend) en options pour le menu déroulant
            function populateServices() {
                const services = JSON.parse('${servicesJson}'); // Charger les services depuis une variable JSP

                const serviceSelect = document.getElementById("service");
                services.forEach(service => {
                    const option = document.createElement("option");
                    option.value = service.idService;
                    option.textContent = service.nom;
                    serviceSelect.appendChild(option);
                });
            }

            function fetchLocations() {
                const serviceId = document.getElementById("service").value;

                if (!serviceId) {
                    alert("Veuillez sélectionner un service.");
                    return;
                }

                // Requête AJAX pour obtenir les localisations
                fetch('/client/get-locations?serviceId=' + serviceId)
                    .then(response => response.json())
                    .then(data => {
                        const locationSelect = document.getElementById("location");
                        locationSelect.innerHTML = ""; // Réinitialiser les options

                        data.forEach(location => {
                            const option = document.createElement("option");
                            option.value = location.idAgence;
                            option.textContent = location.localisation;
                            locationSelect.appendChild(option);
                        });

                        // Afficher le champ des localisations
                        document.getElementById("location-container").style.display = "block";
                    })
                    .catch(error => {
                        console.error("Erreur lors du chargement des localisations :", error);
                        alert("Une erreur est survenue, veuillez réessayer.");
                    });
            }

            function submitForm() {
                const serviceId = document.getElementById("service").value;
                const locationId = document.getElementById("location").value;

                if (!serviceId || !locationId) {
                    alert("Veuillez sélectionner un service et une localisation.");
                    return;
                }

                // Soumettre le formulaire
                document.getElementById("selectionForm").submit();
            }

            // Charger les services lors du chargement de la page
            window.onload = populateServices;
        </script>
    </head>
</head>
<body>
<h1>Choisir un Service et une Localisation</h1>

<!-- Formulaire -->
<form id="selectionForm" action="/client/submit-selection" method="post">
    <label for="service">Service :</label>
    <select id="service" name="serviceId" onchange="fetchLocations()">
        <option value="">-- Sélectionner un service --</option>
    </select>
    <br><br>

    <div id="location-container" style="display: none;">
        <label for="location">Localisation :</label>
        <select id="location" name="locationId">
            <option value="">-- Sélectionner une localisation --</option>
        </select>
    </div>
    <br>

    <button type="button" onclick="submitForm()">Valider</button>
</form>
</body>
</html>
