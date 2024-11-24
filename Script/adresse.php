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

    // Génération de 10 adresses fictives
    for ($i = 0; $i < 10; $i++) {
        $userId = mt_rand(1, 10); // Assurez-vous que l'ID utilisateur existe déjà dans la table utilisateur
        $rue = $faker->streetAddress;
        $ville = $faker->city;
        $codePostal = $faker->postcode;
        $pays = $faker->country;

        // Insertion des données sans spécifier id_adresse
        $stmt = $pdo->prepare("INSERT INTO adresse (id_utilisateur, rue, ville, code_postal, pays) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$userId, $rue, $ville, $codePostal, $pays]);
    }

    echo "Table 'adresse' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
