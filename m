Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8B97552AC2
	for <meta-arago@arago-project.org>;
	Fri,  4 Dec 2015 15:01:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4F1EhY019227
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1E8M003122
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:14 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 09:01:14 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1ENi026140;
	Fri, 4 Dec 2015 09:01:14 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1a4rrG-0001eI-7p; Fri, 04 Dec 2015 10:01:14 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Dec 2015 10:01:07 -0500
Message-ID: <1449241270-6294-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
References: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 2/5] setup-uboot-env-keystone: Enhance board detection for k2l and k2e
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
X-List-Received-Date: Fri, 04 Dec 2015 15:01:17 -0000
Content-Type: text/plain

* Also allow user to override auto-detected device

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-keystone.sh | 72 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 21 deletions(-)

diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index 71e407d..b709cd6 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -183,19 +183,33 @@ fi
 
 board="unknown"
 check_for_board() {
-    lsusb -vv -d 0403:6001 > /dev/null 2>&1
-
-    if [ "$?" = "0" ]
-    then
-        board="x15"
-    fi
-
-    lsusb -vv -d 0403:6010 > /dev/null 2>&1
-
-    if [ "$?" = "0" ]
-    then
-        board="k2hk"
-    fi
+    case $platform in
+        "k2hk-evm")
+            lsusb -vv -d 0403:6010 > /dev/null 2>&1
+
+            if [ "$?" = "0" ]
+            then
+                board="k2evm"
+                board_vendor="0403"
+                board_product="6010"
+                num_port="2"
+                uart_port="1"
+            fi
+        ;;
+
+        "k2l-evm"|"k2e-evm")
+            lsusb -vv -d 10c4:ea70 > /dev/null 2>&1
+
+            if [ "$?" = "0" ]
+            then
+                board="k2evm"
+                board_vendor="10c4"
+                board_product="ea70"
+                num_port="2"
+                uart_port="1"
+            fi
+        ;;
+    esac
 }
 
 echo "timeout 1800" > $cwd/setupBoard.minicom
@@ -255,7 +269,7 @@ if [ "$minicom" = "y" ]; then
     do
         check_for_board
 
-        if [ "$board" = "k2hk" ]
+        if [ "$board" = "k2evm" ]
         then
             break
         else
@@ -280,23 +294,39 @@ if [ "$minicom" = "y" ]; then
             echo
             echo -n "Detecting connection to board... "
             loopCount=0
-            usb_id=`dmesg | grep 'idVendor=0403' | grep 'idProduct=6010' | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
-            port=`dmesg  | grep FTDI | grep "$usb_id" | grep "tty" | tail -2 | head -1 | grep "attached" |  awk '{ print $NF }'`
+            usb_id=`dmesg | grep "idVendor=${board_vendor}" | grep "idProduct=${board_product}" | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
+            port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port} | tail -1 | grep "attached" |  awk '{ print $NF }'`
             while [ -z "$port" ] && [ "$loopCount" -ne "10" ]
             do
                 #count to 10 and timeout if no connection is found
                 loopCount=$((loopCount+1))
 
                 sleep 1
-                usb_id=`dmesg | grep 'idVendor=0403' | grep 'idProduct=6010' | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
-                port=`dmesg  | grep FTDI | grep "$usb_id" | grep "tty" | tail -2 | head -1 | grep "attached" |  awk '{ print $NF }'`
+                usb_id=`dmesg | grep "idVendor=${board_vendor}" | grep "idProduct=${board_product}" | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
+                port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port} | tail -1 | grep "attached" |  awk '{ print $NF }'`
             done
 
             #check to see if we actually found a port
             if [ -n "$port" ]; then
-                echo "k2hk-evm connected at /dev/$port"
+                echo "${platform} autodetected at /dev/$port"
                 echo
-                break;
+                echo "Please verify that this is correct or manually enter the correct port:"
+                echo
+                read -p "[/dev/$port] " dev_port
+                echo
+
+                if [ ! -n "$dev_port" ]
+                then
+                    dev_port="/dev/$port"
+                    break
+                else
+                    if [ ! -e "${dev_port}" ]
+                    then
+                        echo "ERROR: ${dev_port} does not exist!"
+                    else
+                        break
+                    fi
+                fi
             fi
 
             #if we didn't find a port and reached the timeout limit then ask to reconnect
@@ -316,7 +346,7 @@ if [ "$minicom" = "y" ]; then
             fi
         done
 
-        sed -i -e "s|^pu port.*$|pu port             /dev/$port|g" ${HOME}/.minirc.dfl
+        sed -i -e "s|^pu port.*$|pu port             $dev_port|g" ${HOME}/.minirc.dfl
     fi
 
     echo
-- 
1.9.1


