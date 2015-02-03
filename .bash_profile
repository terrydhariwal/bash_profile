BROOKLYN_DIR="/Users/Terry/dev/brooklyn-0.7.0-M1"
export PATH=$PATH:$BROOKLYN_DIR/bin/

BRACKETS_DIR="/Applications/Brackets.app/Contents/MacOS/"
export PATH=$PATH:$BRACKETS_DIR

# Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:$PATH"

# Add android path
export PATH="/Users/Terry/Library/Android/sdk/platform-tools/adb:$PATH"

##########################  EASILY SWITCH JDK ############################
function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }
#setjdk 1.6
#setjdk 1.7
setjdk 1.8
##########################################################################

# Changes the bash prompt tp be colorized and rearranges the prompt to be "username@hostname:ced $"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\$ "
 
# Needed to add colors to GNU tools like ls, top etc 
export CLICOLOR=1
 
# The next line defines the colors for the 'ls' command
export LSCOLORS=ExFxBxDxCxegedabagacad
 
# Finally, we alias ls to include a few flags by default. -G colorizes output, -h makes sizes human readable, and -F throws a / after a directory, * after an executable, and a @ after a symlink, making it easier to quickly identify things in directory listings.
alias ls='ls -GFh'

# ensure git autocomplete runs
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
