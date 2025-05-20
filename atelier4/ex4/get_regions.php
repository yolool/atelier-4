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

// Vérifier si l'ID du pays est fourni
if (isset($_GET['pays_id']) && !empty($_GET['pays_id'])) {
    $paysId = $conn->real_escape_string($_GET['pays_id']);
    
    // Récupérer les régions du pays spécifié
    $sql = "SELECT id, nom FROM regions WHERE pays_id = ? ORDER BY nom ASC";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $paysId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $regions = array();
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $regions[] = $row;
        }
    }
    
    // Fermer la requête préparée
    $stmt->close();
    
    // Renvoyer les données au format JSON
    header('Content-Type: application/json');
    echo json_encode($regions);
} else {
    // Si aucun ID de pays n'est fourni, renvoyer un tableau vide
    header('Content-Type: application/json');
    echo json_encode([]);
}

// Fermer la connexion
$conn->close();
?>