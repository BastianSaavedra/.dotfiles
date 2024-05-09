from os import path
import subprocess, json


def themes():
  with open('../themes/nord.json', 'r') as file:
    theme = json.load(file)
    group1 = theme['group1']
    group2 = theme['group2']
    group3 = theme['group3']
    group4 = theme['group4']

  return group1, group2, group3, group4
    


