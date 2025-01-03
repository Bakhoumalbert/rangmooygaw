<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Votre Ticket</title>
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
            text-align: center;
        }
        h1 {
            color: #333;
        }
        p {
            font-size: 18px;
            margin: 10px 0;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div>
        <h1>Votre Ticket</h1>
        <p>Service : ${service}</p>
        <p>Localisation : ${localisation}</p>
        <p>Numéro de ticket : ${ticketNumber}</p>
        <p>Votre position dans la file : ${position}</p>
        <p>Nombre de personnes devant : ${peopleAhead}</p>
        <p>Numéro en cours : ${currentNumber}</p>
    </div>
</body>
</html>
