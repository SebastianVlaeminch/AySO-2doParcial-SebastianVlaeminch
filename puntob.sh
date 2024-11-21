Generamos la key publica desde el nodo:
----------------------------------------
ssh-keygen
ll .ssh/
cat .ssh/id_rsa.pub

copiamos la key publica y la pegamos en la otra VM:
------------------------------------------------------------
ll .ssh/

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEIMUU6PWZ5S+oG9DB+u3oDtmWsZy7fghRJWLEA9+uJ2zTAKiHWPVzDD01fKEa6TubQSPp5zoyhoad/DCo2AIQ3ijEnQeTrbevx/GMkNMdrOdgBp0LuLpZrEgW6jxDFyWcpHgw7ypFA4r+bii5wo4S1W3DwSpdmO39v51YkB2ZZMGiZ7vU0meHmJoGeNqB5pdnY3HfycGUgDPpO6Ccy+jSg1lIRsBosN/4BzaMFbIgg+8zc7+xjIVxBGAUxM4+gIe0suABnxtsJxbOuOzByz/AqIhaFiZ4GqOhe7+fEpG3zahkqPNWS4dXLm6LwIaR8H4b747ojEs+FhrWRBiAiw7noikUJtwgCcYj4vmODioXkC9IwX/CMlcRwcqfFMSzRwh7mpLOBaVjpIEe28SwzfX5PxbHi0GRZvpIDVdBiManWxiiXiBiGc6a63+xvPBa/Dmgqc3janB67bIRxTqGPYrwgcpRF2sbJcsq/8YEHp2DCXaseQppmx4Jn05HqsGRtGM= vagrant@VMExamen3172" >> .ssh/authorized_keys

nos conectamos desde el nodo a la otra VM:
-----------------------------------------
ssh vagrant@192.168.56.9
exit

Dentro de la VM del nodo:
----------------------------

git clone https://github.com/upszot/UTN-FRA_SO_Ansible.git
cd UTN-FRA_SO_Ansible/
ll
cd ejemplo_02/
ll
vim inventory
vim playbook.yml
ansible-playbook -i inventory playbook.yml

Ingresamos a la otra VM:
-------------------------
sudo apt list --installed |grep apache
