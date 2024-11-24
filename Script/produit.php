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

    // Générer 10 produits fictifs
    for ($i = 0; $i < 10; $i++) {
        $nom = $faker->word; // Nom du produit
        $description = $faker->text(200); // Description du produit
        $prix = $faker->randomFloat(2, 5, 1000); // Prix aléatoire entre 5 et 1000
        $quantiteStock = $faker->numberBetween(1, 100); // Quantité en stock entre 1 et 100
        $createdAt = $faker->dateTimeThisYear->format('Y-m-d H:i:s'); // Date de création

        // Insertion des données dans la table produit
        $stmt = $pdo->prepare("INSERT INTO produit (nom, description, prix, quantite_stock, created_at) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$nom, $description, $prix, $quantiteStock, $createdAt]);
    }

    echo "Table 'produit' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
