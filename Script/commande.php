<?php

require_once '../vendor/autoload.php';

use Faker\Factory;

$faker = Factory::create();

$dbHost = 'localhost';
$dbName = 'e-commerce-sql'; 
$dbUser = 'root';
$dbPassword = '';

try {
    $pdo = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPassword);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Générer 10 commandes fictives
    for ($i = 0; $i < 10; $i++) {
        $userId = mt_rand(1, 10); // Assurez-vous que l'ID utilisateur existe dans la table utilisateur
        $etat = $faker->randomElement(['En attente', 'En cours', 'Livrée']); // Exemple d'état de commande
        $dateCreation = $faker->dateTimeThisYear->format('Y-m-d H:i:s'); // Date de création

        // Insertion des données sans spécifier id_commande (puisque c'est auto-incrémenté)
        $stmt = $pdo->prepare("INSERT INTO commande (id_utilisateur, etat, date_creation) VALUES (?, ?, ?)");
        $stmt->execute([$userId, $etat, $dateCreation]);
    }

    echo "Table 'commande' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
