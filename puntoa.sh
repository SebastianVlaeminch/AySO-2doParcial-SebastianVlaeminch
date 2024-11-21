sudo fdisk /dev/sdc
n
p
enter
enter
+1G
Hacemos esto 3 veces para hacer 3 particiones de 1gb
-----------------------------------------------------------------
Luego creamos una nueva particion pero esta ves E (Extendida)
n
e
enter
enter
+3g

Luego creamos 2 particiones logicas dentro de la extendida
n
enter
+1.5g

MEMORIA SWAP PARTICION sdc1:
--------------------------------------------------
Luego para asignar la primera particion como Swap.

n
t
1
L
82
w

sudo mkswap /dev/sdc1
free -h
sudo swapon /dev/sdc1
free -h

CAMBIAR EL SISTEMA DE ARCHIVOS A LAS PARTICIONES /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6 A LV:
-------------------------------------------------------------------------------------------------
sudo fdisk /dev/sdc
t
2
8E

t
3
8E

t
5
8E

t
6
8E
w

CREAR LOS PV:
-----------------------------------------------------
sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6
sudo pvs

CREAR LOS VG:
--------------------------------------------------------
sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo vgs
sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6
sudo vgs

CREAR LOS LV, FORMATEAR EL SISTEMA DE ARCHICOS Y MONAJES:
--------------------------------------------------
sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
sudo lvcreate -L 1G vgDevelopers -n lvTesters
sudo lvcreate -L .8G vgDevelopers -n lvDevops
sudo lvs
sudo lvcreate -L 2G vgAdmin -n lvAdmin
sudo lvs
sudo fdisk -l
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin
sudo mkdir /mnt/lvDevelopers
sudo mkdir /mnt/lvDevops
sudo mkdir /mnt/lvTesters
sudo mkdir /mnt/lAdmin
sudo fdisk -l
sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters
sudo mount /dev/mapper/vgDevelopers-lvAdimin /mnt/lvAdmin

