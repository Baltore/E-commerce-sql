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
        $idUtilisateur = mt_rand(1, 10); // ID utilisateur entre 1 et 10
        $idProduit = mt_rand(1, 50); // ID produit entre 1 et 50
        $quantite = mt_rand(1, 5); // Quantité aléatoire entre 1 et 5

        // Vérifier si le produit est déjà dans le panier de l'utilisateur
        $stmt = $pdo->prepare("SELECT * FROM panier_article WHERE id_panier = ? AND id_produit = ?");
        $stmt->execute([$idUtilisateur, $idProduit]);
        $existingProduct = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existingProduct) {
            // Si le produit est déjà dans le panier, mettre à jour la quantité
            $newQuantity = $existingProduct['quantite'] + $quantite; // Ajouter la nouvelle quantité
            $updateStmt = $pdo->prepare("UPDATE panier_article SET quantite = ? WHERE id_panier = ? AND id_produit = ?");
            $updateStmt->execute([$newQuantity, $idUtilisateur, $idProduit]);
        } else {
            // Si le produit n'est pas dans le panier, l'ajouter
            $stmt = $pdo->prepare("INSERT INTO panier_article (id_panier, id_produit, quantite) VALUES (?, ?, ?)");
            $stmt->execute([$idUtilisateur, $idProduit, $quantite]);
        }
    }

    echo "Table 'panier_article' remplie avec des données fictives.";

} catch (PDOException $e) {
    echo "Erreur de base de données : " . $e->getMessage();
}
?>
