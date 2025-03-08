<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Votre Ticket</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .ticket-container {
            margin-top: 50px;
            padding: 20px;
            border: 2px solid #007bff;
            border-radius: 8px;
            display: inline-block;
        }
        .highlight { font-size: 22px; font-weight: bold; color: #007bff; }
        .danger { color: red; font-weight: bold; }
    </style>
    <script>

        const socket = new WebSocket("ws://localhost:8080/ws/ticket");

        socket.onmessage = function(event) {
            document.getElementById("numeroActuel").textContent = event.data;
        };

        function updateTicket() {
            fetch(`/tickets/file-attente?idService=${serviceId}&idAgence=${agenceId}`)
                .then(response => response.json())
                .then(data => {
                    const myTicket = data.find(ticket => ticket.id_ticket === ticketId);
                    if (myTicket) {
                        document.getElementById("position").textContent = myTicket.position;
                        document.getElementById("personnesDevant").textContent = myTicket.personnesDevant;
                        document.getElementById("numeroActuel").textContent = myTicket.numeroActuel;

                        if (myTicket.personnesDevant <= 3) {
                            document.getElementById("alert").textContent = "🔔 C'est bientôt votre tour !";
                        }
                    }
                });
        }

        setInterval(updateTicket, 5000); // Mettre à jour toutes les 5 secondes
    </script>
</head>
<body>
<div class="ticket-container">
    <h1>Votre Ticket</h1>
    <p>Numéro de Ticket : <span class="highlight">${ticket.numero}</span></p>
    <p>Votre position dans la file : <span id="position">${ticket.position}</span></p>
    <p>Personnes devant vous : <span id="personnesDevant">${ticket.personnesDevant}</span></p>
    <p>Numéro en cours : <span class="highlight" id="numeroActuel">${ticket.numeroActuel}</span></p>
    <p class="danger" id="alert"></p>
</div>
</body>
</html>
