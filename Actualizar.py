#/usr/bin/python
import git 

print "Iniciando Actualizacion"
g = git.cmd.Git("/home/chepecarlos/sketchbook/LaRocola/")
g.pull()
print "Actualizado"

