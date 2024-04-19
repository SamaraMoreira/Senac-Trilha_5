function loopWhileImparPar(){
    let contador = 1;
    while (contador <= 50) {
        if (contador % 2 === 0) {
            console.log(contador + " é par");
        } else {
            console.log(contador + " é ímpar");
        }
        contador++;
    }
}


function loopforImparPar(){
    for (let i = 1; i <= 50; i++) {
        if (i % 2 === 0) {
            console.log(i + " é par");
        } else {
            console.log(i + " é ímpar");
        }
    }
}

function for3em3(){
    for (let i = 1; i <= 100; i++) {
        if (i % 3 === 0) {
            console.log(i);
        }
    }    
}


function whilefor3for(){
let contador = 1;
    while (contador <= 100) {
        if (contador % 3 === 0) {
            console.log(contador);
        }
        contador++;
    }
}

function for100a0(){
    for (let i = 100; i >= 0; i -= 2) {
        console.log(i);
    }
}

function while100a0(){
    let contador = 100;
    while (contador >= 0) {
        console.log(contador);
        contador -= 2;
    }
}


function Pim(){
    for (let i = 1; i <= 40; i++) {
        // Verificar se o número é múltiplo de 4
        if (i % 4 === 0) {
            console.log("PIM");
        } else {
            console.log(i);
        }
    }
}
