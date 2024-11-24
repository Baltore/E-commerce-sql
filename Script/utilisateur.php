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

    for ($i = 0; $i < 10; $i++) {
        $prenom = $faker->firstName;
        $nom = $faker->lastName;
        $email = $faker->email;
        $mot_de_passe = password_hash($faker->password, PASSWORD_DEFAULT);
        $telephone = $faker->phoneNumber;

        $stmt = $pdo->prepare("INSERT INTO utilisateur (prenom, nom, email, mot_de_passe, telephone) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$prenom, $nom, $email, $mot_de_passe, $telephone]);
    }

    echo "Table 'utilisateur' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
