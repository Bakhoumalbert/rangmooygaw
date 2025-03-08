<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>

<script>
    var socket = new SockJS('/ws');
    var stompClient = Stomp.over(socket);

    stompClient.connect({}, function (frame) {
        console.log('Connecté à WebSocket');

        // 🔥 Écouter les mises à jour de la file
        stompClient.subscribe('/topic/file-attente', function (response) {
            var tickets = JSON.parse(response.body);
            console.log("File d'attente mise à jour :", tickets);

            // Mettre à jour l'affichage de la file
            updateQueueDisplay(tickets);
        });
    });

    function updateQueueDisplay(tickets) {
        var queueList = document.getElementById("queueList");
        queueList.innerHTML = ""; // Vider la liste

        tickets.forEach(ticket => {
            var li = document.createElement("li");
            li.innerText = `Ticket ${ticket.id} - Position: ${ticket.position}`;
            queueList.appendChild(li);
        });
    }
</script>

<ul id="queueList">
    <!-- La file d'attente sera mise à jour ici -->
</ul>
