const raio = 3.5; 
const altura = 1.6; 

const areaBase = Math.PI * Math.pow(raio, 2);

const volumeMetrosCubicos = areaBase * altura;

const volumeLitros = volumeMetrosCubicos * 1000; 

console.log("Volume da piscina em litros:", volumeLitros);
