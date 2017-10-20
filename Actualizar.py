#/usr/bin/python
import git 
import os, os.path

print "Iniciando Actualizacion"
g = git.Git(os.path.expanduser("~/sketchbook/LaRocola/"))
result = g.execute(["git", "pull"])
print "Actualizado"

