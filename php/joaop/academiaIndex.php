<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academia Index</title>

    <link rel="stylesheet" href="./css/academiaIndex.css">
</head>

<body>
    <header class="cabecalhoListagem">
        <img class="profileListagem" src="css/profile-man.png">
        <h2 class="tituloListagem">Listagem Pessoas</h2>
    </header>

    <main>
        <section>
            <button class="botaoCadastrar">
                <a href="academiaForm.php">Cadastro</a>
            </button>
        </section>

        <section class="containerTabela">
            <input type="text" placeholder="Pesquisar por nome...">

            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Idade</th>
                        <th>Email</th>
                        <th>Celular</th>
                        <th>Sexo</th>
                        <th>A��o</th>
                    </tr>
                </thead>

                <tbody>
                    <?php
                    require_once("../../connectionSCI/connection.php");

                    $sql = "SELECT * FROM joaop";

                    $rs = mysql_query($sql, $conexao) or die("Query Incorreta: [> " . $sql . " <]<br>" . mysql_errno() . ': ' . mysql_error());

                    if (mysql_num_rows($rs) > 0) {
                        while ($row = mysql_fetch_assoc($rs)) {
                            echo "<tr>";
                            echo "<td>" . $row['idPessoa'] . "</td>";
                            echo "<td>" . $row['nomePessoa'] . "</td>";
                            echo "<td>" . $row['idadePessoa'] . "</td>";
                            echo "<td>" . $row['emailPessoa'] . "</td>";
                            echo "<td>" . $row['celularPessoa'] . "</td>";
                            echo "<td>" . $row['sexoPessoa'] . "</td>";
                            echo "<td> <button class='botaoAcao'> <img src='./css/ico-editar.png' class='imagemAcao' > </button>  <button class='botaoAcao'> <img src='./css/ico-excluir.png' class='imagemAcao' > </button> </td>";
                            echo "<tr>";
                        }
                    } else {
                        echo "<td> Nenhum registro cadastrado. </td>";
                    }
                    ?>
                </tbody>
            </table>
            <tfoot>
                <?php echo "Foram encontrados um total de " . mysql_num_rows($rs) . " registros." ?>
            </tfoot>
        </section>

    </main>
</body>

</html>