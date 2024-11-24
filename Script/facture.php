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
        $id_commande = mt_rand(1, 10);
        $total = $faker->randomFloat(2, 10, 1000);
        $date_emission = $faker->dateTimeThisYear()->format('Y-m-d H:i:s');

        $stmt = $pdo->prepare("INSERT INTO facture (id_utilisateur, id_commande, total, date_emission) VALUES (?, ?, ?, ?)");
        $stmt->execute([$id_utilisateur, $id_commande, $total, $date_emission]);
    }

    echo "Table 'facture' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
