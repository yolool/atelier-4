<?php
// Configuration de la connexion à la base de données
$host = "localhost";
$username = "root"; // Remplacez par votre nom d'utilisateur MySQL
$password = ""; // Remplacez par votre mot de passe MySQL
$database = "geo_data"; // Remplacez par le nom de votre base de données

// Connexion à la base de données
$conn = new mysqli($host, $username, $password, $database);

// Vérifier la connexion
if ($conn->connect_error) {
    die("La connexion à la base de données a échoué: " . $conn->connect_error);
}

// Définir l'encodage des caractères
$conn->set_charset("utf8");

// Récupérer tous les pays
$sql = "SELECT id, nom FROM pays ORDER BY nom ASC";
$result = $conn->query($sql);

$countries = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $countries[] = $row;
    }
}

// Fermer la connexion
$conn->close();

// Renvoyer les données au format JSON
header('Content-Type: application/json');
echo json_encode($countries);
?>