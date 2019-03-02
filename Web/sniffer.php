<?php 
$code = $_POST['code']; 
echo $code;
switch($code){
case "right": 
shell_exec("sudo bash /home/nvidia/sniffer/shell/rgt.sh"); 
break; 
case "front": 
shell_exec("sudo bash /home/nvidia/sniffer/shell/fwd.sh"); 
break; 
case "back": 
shell_exec("sudo bash /home/nvidia/sniffer/shell/bwd.sh"); 
break;
case "left": 
shell_exec("sudo bash /home/nvidia/sniffer/shell/lft.sh"); 
break; 
default: 
shell_exec("sudo bash /home/nvidia/sniffer/shell/stop.sh"); 
break;
} 
?>
