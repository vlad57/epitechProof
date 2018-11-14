##Header Emacs##
rm -rf ~/.emacs.d
rm -rf ~/.emacs
tar -xvf header5.tar
mkdir ~/.emacs.d
mv php-mode.el ~/.emacs.d
mv std_comment.el ~/.emacs.d
mv std.el ~/.emacs.d
mv .emacs ~/
sudo mv school /usr

##Indispensables .sh##
tar -xvf pointsh.tar
mkdir ~/bin
mv norme.py ~/bin
sudo mv blih.py /bin
mv clone.sh ~/bin
mv prepare_my_repo.sh ~/bin
mv push_that.sh ~/bin

##Git config##
echo -n "Enter login: "
read varlog
echo -n "Enter epitechmail: "
read varmail
git config --global user.name $varlog
git config --global user.email $varmail

##Alias##
echo "alias clean='rm -rf *~'" >> ~/.bashrc
echo "alias klean='rm -rf *#'" >> ~/.bashrc
echo "alias push='~/bin/push_that.sh'" >> ~/.bashrc
echo "alias clone='~/bin/clone.sh'" >> ~/.bashrc
echo "alias repo='~/bin/prepare_my_repo.sh'" >> ~/.bashrc
echo "alias check='~/bin/norme.py'" >> ~/.bashrc
echo "alias doit='make re ; make clean'" >> ~/.bashrc
echo "alias ..='cd ..'" >> ~/.bashrc
echo "alias ne='emacs -nw'" >> ~/.bashrc
echo "alias maj='sudo apt-get update && sudo apt-get upgrade'" >> ~/.bashrc

#Couleurs
orange='\e[0;33m'
vertfonce='\e[0;32m'
cyanfonce='\e[0;36m'
violetfonce='\e[0;35m'

##Diverses Intallations (Option)##
while true
do
    echo -n -e "${orange}Do you want install atom ? (yes/no): "
    read getatom

    if [ "$getatom" == "yes" ] || [ "$getatom" == "y" ];
    then
	sudo add-apt-repository ppa:webupd8team/atom
	sudo apt-get update
	sudo apt-get install atom
	apm install epitech-header
	apm install epitech-norm-linter
	apm install epitech-norm
	apm install epitech-atom
	apm install autocomplete
	apm install complete-statement
	apm install atom-save-all
	apm install emacs-flow
	apm install atomic-emacs
	apm install emacs-plus
	apm install github-plus
	break
	
	else if [ "$getatom" == "no" ] || [ "$getatom" == "n" ]
	then
	       echo "What Else ?"
	       break
	fi
    fi
done

while true
do
    echo -n -e "${vertfonce}Do you want install terminator ? (yes/no): "
    read getterm
    if [ "$getterm" == "yes" ] || [ "$getterm" == "y" ];
    then
	sudo apt-get install terminator
	break
	
    else if [ "$getterm" == "no" ] || [ "$getterm" == "n" ];
	 then
	     echo "What Else"
	     break
	 fi
    fi
done

while true
      do
	  echo -n -e "${cyanfonce}Do you want install google-chrome ? (yes/no): "
	  read getchrome
	  if [ "$getchrome" == "yes" ] || [ "$getchrome" == "y" ];
	  then
	      wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	      sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
	      sudo apt-get update
	      sudo apt-get install google-chrome-stable
	      break
	      
	      else if [ "$getchrome" == "no" ] || [ "$getchrome" == "n" ];
	      then
		  echo "To bad for you"
		  break
	      fi
	  fi
done

##Installations Obligatoires##
sudo apt-get install emacs
sudo apt-get install python3
sudo apt-get install gdb
sudo apt-get install valgrind

##Suppression des clées ssh##
echo "Delete your sshkey from server if you need"
echo -n "Enter you login: "
read varlog10
blih.py -u $varlog10 sshkey list

while true
do
    echo -n "Do you need to delete sshkey ? (yes/no): "
    read vardelete
    if [ "$vardelete" == "yes" ] || [ "vardelete" == "y" ];
    then
	echo -n "Enter your login: "
	read varlog11
	echo -n "Enter the domain exemple@exemple in end of sshkey list: "
	read domain
	blih.py -u $varlog11 sshkey delete $domain
	break
	
    else if [ "$vardelete" == "no" ] || [ "vardelete" == "n" ];
	 then
		echo "We weel proceed to generation of sshkey"
	    break
	 fi
    fi
done

##Génération des clées ssh##
ssh-keygen -t rsa

echo -e "${violetfonce}Enter login: "
read varlog2
echo "Next password is your UNIX PASSWORD"
blih.py -u $varlog2 sshkey upload ~/.ssh/id_rsa.pub
ssh-add ~/.ssh/id_rsa
ssh-add -l
echo "Pretty Good now you are EPITECHPROOF ! Close your term and open him again"
