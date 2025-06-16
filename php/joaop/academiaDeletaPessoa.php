<?php
require_once("../../connectionSCI/connection.php");

if (isset($_POST['idPessoa']) && is_numeric($_POST['idPessoa'])) {
    $idPessoa = $_POST['idPessoa'];

    $sql = "DELETE FROM joaop WHERE idPessoa = " . $idPessoa;
    $resultado = mysql_query($sql, $conexao);

    if ($resultado) {
        http_response_code(200);
    } else {
        http_response_code(500);
    }
} else {
    http_response_code(400);
}
exit;
