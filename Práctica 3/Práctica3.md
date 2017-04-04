## SWAP
### Práctica 3 - Jorge Gutiérrez Segovia

### IP de mis máquinas

| SWAP 1  	 | SWAP 2 	  | Balanceador |
| ---------- | ---------- | ----------  |
| 10.0.2.4   | 10.0.2.15  | 10.0.2.5	|

| Peticiones | Balanceador |
| ---------- | ----------  |
| 10.0.2.7   | 10.0.2.5	   |

### Instalación nginx

Tras instalar dos máquinas virtuales adicionales a las dos de las anteriores prácticas, una para el balanceador de carga(sin apache) y otra para hacer las peticiones, abrimos la máquina destinada a ser el balanceador y le instalamos nginx con el siguiente comando:

`sudo apt-get install nginx`

###Configuración de nginx
