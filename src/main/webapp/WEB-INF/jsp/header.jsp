
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<div style="background-color: #007bff; padding: 15px; color: white; text-align: center; display: flex; align-items: center; justify-content: space-between;">--%>
<%--    <div style="display: flex; align-items: center;">--%>
<%--        <a href="/">--%>
<%--            <img src="../../resources/images/logo1.png" alt="Logo" style="height: 50px; margin-right: 15px;">--%>
<%--            <h1 style="margin: 0; font-size: 24px;">RangMooyGaw</h1>--%>
<%--        </a>--%>
<%--    </div>--%>
<%--    <nav>--%>
<%--        <a href="/" style="color: white; margin-right: 15px; text-decoration: none;">Accueil</a>--%>
<%--&lt;%&ndash;        <a href="/gestion" style="color: white; margin-right: 15px; text-decoration: none;">Gestion</a>&ndash;%&gt;--%>
<%--        <a href="/infos" style="color: white; text-decoration: none;">Infos</a>--%>
<%--    </nav>--%>
<%--</div>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Header -->
<div class="header">
    <div class="logo">
        <a href="/">
            <img src="/resources/images/logo.png" alt="Logo">
        </a>
        <h1>RangMooyGaw</h1>
    </div>

    <nav class="nav">
        <a href="/">Accueil</a>
        <a href="/admin/services">Services</a>
        <a href="/admin/agences">Agences</a>
        <a href="/admin/agents">Agents</a>
        <a href="/admin/clients">Clients</a>
    </nav>

    <div class="utilisateur-actions">
        <c:choose>
            <c:when test="${not empty sessionScope.utilisateur}">
                <span>Bienvenue, ${sessionScope.utilisateur.nom}!</span>
                <a href="/logout" class="logout-button">Déconnexion</a>
            </c:when>
            <c:otherwise>
                <a href="/login" class="login-button">Connexion</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Styles du header -->
<style>
    .header {
        background-color: #007bff;
        padding: 15px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        color: white;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    .logo {
        display: flex;
        align-items: center;
    }

    .logo img {
        height: 50px;
        margin-right: 15px;
    }

    .logo h1 {
        font-size: 24px;
        margin: 0;
        font-weight: bold;
    }

    .nav {
        display: flex;
        gap: 15px;
    }

    .nav a {
        color: white;
        text-decoration: none;
        font-size: 16px;
        transition: 0.3s;
    }

    .nav a:hover {
        text-decoration: underline;
    }

    .utilisateur-actions {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .login-button, .logout-button {
        background-color: white;
        color: #007bff;
        padding: 5px 10px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
    }

    .logout-button {
        background-color: red;
        color: white;
    }

    .login-button:hover, .logout-button:hover {
        opacity: 0.8;
    }
</style>
