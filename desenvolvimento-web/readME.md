# Desenvolvimento Web

## Entender redes

- APIs funcionam por redes  
- Aplicações precisam trafegar dados  
- Segurança, desempenho e integração dependem de saber como a comunicação funciona  

---

## O que é uma Rede de Computadores

- Conjunto de dispositivos interconectados para trocar dados  
- **LAN** (Local Area Network) e **WAN** (Wide Area Network)  

---

## Papel da Internet

- Rede mundial que conecta milhões de redes  
- Conjunto de protocolos **TCP/IP**  

---

## Camadas da Rede

1. **Camada de Acesso de Rede**: Ethernet, Wireless LAN  
2. **Camada de Internet**: IP (v4, v6)  
3. **Camada de Transporte**: TCP, UDP  
4. **Camada de Aplicação**: HTTP, TLS, DNS  

---

## Camada de Acesso de Rede

- Camada física que lida com dispositivos locais  
- Inclui tecnologias como **Ethernet**, **Wi-Fi**, **DSL**  
- Usa endereços **MAC** para entrega direta  

---

## Camada da Internet

- Define endereçamento lógico de IP  
- Envia pacotes entre redes diferentes  
- Usa roteamento para escolher o "caminho" até o destino  
- Prioriza:
  - Roteamento  
  - Endereçamento  
  - Padronização  
  - Conectividade  

---

## IPv4 vs IPv6

| IPv4           | IPv6                 |
|----------------|----------------------|
| 32-bit         | 128-bit              |
| Configuração manual ou DHCP | Autoconfiguração |

---

## Camada de Transporte

- Garante a entrega confiável dos dados entre origem e destino  
- Divide dados em segmentos  
- Cuida da ordem e da retransmissão, se necessário  

### TCP  
- Garante ordem e entrega (ex: HTTP, HTTPS)  

### UDP  
- Mais rápido, sem garantia (ex: vídeo ao vivo, jogos)  

### Portas  
- Ex: 80, 443, 3306  

### Handshakes  
- TCP 3-way handshake  

---

## Camada de Aplicação

- Interface com o usuário e aplicações  
- Define protocolos de comunicação de alto nível:
  - **HTTP**
  - **FTP**
  - **DNS**
  - **SMTP**

### DNS  
- Reconhece domínios  
- Linka `www.google.com` → `127.0.0.1` (IP do Google)  

### HTTP  
- Navegador acessando um site, comunicação entre cliente e servidor  

### HTTPS  
- Uso de chaves pública e privada para criptografia de dados  
- Baseado em **SSL/TLS**  

---

## Consumindo APIs REST

- Entendimento de **REST** e **recursos**  
- Métodos HTTP (GET, POST, etc.)  
- Requisições com **JSON**  
- API: Porta de Comunicação  

---

## JSON

- JavaScript Object Notation  
- Formato para troca de dados entre humanos e máquinas  
