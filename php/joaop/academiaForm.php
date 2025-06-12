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
            <form >

                <div class="containerTitulo">
                    <img src="./css/profile-man.png" alt="profile-man" class="profileMan">
                    <h2 class="tituloForm">Cadastro de Pessoas</h2>
                </div>

                <div class="containerInputs">
                    <label for="nome">Nome</label>
                    <input type="text" id="nome" placeholder="Informe seu nome" required>
                </div>

                <div class="containerInputs">
                    <label for="idade">Idade</label>
                    <input type="text" id="idade" placeholder="Informe sua idade">
                </div>

                <div class="containerInputs">
                    <label for="email">E-mail</label>
                    <input type="email" id="email" placeholder="Informe seu e-mail">
                </div>

                <div class="containerInputs">
                    <label for="celular">Celular</label>
                    <input type="tel" id="celular" placeholder="Informe seu celular">
                </div>
                
                <div class="containerInputs"> 
                    <label>Sexo</label>

                    <div class="containerRadios">
                        <input type="radio" id="masculino" placeholder="Masculino">
                        <label class="labelSexo" for="masculino">Masculino</label>
                        
                        <input type="radio" id="feminino" placeholder="Feminino">
                        <label class="labelSexo" for="feminino">Feminino</label>
                    </div>
                </div>

                <button type="submit">Cadastrar</button>

            </form>

        </main>
    </body>
</html>