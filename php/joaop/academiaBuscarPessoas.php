<?php
require_once("../../connectionSCI/connection.php");

$nome = isset($_POST['nome']) ? mysql_real_escape_string($_POST['nome']) : '';

$sql = "SELECT * FROM joaop WHERE nomePessoa LIKE '%$nome%'";
$rs = mysql_query($sql, $conexao);

if (mysql_num_rows($rs) > 0) {
    while ($row = mysql_fetch_assoc($rs)) {
        echo "<tr>";
        echo "<td>" . $row['idPessoa'] . "</td>";
        echo "<td>" . $row['nomePessoa'] . "</td>";
        echo "<td>" . $row['idadePessoa'] . "</td>";
        echo "<td>" . $row['emailPessoa'] . "</td>";
        echo "<td>" . $row['celularPessoa'] . "</td>";
        echo $row['sexoPessoa'] == 0 ? "<td> Masculino </td>" : "<td> Feminino </td>";
        echo "<td> 
                <button class='botaoEditar' onclick='clicado()' value=" . $row['idPessoa'] . "> 
                    <img src='./css/ico-editar.png' class='imagemEditar' > 
                </button>  
                <button class='botaoExcluir' onclick='excluirPessoa(" . $row['idPessoa'] . ")' value=" . $row['idPessoa'] . "> 
                    <img src='./css/ico-excluir.png' class='imagemExcluir' > 
                </button>
             </td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='7'> Nenhum registro encontrado. </td></tr>";
}
