<?php

require_once '../vendor/autoload.php';

use Faker\Factory;

$faker = Factory::create('fr_FR');

$dbHost = 'localhost';
$dbName = 'e-commerce-sql';
$dbUser = 'root';
$dbPassword = '';

try {
    $pdo = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPassword);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    for ($i = 0; $i < 10; $i++) {
        $id_utilisateur = mt_rand(1, 10);
        $id_produit = mt_rand(1, 10);
        $note = mt_rand(1, 5);
        $commentaire = $faker->sentence;
        $date_creation = $faker->dateTimeThisYear()->format('Y-m-d H:i:s');

        $stmt = $pdo->prepare("INSERT INTO evaluation (id_utilisateur, id_produit, note, commentaire, date_creation) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$id_utilisateur, $id_produit, $note, $commentaire, $date_creation]);
    }

    echo "Table 'evaluation' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
