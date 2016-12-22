Return-Path: <jake@udc0866934>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 8AD9A52AFF
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 14:25:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBMEPaG3008998
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZOU012483
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZY4005156;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cK4JL-000443-6V; Thu, 22 Dec 2016 09:25:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Dec 2016 09:25:24 -0500
Message-ID: <1482416729-15556-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
References: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 3/8] setup-uboot-env-keystone.sh: add detection of BMC port
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2016 14:25:41 -0000
Content-Type: text/plain

* add the ability to auto-detect the BMC port
* The BMC may be used to reboot and configure the bootmode.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-keystone.sh | 51 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index 356e9c7..da90629 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -210,7 +210,8 @@ check_for_board() {
                 board_vendor="0403"
                 board_product="6010"
                 num_port="2"
-                uart_port="1"
+                uart_port_idx="1"
+                bmc_port_idx="2"
             fi
         ;;
 
@@ -223,7 +224,8 @@ check_for_board() {
                 board_vendor="10c4"
                 board_product="ea70"
                 num_port="2"
-                uart_port="1"
+                uart_port_idx="1"
+                bmc_port_idx="2"
             fi
         ;;
     esac
@@ -333,6 +335,9 @@ if [ "$minicom" = "y" ]; then
         else
             echo ""
             prompt_feedback "Board could not be detected. Please connect the board to the PC." temp "Press any key to try checking again"
+
+            # Set to default board to allow user to specify the correct ports.
+            board=k2evm
         fi
     done
 
@@ -352,33 +357,51 @@ if [ "$minicom" = "y" ]; then
             echo -n "Detecting connection to board... "
             loopCount=0
             usb_id=`dmesg | grep "idVendor=${board_vendor}" | grep "idProduct=${board_product}" | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
-            port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port} | tail -1 | grep "attached" |  awk '{ print $NF }'`
-            while [ -z "$port" ] && [ "$loopCount" -ne "10" ]
+            uart_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            bmc_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${bmc_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            while [ -z "$uart_port" ] && [ "$loopCount" -ne "10" ]
             do
                 #count to 10 and timeout if no connection is found
                 loopCount=$((loopCount+1))
 
                 sleep 1
                 usb_id=`dmesg | grep "idVendor=${board_vendor}" | grep "idProduct=${board_product}" | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
-                port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port} | tail -1 | grep "attached" |  awk '{ print $NF }'`
+                uart_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
+                bmc_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${bmc_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
             done
 
             #check to see if we actually found a port
-            if [ -n "$port" ]; then
-                echo "${platform} autodetected at /dev/$port"
+            if [ -n "$uart_port" ]; then
+                echo "${platform} (UART) autodetected at /dev/$uart_port"
+                echo
+                prompt_feedback "Please verify that this is correct or manually enter the correct port:" dev_uart_port "/dev/$uart_port"
+
+                echo "${platform} (BMC) autodetected at /dev/$bmc_port"
                 echo
-                prompt_feedback "Please verify that this is correct or manually enter the correct port:" dev_port "/dev/$port"
+                prompt_feedback "Please verify that this is correct or manually enter the correct port:" dev_bmc_port "/dev/$bmc_port"
+
+                if [ ! -e "${dev_uart_port}" ]; then
+                    echo; echo "ERROR: ${dev_uart_port} does not exist!"
+                    dev_uart_port=""
+                fi
+
+                if [ ! -e "${dev_bmc_port}" ]; then
+                    echo; echo "ERROR: ${dev_bmc_port} does not exist!"
+                    dev_bmc_port=""
+                fi
+
+                if [ "$dev_uart_port" = "$dev_bmc_port" ]; then
+                    echo; echo "ERROR: UART and BMC cannot be the same port: $dev_uart_port!"
+                    dev_uart_port=""
+                fi
 
-                if [ ! -e "${dev_port}" ]
-                then
-                    echo "ERROR: ${dev_port} does not exist!"
-                else
+                if [ -n "$dev_uart_port" ] && [ -n "$dev_bmc_port" ]; then
                     break
                 fi
             fi
 
             #if we didn't find a port and reached the timeout limit then ask to reconnect
-            if [ -z "$port" ] && [ "$loopCount" = "10" ]; then
+            if [ -z "$uart_port" ] && [ "$loopCount" = "10" ]; then
                 echo ""
                 echo "Unable to detect which port the board is connected to."
                 echo "Please reconnect your board."
@@ -393,7 +416,7 @@ if [ "$minicom" = "y" ]; then
             fi
         done
 
-        sed -i -e "s|^pu port.*$|pu port             $dev_port|g" ${HOME}/.minirc.dfl
+        sed -i -e "s|^pu port.*$|pu port             $dev_uart_port|g" ${HOME}/.minirc.dfl
     fi
 
     echo
-- 
1.9.1


