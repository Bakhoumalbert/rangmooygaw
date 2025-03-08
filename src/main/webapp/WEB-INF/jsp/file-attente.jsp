<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bienvenue - Application Multiservices</title>
    <style>

    </style>
</head>
<body>

<table id="fileAttenteTable">
    <thead>
    <tr>
        <th>Service</th>
        <th>Agence</th>
        <th>Numéro en cours</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>
<script>
    function chargerFileAttente() {
        fetch("/api/files")
            .then(response => response.json())
            .then(files => {
                const tableBody = document.querySelector("#fileAttenteTable tbody");
                tableBody.innerHTML = ""; // Reset

                files.forEach(file => {
                    const row = document.createElement("tr");

                    row.innerHTML = `
                    <td>${file.service.nom}</td>
                    <td>${file.agence.localisation}</td>
                    <td>${file.numeroEnCours}</td>
                    <td>
                        <button onclick="suivant(${file.id_file_attente})">Suivant</button>
                        <button onclick="precedent(${file.id_file_attente})">Précédent</button>
                    </td>
                `;

                    tableBody.appendChild(row);
                });
            });
    }

    function suivant(idFileAttente) {
        fetch(`/api/agents/next?idFileAttente=${idFileAttente}`, { method: "POST" })
            .then(() => chargerFileAttente());
    }

    function precedent(idFileAttente) {
        fetch(`/api/agents/previous?idFileAttente=${idFileAttente}`, { method: "POST" })
            .then(() => chargerFileAttente());
    }

    // Charger les données au chargement de la page
    window.onload = chargerFileAttente;

</script>
</body>
</html>
