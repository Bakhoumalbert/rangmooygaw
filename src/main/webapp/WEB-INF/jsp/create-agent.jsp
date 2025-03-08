<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Créer un Agent</title>
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

        form label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        form input, form select, form button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        form button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        form button:hover {
            background-color: #0056b3;
        }

        .button {
            display: flex;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Créer un Agent</h1>
    <form action="/admin/create-agent" method="post">
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" placeholder="Nom de l'agent" required>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" placeholder="Email de l'agent" required>

        <label for="agence">Agence :</label>
        <select id="agence" name="id_agence" required>
            <option value="">-- Sélectionnez une agence --</option>
            <script>
                const agences = JSON.parse('${agences}');
                agences.forEach(agence => {
                    const option = document.createElement("option");
                    option.value = agence.id_agence;
                    option.textContent = agence.localisation;
                    document.getElementById("agence").appendChild(option);
                });
            </script>
        </select>
        <button class="button" type="submit">Enregistrer</button>
    </form>
</div>
</body>
</html>
