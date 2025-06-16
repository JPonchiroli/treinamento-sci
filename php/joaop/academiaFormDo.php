<?php

require_once("../../connectionSCI/connection.php");

$nome = $_POST['nome'];
$idade = $_POST['idade'];
$email = $_POST['email'];
$celular = $_POST['celular'];
$sexo = $_POST['sexo'];
$idPessoa = $_POST['idPessoa'];

if (!empty($idPessoa)) {
    $sql = "UPDATE joaop SET 
                    nomePessoa = '$nome',
                    idadePessoa = '$idade',
                    emailPessoa = '$email',
                    celularPessoa = '$celular',
                    sexoPessoa = '$sexo'
                WHERE idPessoa = '$idPessoa'";
} else {
    $sql = "INSERT INTO joaop (nomePessoa, idadePessoa, emailPessoa, celularPessoa, sexoPessoa) 
                VALUES ('$nome', '$idade', '$email', '$celular', '$sexo')";
}

$rs = mysql_query($sql, $conexao) or die("Query Incorreta: [> " . $sql . " <]<br>" . mysql_errno() . ': ' . mysql_error());

header("Location: academiaIndex.php");
exit();
