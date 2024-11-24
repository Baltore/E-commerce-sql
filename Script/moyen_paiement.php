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
        $methode = $faker->randomElement(['Carte bancaire', 'PayPal', 'Virement bancaire']);
        $numero_carte = $faker->creditCardNumber;
        $iban = $faker->iban('FR');

        $stmt = $pdo->prepare("INSERT INTO moyen_paiement (id_utilisateur, methode, numero_carte, iban) VALUES (?, ?, ?, ?)");
        $stmt->execute([$id_utilisateur, $methode, $numero_carte, $iban]);
    }

    echo "Table 'moyen_paiement' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
