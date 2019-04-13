import os
import subprocess

path = r'C:\code\new_latin_compiler\front_\input'
os.chdir(path)
p = subprocess.run('a.exe', input=b'a', capture_output=True)
out = p.stdout
out = out.decode()
print(out)


