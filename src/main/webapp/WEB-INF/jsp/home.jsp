<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bienvenue - Application Multiservices</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 36px;
        }

        header p {
            font-size: 18px;
            margin-top: 10px;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #0056b3;
            padding: 10px 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            margin: 0 5px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #003f7f;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            text-align: center;
        }

        .welcome-section {
            padding: 50px 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .welcome-section h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
        }

        .welcome-section p {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .welcome-section a {
            display: inline-block;
            padding: 10px 20px;
            color: white;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .welcome-section a:hover {
            background-color: #0056b3;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #f0f0f0;
            color: #555;
            font-size: 14px;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<header>
    <h1>Bienvenue sur Rangmooygaw</h1>
    <p>Votre guichet unique pour les services essentiels</p>
</header>

<nav>
    <a href="/admin">Dashboard Admin</a>
    <a href="/clients">Portail Client</a>
    <a href="/service">Nos Services</a>
    <a href="/contact">Contact</a>
    <a href="/logout">Déconnexion</a>
</nav>

<div class="container">
    <div class="welcome-section">
        <h2>Bienvenue sur notre plateforme multiservice</h2>
        <p>
            Nous vous offrons une expérience rapide et efficace pour gérer vos interactions avec différents services,
            que ce soit pour le paiement des factures, la gestion des files d'attente ou bien plus encore.
        </p>
        <a href="${pageContext.request.contextPath}/client">Accéder au portail client</a>
    </div>
</div>

<footer>
    © 2025 Multiservices. Tous droits réservés.
</footer>

</body>
</html>
