# JuliaCarsAutoScaling


Escopo / Estudo de Caso acadêmico 


A Julia é Senior Manager Product do portal “JuliaCars ”, ela é responsavel por este canal de marketing e vendas de Produtos de carros esportivos, porem Julia não tem perfil tecnico de Tecnologia e nem em linguagem de programação, e tão pouco em Computação e Nuvem, mas Julia tem problemas neste gerenciamento e frequentemente recebe altos custos com infraestrutura em seu centro de Custo e nem consegue planejar gastos e pedir budget para proximo ano para seus Diretores.
Julia sabe que o Portal esta hospedado na Nuvem do OCI (Oracle Computer Infraestruture) e que há um Autoscaling e Load Balance que sustentam este portal, mas ja teve experiências ruins e escalation de Diretores que o Portal JuliaCars estava fora do ar ou muito Lento durante as navegações, Julia ja teve problemas e discusões com o time de arquitetura e infrastrutura da empresa 
Julia recentemente teve problemas em uma campanha de marketing massiva do Portal, pois o Portal ficou fora 80% do tempo devido a um erro de configuração nos autoscaling realizado erroneamente por um novo analista Junior da empresa, com este evento o seu cargo ficou em risco gerando conflitos entre os departamentos.
Certa vez tambem teve um caso que deixaram um autoscaling pré-configurado e onde um ataque DDOS aumentou muito a quantidade Backend set e o consumo final de Billing do OCI gerando mais problemas internos e com seus diretores.
Julia não sabe logar no portal OCI e nem tem perfil técnico na Cloud, também tem medo de mexer nas Configurações e Tenancy / Compartment, Instance e AutoScaling

Julia sabe e monitora bem a quantidade de acesso no Portal, e os períodos de campanhas de Marketing do Portal mas queria um meio mais user Frindelly para este gerenciamento e escolher a quantidade de servidores no backend e frontend do seu Portal, sem necessidade de interações e chamados para área de TI e seus SLAs. Assim Julia consegue planejar gastos e prever Budget mais acertivos junto as seus Diretores da Empresa 

Julia precisa de um Método interativo e Frindelly que controle o autoscaling (sem interação com área de TI)
Com este método ela consegue alterar a quantidade de servidores disponiveis para suportar a quantidade de acesso ao portal de seus produtos 



TECNOLOGIAS

-Script User Frindelly com Python

-TerraForm (OCI Resource Managers)
 
-Github para versionamento e armazemanto do IaC do Portal

-Github Action

-Cloud Provider Oracle OCI 

-Oracle Linux Instance com Autoscaling e Load Balance

-Bucket (armazenamento de imagem do portal e html files)


TAREFAS

- Subir a Infra do Portal via Terraform IaC pelo OCI Resource Manager pelo repositorio Github
- Desenvolver um User Frindelly para Julia pode alterar a quantidade de Servidores do Portal
- o Script será capaz de fazer um Update e commit no Repo do Portal
- o GitHub Actions do Report tera um action on Push que dispara um novo Apply no Resource Manager 
- Validar as configurações no ambiente do AutoScaling e adição e remoção das Instances Web no Portal JuliaCars


Topologia e Lógica
Desenho da topologia e integrações

![image](https://user-images.githubusercontent.com/109544121/206062546-672508e6-50b3-4963-ad49-2a229498a1f7.png)




como executar 
1.	Configurar e subir o Projeto via Terraform (OCI Resource Manage) GitHub Source Provider

![image](https://user-images.githubusercontent.com/109544121/206059814-65b6afbd-6647-4594-a012-ad136cf6f91d.png)

![image](https://user-images.githubusercontent.com/109544121/206060074-370d3c42-2f83-4a1c-85f8-8d7220954273.png)


      Selecione o Source Code Control System e informe o Repo onde esta o projeto do TerraForm  < QUE ESTE MESMO REPO QUE ESTAMOS >
      
![image](https://user-images.githubusercontent.com/109544121/206060304-e9728dc2-b32f-46e3-8b41-e710bdb9dac5.png)


      Colocar o nome exato de JuliaCars_upload para Posteriomente o Git Actions pegar o Trigger do Commit
           
  ![image](https://user-images.githubusercontent.com/109544121/206060806-3297b131-b25b-491b-a4c5-b14180084856.png)


![image](https://user-images.githubusercontent.com/109544121/206061242-7b47f43f-87c0-4d9c-b94c-923027e2af3a.png)



aguarde a infra ser provisionada pela Stack do Oracle Resource Manager

![image](https://user-images.githubusercontent.com/109544121/206061990-64c7b4d3-a4e6-4ce7-9153-249875a5c699.png)


o Terraform tem um output com o IP Public para acesso ao Portal o VIP do Load Balance

![image](https://user-images.githubusercontent.com/109544121/206063078-38ebc263-750c-446f-a507-8eb79c5ac8c4.png)


Validando se o acesso esta OK e disponivel pelo IP Pulico do Balanceador

![image](https://user-images.githubusercontent.com/109544121/206063502-5566f1d2-fbfa-483c-9d79-755d4e8324a4.png)

existe um script PHP que pode ser utilizado para verificar se o Load Balance esta distribuindo para os 3 Sites

![image](https://user-images.githubusercontent.com/109544121/206064210-9b66e025-1255-4383-b2b1-7bb492405db7.png)

o Portal esta em Funcionamento

![image](https://user-images.githubusercontent.com/109544121/206064392-f3924b6e-6e3f-4027-bdbd-952ec4285806.png)


Julia então decide colocar mais um Servidor Web no Portal JuliaCars Rodando um Script na sua maquina local

![image](https://user-images.githubusercontent.com/109544121/206064593-1ecd93f5-26fc-4311-b9a7-224ca72e7b93.png)


o arquivo de Auto Scaling tem configuração não alteraveis com maximo de CPU de 99% e Minino de 1 % alterando somente o inicial Size Paramenters 

O SCRIPT SO FAZ UM COMMIT ARQUIVO TF size_scaling.tf para 2 e o ACTIONS FAZ o START NO STACK NOVAMENTE !!! 


apos o script o Git Actions já disparou um novo Apply no JOB

![image](https://user-images.githubusercontent.com/109544121/206066797-c263c0f9-c005-4145-998d-d1aa33b3e11a.png)


![image](https://user-images.githubusercontent.com/109544121/206066823-ef047745-6869-4f94-8999-b7d113f3f805.png)


e então o 4 servidor e adicionado ao Load Balance e ao Portal JuliaCars

![image](https://user-images.githubusercontent.com/109544121/206067521-a60f664d-03a9-40f0-8376-ecd78cc70611.png)

![image](https://user-images.githubusercontent.com/109544121/206067668-ad31fd36-824b-4ff3-bf17-f01882765509.png)
![image](https://user-images.githubusercontent.com/109544121/206067696-6548e211-098b-46eb-82ab-a3382c2af938.png)


IMPORTANTE:
ESTA DEMOSTRAÇÂO TEM APENAS O FOCO EM AUTOSCALING E COM O DEPLOY VIA TERRAFORM, NÃO ESTA EM BEST PRACTICES DE ARQUITETURA, SECURITY E RESILIÊNCIA, O MODELO ADOTADO FOI ESCOLIDO PARA MELHOR EXPLIÇAÇÂO E DEMOSTRAÇÂO DOS ITENS DOS TRABALHO !















