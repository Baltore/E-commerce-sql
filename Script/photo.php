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
        $url = $faker->imageUrl(640, 480, 'products');

        $stmt = $pdo->prepare("INSERT INTO photo (id_utilisateur, id_produit, url) VALUES (?, ?, ?)");
        $stmt->execute([$id_utilisateur, $id_produit, $url]);
    }

    echo "Table 'photo' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
