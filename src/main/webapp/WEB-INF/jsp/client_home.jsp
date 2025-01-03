<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }
        select, button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 20px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        const localisations = ${localisations};

        console.log(localisations)

        function updateLocalisations() {
            const service = document.getElementById("service").value;
            const localisationSelect = document.getElementById("localisation");
            localisationSelect.innerHTML = "<option value=''>-- Sélectionnez une localisation --</option>";
            if (localisations[service]) {
                localisations[service].forEach(localisation => {
                    const option = document.createElement("option");
                    option.value = localisation;
                    option.textContent = localisation;
                    localisationSelect.appendChild(option);
                });
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Portail Client</h1>
    <form method="post" action="/select">
        <label for="service">Sélectionnez un service :</label>
        <select name="service" id="service" onchange="updateLocalisations()">
            <option value=''>-- Sélectionnez un service --</option>
            <c:forEach var="service" items="${services}">
                <option value="${service.name}">${service.name}</option>
            </c:forEach>
        </select>

        <label for="localisation">Sélectionnez une localisation :</label>
        <select name="localisation" id="localisation">
            <option value="">-- Sélectionnez une localisation --</option>
        </select>

        <button type="submit">Obtenir un ticket</button>
    </form>
</div>
</body>
</html>
