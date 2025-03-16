<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>File d'Attente</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script>
        var stompClient = null;

        function connect() {
            var socket = new SockJS('/ws');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                stompClient.subscribe('/file-attente/1', function (message) {
                    console.log("Mise à jour reçue !");
                    location.reload();
                });
            });
        }

        window.onload = connect;
    </script>
</head>
<body>
<h2>File d'Attente</h2>
<ul>
    <%-- Ici, on boucle sur la liste des tickets --%>
    <c:forEach var="ticket" items="${tickets}">
        <li>Ticket #${ticket.position} - ${ticket.utilisateur.nom}</li>
    </c:forEach>
</ul>
</body>
</html>
