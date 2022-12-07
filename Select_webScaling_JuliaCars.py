
#1. #install pip PyGithub
#pip install PyGithub

from github import Github

sizeScaling = input ("Enter com o tamanho do inicial do WebScaling do JuliaCars : ")

# First create a Github instance:

# using an access token
g = Github("<youGitSecret>")

# Github Enterprise with custom hostname
#g = Github(base_url="https://{hostname}/api/v3", login_or_token="access_token")

# Then play with your Github objects:
#for repo in g.get_user().get_repos():
#   print(repo.name)


if sizeScaling == "1" :
        repo = g.get_repo("Muneralha25/JuliaCarsAutoScaling")
        contents = repo.get_contents("size_scaling.tf", ref="main")
        repo.update_file(contents.path, "update value", 'variable "minimal_size" {default     = "1"}', contents.sha, branch="main")
        repo.get_commit(sha=sha).create_status(state="pending",target_url="https://JuliaCars.com.br",description="update Scaling",context="update Scaling")

        print('OK o seu WebSite sera mais "1" servidor no Backend !!! ')


elif sizeScaling == "2" :
        repo = g.get_repo("Muneralha25/JuliaCarsAutoScaling")
        contents = repo.get_contents("size_scaling.tf", ref="main")
        repo.update_file(contents.path, "update value", 'variable "minimal_size" {default     = "2"}', contents.sha, branch="main")
        repo.get_commit(sha=sha).create_status(state="pending",target_url="https://JuliaCars.com.br",description="update Scaling",context="update Scaling")

        print(f'OK o seu WebSite tera mais "2" servidores no Backend !!! ')

else:
    print(f'Voce escolheu uma Quantidade de servidor errada')


    
