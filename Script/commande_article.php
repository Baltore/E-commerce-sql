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

    for ($i = 0; $i < 20; $i++) {
        $idCommande = mt_rand(1, 10); // ID commande entre 1 et 10
        $idProduit = mt_rand(1, 50);  // ID produit entre 1 et 50
        $quantite = mt_rand(1, 5);    // Quantité aléatoire entre 1 et 5

        // Vérifier si le produit est déjà dans la commande
        $stmt = $pdo->prepare("SELECT * FROM commande_article WHERE id_commande = ? AND id_produit = ?");
        $stmt->execute([$idCommande, $idProduit]);
        $existingProduct = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existingProduct) {
            // Si le produit est déjà dans la commande, mettre à jour la quantité
            $newQuantity = $existingProduct['quantite'] + $quantite; // Ajouter la nouvelle quantité
            $updateStmt = $pdo->prepare("UPDATE commande_article SET quantite = ? WHERE id_commande = ? AND id_produit = ?");
            $updateStmt->execute([$newQuantity, $idCommande, $idProduit]);
        } else {
            // Si le produit n'est pas dans la commande, l'ajouter
            $stmt = $pdo->prepare("INSERT INTO commande_article (id_commande, id_produit, quantite) VALUES (?, ?, ?)");
            $stmt->execute([$idCommande, $idProduit, $quantite]);
        }
    }

    echo "Table 'commande_article' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
?>
