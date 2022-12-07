# JuliaCarsAutoScaling

Auto Scaling - JuliaCars

Escopo
A Julia é Senior Manager Product do portal “JuliaCars ”, ela é responsavel por este canal de marketing e vendas de Produtos de carros esportivos, porem Julia não tem perfil tecnico de Tecnologia e nem em linguagem de programação, e tão pouco em Computação e Nuvem, mas Julia tem problemas neste gerenciamento e frequentemente recebe altos custos com infraestrutura em seu centro de Custo e nem consegue planejar gastos e pedir budget para proximo ano para seus Diretores
Julia sabe que o Portal esta hospedado na Nuvem do OCI (Oracle Computer Infraestruture) e que há um Autoscalling e Load Balance que sustentam este portal, mas ja teve experiência ruins e escalation de Diretores que o Portal JuliaCars estava fora do ar ou muito Lento durante as navegações, Julia ja teve problemas e discusões com o time de arquitetura e infrastrutura da empresa 
Julia recentemente teve problemas em uma campanha de marketing massiva do Portal, pois  o Portal ficou fora 80% do tempo fora do ar, pois houve um erro de configuração nos autoscaling realizado erroneamente por um novo analista Junior da empresa, com este evento e o seu cargo ficou em risco gerando conflitos entre os departamentos
Certa vez ela tambem deixou um autoscaling pré-configurado e onde um ataque DDOS aumentou muito a quantidade Backend set e o consumo final de Billing do OCI gerando mais problema internos e seus diretores 
Julia não sabe logar no portal OCI e nem tem perfil técnico na Cloud, também tem medo de mexer nas Configurações e Tenancy / Compartment, Instance e AutoScalling

Julia sabe e monitora bem a quantidade de acesso no Portal, e os periodos de campanhas de Marketing do Portal mas queria um meio mais user Frindelly para este gerenciamento e escolher a quantidade de servidores no backend e frontend do seu Portal, sem necessidade de interações e chamados para área de TI e seus SLAs. Assim Julia consegue planejar gastos e planejar Budget mais acertivos junto as seus Diretores da Empresa 

Julia precisa de um Método interativo e Frindelly que controle o autoscalling (sem interação com área de TI)
Com este método ela consegue alterar a quantidade de servidores disponiveis para suportar a quantidade de acesso ao portal de seus produtos 



Tecnologia

•	Script User Frindelly com Python
•	TerraForm (OCI Resource Managers)
•	Github para versionamento e armazemanto do IaC do Portal
•	Github Action
•	Cloud Provider Oracle OCI 
•	Oracle Linux Instance com Autoscaling e Load Balance
•	Bucket (armazenamento de imagem do portal e html files)


Tarefas

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


      Selecione o Source Code Control System e informe o Repo onde esta o projeto do TerraForm
      
![image](https://user-images.githubusercontent.com/109544121/206060304-e9728dc2-b32f-46e3-8b41-e710bdb9dac5.png)


      Colocar o nome exato de JuliaCars_upload para Posteriomente o Git Actions pegar o Trigger do Commit
           
  ![image](https://user-images.githubusercontent.com/109544121/206060806-3297b131-b25b-491b-a4c5-b14180084856.png)


![image](https://user-images.githubusercontent.com/109544121/206061242-7b47f43f-87c0-4d9c-b94c-923027e2af3a.png)



aguarde a infra ser provisionada pela Stack do Oracle Resource Manager

![image](https://user-images.githubusercontent.com/109544121/206061990-64c7b4d3-a4e6-4ce7-9153-249875a5c699.png)



