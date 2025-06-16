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
        <section class="containerBotao">
            <button class="botaoCadastrar">
                <a href="academiaForm.php">Cadastro</a>
            </button>

            <menu>
                <button class="botaoCadastrar" id="modal">Cadastro Modal</button>
            </menu>

            <dialog close class="modalCadastro" id="dialog">

                <?php
                require_once("../../connectionSCI/connection.php");

                $nome = $idade = $email = $celular = $sexo = "";
                $idPessoa = "";

                if (isset($_GET['idPessoa'])) {
                    $idPessoa = mysql_real_escape_string($_GET['idPessoa']);
                    $sql = "SELECT * FROM joaop WHERE idPessoa = '$idPessoa'";
                    $rs = mysql_query($sql, $conexao);

                    if (mysql_num_rows($rs) > 0) {
                        $row = mysql_fetch_assoc($rs);
                        $nome = $row['nomePessoa'];
                        $idade = $row['idadePessoa'];
                        $email = $row['emailPessoa'];
                        $celular = $row['celularPessoa'];
                        $sexo = $row['sexoPessoa'];
                    }
                }
                ?>

                <div class="containerTitulo">
                    <? $funcaoTela = $idPessoa != 0 ? "Atualização de Pessoa" : "Cadastro de Pessoa" ?>
                    <h2 class="tituloForm"> <?= $funcaoTela ?> </h2>
                </div>

                <form method="post" action="academiaFormDo.php">

                    <div class="containerInputs">
                        <label for="nome">Nome</label>
                        <input type="text" name="nome" placeholder="Informe seu nome" value="<?= $nome ?>" required>
                    </div>

                    <div class="containerInputs">
                        <label for="idade">Idade</label>
                        <input type="text" name="idade" placeholder="Informe sua idade" value="<?= $idade ?>">
                    </div>

                    <div class="containerInputs">
                        <label for="email">E-mail</label>
                        <input type="email" name="email" placeholder="Informe seu e-mail" value="<?= $email ?>">
                    </div>

                    <div class="containerInputs">
                        <label for="celular">Celular</label>
                        <input type="tel" name="celular" placeholder="Informe seu celular" value="<?= $celular ?>">
                    </div>

                    <div class="containerInputs">
                        <label>Sexo</label>

                        <div class="containerRadios">
                            <input type="radio" name="sexo" id="sexoM" value="0" <?= $sexo === "0" ? "checked" : "" ?> placeholder="Masculino">
                            <label class="labelSexo" for="sexoM">Masculino</label>

                            <input type="radio" name="sexo" id="sexoF" value="1" <?= $sexo === "1" ? "checked" : "" ?> placeholder="Feminino">
                            <label class="labelSexo" for="sexoF">Feminino</label>
                        </div>
                    </div>

                    <div class="containerInputs">
                        <input type="text" name="idPessoa" placeholder="Informe seu id" value="<?= $idPessoa ?>" style="visibility: hidden;" />
                    </div>

                    <? $funcaoBotao = $idPessoa != 0 ? "Atualizar" : "Cadastrar" ?>

                    <button type="submit" class="botaoCadastrarModal"> <?= $funcaoBotao ?> </button>

                </form>

                <menu>
                    <button id="cancel" type="reset">Cancel</button>
                </menu>
            </dialog>
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
        (function() {
            var updateButton = document.getElementById("modal");
            var cancelButton = document.getElementById("cancel");
            var favDialog = document.getElementById("dialog");

            updateButton.addEventListener("click", function() {
                favDialog.showModal();
            });

            cancelButton.addEventListener("click", function() {
                favDialog.close();
            });
        })();

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