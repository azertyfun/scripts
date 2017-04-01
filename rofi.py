#!/usr/bin/env python3

import subprocess
import os

new_env = dict(os.environ)
new_env['LC_ALL'] = 'C'

f = open('/home/nathan/.rofi.log', 'w')
f.write('Running rofi\n')

process = subprocess.run(["rofi", "-show", "drun", "-m", "0", "-modi", "window,run,ssh,drun", "-config", "/home/nathan/.local/rofi/config"], stdin=open('/home/nathan/.rofi.stdout', 'w'), stderr=open('/home/nathan/.rofi.stderr', 'w'), env=new_env)
f.write("Return code: " + str(process.returncode))
