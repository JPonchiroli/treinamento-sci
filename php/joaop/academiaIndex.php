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
            <input type="text" id="inputBusca" placeholder="Pesquisar por nome...">

            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Idade</th>
                        <th>Email</th>
                        <th>Celular</th>
                        <th>Sexo</th>
                        <th>Ação</th>
                    </tr>
                </thead>

                <tbody id="tabelaPessoas">
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
                            echo $row['sexoPessoa'] == 0 ? "<td> Masculino </td>" : "<td> Feminino </td>";
                            echo "<td> 
                                    <a href='academiaForm.php?idPessoa=" . $row['idPessoa'] . "' class='botaoEditar'>
                                        <img src='./css/ico-editar.png' class='imagemEditar'>
                                    </a>  
                                    <button class='botaoExcluir' onclick='excluirPessoa(" . $row['idPessoa'] . ")' value=" . $row['idPessoa'] . "> 
                                        <img src='./css/ico-excluir.png' class='imagemExcluir' > 
                                    </button>
                                 </td>";
                            echo "<tr>";
                        }
                    } else {
                        echo "<td colspan='7'> Nenhum registro cadastrado. </td>";
                    }
                    ?>
                </tbody>

                <tfoot>
                    <tr>
                        <td colspan="7">
                            <?php echo "Foram encontrados um total de " . mysql_num_rows($rs) . " registros." ?>
                        </td>
                    </tr>
                </tfoot>
            </table>

        </section>

    </main>

    <script>
        document.getElementById('inputBusca').addEventListener('keydown', function() {
            const nome = this.value;

            fetch('academiaBuscarPessoas.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'nome=' + encodeURIComponent(nome)
                })
                .then(response => response.text())
                .then(html => {
                    document.getElementById('tabelaPessoas').innerHTML = html;
                })
                .catch(error => console.error('Erro ao buscar pessoas:', error));
        });

        function excluirPessoa(idPessoa) {
            if (confirm("Tem certeza que deseja excluir esta pessoa?")) {
                fetch('academiaDeletaPessoa.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: 'idPessoa=' + encodeURIComponent(idPessoa)
                    })
                    .then(response => {
                        if (response.ok) {
                            alert("Pessoa excluída com sucesso!");
                            window.location.reload();
                        } else {
                            alert("Erro ao excluir pessoa (status: " + response.status + ")");
                        }
                    })
                    .catch(error => {
                        console.error('Erro:', error);
                        alert('Erro na exclusão. Verifique o console.');
                    });
            }
        }
    </script>
</body>

</html>