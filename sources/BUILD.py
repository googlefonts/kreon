import os 
import subprocess


try:
    print("**** Running Fontmake ******************************\n")
    subprocess.call(['fontmake', '-g', 'sources/Kreon.glyphs', '-o', 'variable',])
except:
    print("Error! Try installing Fontmake: https://github.com/googlei18n/fontmake")


print("\n**** Moving fonts to fonts directory *******************")
subprocess.call(['cp', 'variable_ttf/Kreon-VF.ttf', 'fonts/',])
print("     [+] Done")


print("\n**** Removing build directories  ***********************")
subprocess.call(['rm', '-rf', 'variable_ttf', 'master_ufo'])
print("     [+] Done")


os.chdir('fonts')
print("     [+] Done")
cwd = os.getcwd()
print("     In Directory:", cwd)
print("\n**** Run: ttfautohint  *********************************\n")
subprocess.call(['ttfautohint', '-I', 'Kreon-VF.ttf', 'Kreon-VF-Fix.ttf'])
subprocess.call(['cp', 'Kreon-VF-Fix.ttf', 'Kreon-VF.ttf'])
subprocess.call(['rm', '-rf', 'Kreon-VF-Fix.ttf'])
print("     [+] Done")


os.chdir("..")
cwd = os.getcwd()
print("     In Directory:", cwd)
print("\n**** Run: gftools  **************************************")
# subprocess.call(['gftools', 'fix-dsgi', 'fonts/Staatliches-Regular.ttf', '--autofix'])

