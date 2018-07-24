#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
###############################################################
#
# This script makes a variable font from a glyphs source file.
# 
# It aplies the following fixes and tests:
#
#    * Checks if dependencies are installed 
#    * Runs Fontmake
#
# Sample usage:
#   ./build-vf.sh

# Terminal delay for improved readability, 
# set to 0.0 if not needed
SLEEPTIME=0.25

# Start TUI
clear
echo "
###############################################################
#                                                             #
#  #    # #####                    #####    ################  #
#  #    # #                        #   #    #   ##         #  #
#   #  #  ####                      #   #  #   # #   #######  #
#   #  #  #     <---------------->  #    ##    # #      #     #
#    ##   #                          #        #  #   ####     #
#    ##   #                          ##########  #####        #
#                                                             #
#  Build Variable Font Script v1.0                            #
#                                                             #
#  Licensed under the Apache License, Version 2.0             #
#  https://github.com/eliheuer/build-vf                       #
#                                                             #
###############################################################"
sleep 1

# Check if gftools is installed 
echo "
*** Checking if gftools is installed **************************"
sleep $SLEEPTIME
if command -v gftools >/dev/null; then
    echo '[+] GFtools is installed! :-)'
else
    echo '[?] GFtools is not installed :-('
    echo '[:] Get it here: https://github.com/googlefonts/gftools'
    echo '[:] Or run: pip install gftools'
fi
echo '[:] Done'
sleep $SLEEPTIME

echo "
*** Checking if fontmake is installed *************************"
sleep $SLEEPTIME
if command -v fontmake >/dev/null; then
    echo '[+] Fontmake is installed! :-)'
else
    echo '[?] Fontmake is not installed... :-('
    echo '[:] Get it here: https://github.com/googlei18n/fontmake'
    echo '[:] Or run: pip install fontmake'
fi
echo '[:] Done'
sleep $SLEEPTIME

echo '
*** Checking if fontbakery is installed ***********************'
sleep $SLEEPTIME
if command -v fontbakery >/dev/null; then
    echo '[+] Fontbakery is installed! :-)'
else
    echo '[?] Fontbakery is not installed... :-('
    echo '[:] Get it here: https://github.com/googlefonts/fontbakery'
    echo '[:] Or run: pip install fontbakery'
fi
echo '[:] Done'
sleep $SLEEPTIME






# Get filename and set CONSTANTS
#echo "
#*** Getting Name from .glyphs source **************************"
#sleep $SLEEPTIME
#for i in *.glyphs; do
#    echo "[+] \c"
#    echo $i
#    n=${i%.*}                   # remove the extension `.glyphs`
#    echo "[+] Filename set:\c"
#    echo " $n"
#    done
#sleep $SLEEPTIME
#FONTSOURCE=$n.glyphs
#echo "[+] FONTSOURCE = \c"
#echo $FONTSOURCE
#FONTFILE=$n-VF.ttf
#echo "[+] FONTFILE = \c"
#echo $FONTFILE
#echo '[:] Done'

# TMP
FONTSOURCE=Kreon.glyphs
FONTFILE=Kreon-VF.ttf

# Move to the git repo root directory
echo "
*** Moving to the git repo root directory *********************"
cd ..
echo "[+] \c"
pwd
echo '[:] Done'

# Remove old build directories
echo "
*** Removing old build directories ****************************"
rm -rf variable_ttf master_ufo &&
sleep $SLEEPTIME
echo '[:] Done'

# Build with fontmake
echo "
*** Building with fontmake ************************************"
sleep $SLEEPTIME
fontmake -g sources/$FONTSOURCE -o variable --verbose DEBUG &&
sleep $SLEEPTIME
echo '[:] Done'

# Fix no Hinting
echo "
*** Start gftools-fix-nonhinting.py ***************************"
gftools fix-nonhinting \
    variable_ttf/$FONTFILE \
    variable_ttf/$FONTFILE.fix &&
echo '[+] Done'
echo '[:] Removing input file'
rm -rf variable_ttf/$FONTFILE &&
echo '[+] Done'
echo "[:] Renaming output file to \c"
echo $FONTFILE
mv variable_ttf/$FONTFILE.fix variable_ttf/$FONTFILE
echo '[+] Done'

# Run autohint
echo "
*** Start ttfautohint *****************************************"
ttfautohint \
    variable_ttf/$FONTFILE \
    variable_ttf/$FONTFILE.fix --verbose &&
rm -rf variable_ttf/$FONTFILE
echo '[+] Done'
echo "[:] Remove input file"
mv variable_ttf/$FONTFILE.fix variable_ttf/$FONTFILE &&
echo '[+] Done'
echo "[:] Renaming output file to \c"
echo $FONTFILE
echo '[+] Done'

# Fix no dsgi
echo "
*** Start gftools-fix-dsig.py *********************************"
gftools fix-dsig \
    variable_ttf/$FONTFILE --autofix &&
echo "[+] Done"

echo "
*** Moving font file to $n/fonts/$FONTFILE ********************"
rm -rf fonts/$FONTFILE
cp variable_ttf/$FONTFILE fonts/$FONTFILE

echo "
*** Delete temporary directories **************"
rm -rf master_ufo/ variable_ttf/
echo "[+] Removed master_ufo/"
echo "[+] Removed variable_ttf/"
echo "[+] Done"

# Switch to python 3
# deactivate
# v-tt

# Run fontbakery
# echo "\n*** start fontbakery *********"
# fontbakery check-googlefonts fonts/$FONTFILE

# Switch to python2
# deactivate 
# v-tt2

# Done :-)
cd sources
echo '
*** Done ******************************************************'
echo "[+] Variable font output avaiable in the fonts directory."
