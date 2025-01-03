<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Interface Agent</title>
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
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        select, button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-top: 10px;
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
        p {
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Interface Agent</h1>
    <div class="form-group">
        <label for="location">Choisir une localité :</label>
        <form method="get" action="/agent">
            <select name="location" id="location" onchange="this.form.submit()">
                <option value="">-- Sélectionnez une localité --</option>
                <c:forEach var="entry" items="${queues}">
                    <option value="${entry.key}" ${entry.key == location ? 'selected' : ''}>
                            ${entry.key}
                    </option>
                </c:forEach>
            </select>
        </form>
    </div>
    <p>Localisation actuelle : ${location}</p>
    <p>Numéro en cours : ${currentNumber}</p>
    <form method="post" action="/agent/${location}/next">
        <button type="submit">Client Suivant</button>
    </form>
    <form method="post" action="/agent/${location}/previous">
        <button type="submit">Client Précédent</button>
    </form>
</div>
</body>
</html>
