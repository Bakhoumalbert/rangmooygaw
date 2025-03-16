<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier Agent</title>
    <style>
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
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input, select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 10px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .buton {
            display: block;
            text-align: center;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .buton:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<h1>Modifier Agent</h1>

<div class="container">
    <div class="nav">
        <a href="/admin/agents" class="buton">Retour</a>
    </div>
    <form action="/admin/update-agent" method="post">
        <input type="hidden" name="id_agent" value="${agent.id_agent}">

        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" value="${agent.nom}" required>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" value="${agent.email}" required>

        <label for="agence">Agence :</label>
        <select id="agence" name="id_agence" required>
            <option value="${agent.agence.id_agence}">${agent.agence.localisation}</option>
        </select>

        <button type="submit">Modifier</button>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        try {
            const agences = JSON.parse('${agences}');
            console.log("agences : ", agences)
            const selectAgence = document.getElementById("agence");
            const currentAgenceId = parseInt("${agent.agence.id_agence}");

            console.log("agences agent : ", agences)
            console.log("agenceId : ", currentAgenceId)

            agences.forEach(agence => {
                if (agence.id_agence !== currentAgenceId) { // Évite de dupliquer l'agence actuelle
                    const option = document.createElement("option");
                    option.value = agence.id_agence;
                    option.textContent = agence.localisation;
                    selectAgence.appendChild(option);
                }
            });

        } catch (error) {
            console.error("Erreur de parsing JSON:", error);
        }
    });
</script>

</body>
</html>
