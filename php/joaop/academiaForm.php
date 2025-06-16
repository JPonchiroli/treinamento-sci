<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academia Form</title>

    <link rel="stylesheet" href="./css/academiaForm.css">
</head>

<body>
    <main>

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

        <form method="post" action="academiaFormDo.php">

            <div class="containerTitulo">
                <img src="./css/profile-man.png" alt="profile-man" class="profileMan">
                <? $funcaoTela = $idPessoa != 0 ? "Atualização de Pessoa" : "Cadastro de Pessoa" ?>
                <h2 class="tituloForm"> <?= $funcaoTela ?> </h2>
            </div>

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

            <button type="submit"> <?= $funcaoBotao ?> </button>

        </form>

    </main>
</body>

</html>