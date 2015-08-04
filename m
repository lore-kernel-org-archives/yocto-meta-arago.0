Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8904C52991
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 16:13:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74GDDpZ019857
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 11:13:13 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74GDDdq021077
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 11:13:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 11:13:13 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74GDDPn029552;
	Tue, 4 Aug 2015 11:13:13 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMeq0-0005Zn-W1; Tue, 04 Aug 2015 12:13:13 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 12:13:05 -0400
Message-ID: <1438704785-21392-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438704785-21392-1-git-send-email-j-stiffler@ti.com>
References: <1438704785-21392-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 3/3] setup-uboot-env-am57xx-evm: Detect USB serial connection.
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
X-List-Received-Date: Tue, 04 Aug 2015 16:13:15 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-minicom.sh              |  1 +
 setup-uboot-env-am57xx-evm.sh | 85 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 81 insertions(+), 5 deletions(-)

diff --git a/setup-minicom.sh b/setup-minicom.sh
index 893e307..aa18dd4 100644
--- a/setup-minicom.sh
+++ b/setup-minicom.sh
@@ -47,6 +47,7 @@ For boards that contain a USB-to-Serial converter on the board such as:
 	* BeagleBone
 	* Beaglebone Black
 	* AM335x EVM-SK
+        * AM57xx EVM
 
 the port used for minicom will be automatically detected. By default Ubuntu
 will not recognize this device. Setup will add a udev rule to
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index 5beee26..f1dcc3d 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -119,6 +119,16 @@ if [ "$kernel" -eq "1" ]; then
     fi
 fi
 
+board="unknown"
+check_for_board() {
+    lsusb -vv -d 0403:6001 > /dev/null 2>&1
+
+    if [ "$?" = "0" ]
+    then
+        board="x15"
+    fi
+}
+
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
@@ -186,11 +196,76 @@ if [ "$minicom" = "y" ]; then
     echo -n "Successfully wrote "
     readlink -m $cwd/setupBoard.minicom
 
-    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
-    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
-    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
-    echo "you will have 300 seconds to connect the board and power cycle it"
-    echo "before the setup times out"
+    while [ yes ]
+    do
+        check_for_board
+
+        if [ "$board" = "x15" ]
+        then
+            break
+        else
+            echo ""
+            echo "Board could not be detected. Please connect the board to the PC."
+            read -p "Press any key to try checking again." temp
+        fi
+    done
+
+    if [ "$board" != "unknown" ]
+    then
+        ftdiInstalled=`lsmod | grep ftdi_sio`
+        if [ -z "$ftdiInstalled" ]
+        then
+            sudo modprobe -q ftdi_sio
+        fi
+
+        while [ yes ]
+        do
+            echo ""
+            echo -n "Detecting connection to board... "
+            loopCount=0
+            port=`dmesg | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            while [ -z "$port" ] && [ "$loopCount" -ne "10" ]
+            do
+                #count to 10 and timeout if no connection is found
+                loopCount=$((loopCount+1))
+
+                sleep 1
+                port=`dmesg  | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            done
+
+            #check to see if we actually found a port
+            if [ -n "$port" ]; then
+                echo "/dev/$port"
+                break;
+            fi
+
+            #if we didn't find a port and reached the timeout limit then ask to reconnect
+            if [ -z "$port" ] && [ "$loopCount" = "10" ]; then
+                echo ""
+                echo "Unable to detect which port the board is connected to."
+                echo "Please reconnect your board."
+                echo "Press 'y' to attempt to detect your board again or press 'n' to continue..."
+                read -p "(y/n)" retryBoardDetection
+            fi
+
+            #if they choose not to retry, ask user to reboot manually and exit
+            if [ "$retryBoardDetection" = "n" ]; then
+                echo ""
+                echo "Please reboot your board manually and connect using minicom."
+                exit;
+            fi
+        done
+
+        sed -i -e "s|^pu port.*$|pu port             /dev/$port|g" ${HOME}/.minirc.dfl
+    fi
+
+    echo
+    echo "--------------------------------------------------------------------------------"
+    echo "Would you like to run the setup script now (y/n)?"
+    echo
+    echo "Please connect the ethernet cable as described in the Quick Start Guide."
+    echo "Once answering 'y' on the prompt below, you will have 300 seconds to connect"
+    echo "the board and power cycle it before the setup times out"
     echo
     echo "After successfully executing this script, your EVM will be set up. You will be "
     echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
-- 
1.9.1


