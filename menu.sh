 #!/bin/bash
 # menu.mnu
 # A simple script menu under Unix
 # Main logic starts at MAIN LOGIC
 # The logo will be displayed at the top of the screen
 LOGO="Sample Menu"

 #------------------------------------------------------
 # MENU PROMPTS
 #------------------------------------------------------
 # A list of menu prompts to be displayed for the user.
 # The list can be modified.
 # menu pick variables emenu through lmenu are blank as there
 # are no menu selections for keys J through L.
 
 amenu="a.  Show the manual path"                ;
 bmenu="b.  Add item to the manual path"        ; 
 cmenu="c.  Set the manual path to /man"    ; 
 dmenu="d.  Enter a filename"                ;
 emenu="e.  Edit a file"                                 ;
 fmenu="f.  Display the head a the file"                                 ;
 gmenu="g.  Display the tail a the file"                                 ;
 hmenu="h.  Display a listing of processes in long listing"                                 ;
 imenu="i.  Count how many processes a user is running"                                 ;
 jmenu=" "                                 ;
 kmenu=" "                                 ;
 lmenu=" "                                 ;

 #------------------------------------------------------
 # MENU FUNCTION DEFINITIONS
 #------------------------------------------------------
  
 # Define a function for invalid menu picks
 # The function loads an error message into a variable
 badchoice () { MSG="Invalid Selection ... Please Try Again" ; } 
  
 # For each prompt displayed above, there is a list of 
 # commands to execute in response to the user picking the
 # associated letter.
 # They are defined as functions
 # apick () through lpick () where
 # apick () corresponds to the menu
 # prompt amenu which is selected
 # selected by pressing a or A.
 # bpick () corresponds to the menu
 # prompt bmenu which is selected by
 # pressing b or B and so on.
 # Any menu item that is not
 # assigned a set of commands, is
 # assigned
 # the function badchoice () as a default for that pick.
 # If the user
 # selects a menu key that is assigned
 # to badchoice (). This function
 # causes an error message to be
 # displayed on the screen.
 # To add items to this second
 # list, replace badchoice ()
 # with the commands to run when
 # that letter is pressed.
 # The following steps simply define
 # the functions, but do not cause
 # any shell program steps to be executed.
 
 apick () { echo $MANPATH; }
 bpick () { read item; MANPATH = $MANPATH:$item ; export MANPATH; }
 cpick () { MANPATH =/man ; export path; }
 dpick () { read filename; find -name $filename; }
 epick () { read filename; vi $filename; }
 fpick () { read filename; read number; head -n $number $filename; }
 gpick () { read filename; read number; tail -n $number $filename; }
 hpick () { ps -l; }
 ipick () { read user; ps -U $user|wc -l; }
 jpick () { badchoice; }
 kpick () { badchoice; }
 lpick () { badchoice; }
 
 #------------------------------------------------------
 # DISPLAY FUNCTION DEFINITION
 #------------------------------------------------------
 # This function displays the menu.
 # The routine clears the screen, echoes
 # the logo and menu prompts
 # and some additional messages.
 # Note that this definition does
 # not cause the function to
 # be executed yet, it just defines
 # it ready to be executed.
 
 
 themenu () {
 # clear the screen
 clear
 echo 'date'
 echo
 echo -e "\t\t\t" $LOGO
 echo
 echo -e "\t\tPlease Select:"
 echo
 echo -e "\t\t\t" $amenu
 echo -e "\t\t\t" $bmenu
 echo -e "\t\t\t" $cmenu
 echo -e "\t\t\t" $dmenu
 echo -e "\t\t\t" $emenu
 echo -e "\t\t\t" $fmenu
 echo -e "\t\t\t" $gmenu
 echo -e "\t\t\t" $hmenu
 echo -e "\t\t\t" $imenu
 echo -e "\t\t\t" $jmenu
 echo -e "\t\t\t" $kmenu
 echo -e "\t\t\t" $lmenu
 echo -e "\t\t\tx. Exit"
 echo
 echo $MSG
 echo
 echo Select by pressing the letter and then ENTER ;
 }
 
 #------------------------------------------------------
 # MAIN LOGIC
 #------------------------------------------------------
 # Every thing up to this point has been to define
 # variables or functions.
 # The program actually starts running here.
 
 # Clear out the error message variable
 MSG=
 
 
 # Repeat the menu over and over
 # Steps are:
 # 1. Display the menu
 # 2. 'read' a line of input from the key board
 # 3. Clear the error message
 # 4. Check the answer for a or A or b or B etc. and dispatch
 #    to the appropriate program or function or exit
 # 5. If the entry was invalid call the badchoice () function
 #    to initialize MSG to an error message
 # 6. This error message is used when setting up the menu
 #    for a menu pick that is valid but has no command
 #    associated with it.
 
 while  true
 do
 # 1. display the menu
   themenu
 
 # 2. read a line of input from the keyboard
   read answer
 
 # 3. Clear any error message
   MSG=
 
 # 4. Execute one of the defined functions based on the
 #    letter entered by the user.
 
 # 5. If the choice was J through L, the pre-defined
 #    function for that pick will execute badchoice ()
 #    which loads an error message into MSG  
 
 
  case $answer in
       a|A) apick;;
       b|B) bpick;;
       c|C) cpick;;
       d|D) dpick;;
       e|E) epick;;
       f|F) fpick;;
       g|G) gpick;;
       h|H) hpick;;
       i|I) ipick;;
       j|J) jpick;;
       k|K) kpick;;
       l|L) lpick;;
 
 #      If the user selects x to exit then break out
 #      of this loop
       x|X) break;;
 
 # 6. If the entry was invalid call the badchoice function
 #    to initialize MSG to an error message
        *) badchoice;;
  
   esac
 
 #     Do it again until the user enters x.
 done



