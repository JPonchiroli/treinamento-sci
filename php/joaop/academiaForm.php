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
            <form method="post" action="academiaFormDo.php">

                <div class="containerTitulo">
                    <img src="./css/profile-man.png" alt="profile-man" class="profileMan">
                    <h2 class="tituloForm">Cadastro de Pessoas</h2>
                </div>

                <div class="containerInputs">
                    <label for="nome">Nome</label>
                    <input type="text" name="nome" placeholder="Informe seu nome" required>
                </div>

                <div class="containerInputs">
                    <label for="idade">Idade</label>
                    <input type="text" name="idade" placeholder="Informe sua idade">
                </div>

                <div class="containerInputs">
                    <label for="email">E-mail</label>
                    <input type="email" name="email" placeholder="Informe seu e-mail">
                </div>

                <div class="containerInputs">
                    <label for="celular">Celular</label>
                    <input type="tel" name="celular" placeholder="Informe seu celular">
                </div>
                
                <div class="containerInputs"> 
                    <label>Sexo</label>

                    <div class="containerRadios">
                        <input type="radio" name="sexo" id="sexoM" value="0" placeholder="Masculino">
                        <label class="labelSexo" for="sexoM">Masculino</label>
                        
                        <input type="radio" name="sexo" id="sexoF" value="1" placeholder="Feminino">
                        <label class="labelSexo" for="sexoF">Feminino</label>
                    </div>
                </div>

                <button type="submit">Cadastrar</button>

            </form>

        </main>
    </body>
</html>