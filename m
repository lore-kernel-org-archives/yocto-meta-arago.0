Return-Path: <jake@udc0866934>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9F29452B00
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 14:25:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBMEPaeQ009004
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPaId002246
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Dec 2016 08:25:36 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPaZ4032481;
	Thu, 22 Dec 2016 08:25:36 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cK4JM-00044U-1l; Thu, 22 Dec 2016 09:25:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Dec 2016 09:25:29 -0500
Message-ID: <1482416729-15556-9-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
References: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 8/8] setup-uboot-env-keystone: use UART boot to boot latest version of U-Boot
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
X-List-Received-Date: Thu, 22 Dec 2016 14:25:44 -0000
Content-Type: text/plain

* Configure keystone boards to boot the packaged version of U-Boot
  over UART
* During the UART boot, configure the U-Boot environment and
  optionally update the U-Boot version flashed to NOR and/or the UBI
  filesystem flashed to NAND.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-keystone.sh | 67 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 7 deletions(-)

diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index 2c28430..37fb2c1 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -126,6 +126,29 @@ copy_to_tftproot() {
     done
 }
 
+# Create the BMC scripts. These require no configuration from the user.
+create_bmc_scripts() {
+    ( echo "timeout 300"; echo; ) > $cwd/bmcUartBoot.minicom
+    ( echo "timeout 300"; echo; ) > $cwd/bmcSpiBoot.minicom
+
+    # Allow time for XMODEM transfer to begin
+    echo "! sleep 1" >> $cwd/bmcUartBoot.minicom
+
+    ( echo "send \" \""; echo; ) >> $cwd/bmcUartBoot.minicom
+    ( echo "send \" \""; echo; ) >> $cwd/bmcSpiBoot.minicom
+
+    do_expect "\"BMC>\"" "send \"bootmode #4\"" $cwd/bmcUartBoot.minicom
+    do_expect "\"BMC>\"" "send \"bootmode #2\"" $cwd/bmcSpiBoot.minicom
+
+    do_expect "\"BMC>\"" "send \"reboot\"" $cwd/bmcUartBoot.minicom $cwd/bmcSpiBoot.minicom
+
+    echo "end:" >> $cwd/bmcUartBoot.minicom
+    echo "end:" >> $cwd/bmcSpiBoot.minicom
+
+    # bmcUartboot.minicom will be killed by the updateUboot.minicom script
+    echo "! killall -s SIGHUP minicom" >> $cwd/bmcSpiBoot.minicom
+}
+
 echo
 echo "--------------------------------------------------------------------------------"
 echo "This step will set up the u-boot variables for booting the EVM."
@@ -156,7 +179,10 @@ kernelimage="zImage-""$platform"".bin"
 kernelimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$kernelimage`
 kernelimagedefault=`basename $kernelimagesrc`
 
-ubootimage="u-boot-spi-${platform}.gph"
+ubootimage="u-boot-${platform}.img"
+ubootimagesrc=`readlink -m $cwd/../board-support/prebuilt-images/$ubootimage`
+
+ubootspiimage="u-boot-spi-${platform}.gph"
 
 ubifsimage="tisdk-server-rootfs-image-${platform}.ubi"
 ubifsimagesrc=`ls -1 $cwd/../filesystem/$ubifsimage`
@@ -263,7 +289,7 @@ do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 # Set up the U-Boot environment
 do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootspiimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv nfs_root '$rootpath'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
@@ -296,7 +322,8 @@ if [ "$ubifsupdate" = "y" ]; then
     do_expect "\"$prompt\"" "send \"run update_ubi\"" $cwd/updateBoard.minicom
 fi
 
-do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \" \"" $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 
 cat >> $cwd/setupBoard.minicom << __EOF__
 goto end
@@ -311,7 +338,7 @@ uboot_update_required:
 send echo; echo "*** U-boot is require to be updated before proceeding!"; echo "*** The automatic upgrade of this version of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
 end:
 __EOF__
-#echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
+echo "! killall -s SIGHUP minicom" >> $cwd/updateBoard.minicom
 
 echo "--------------------------------------------------------------------------------"
 prompt_feedback "Would you like to create a minicom script with the above parameters?" minicom y y n
@@ -420,8 +447,9 @@ if [ "$minicom" = "y" ]; then
     echo "Would you like to run the setup script now (y/n)?"
     echo
     echo "Please connect the ethernet cable as described in the Quick Start Guide."
-    echo "Once answering 'y' on the prompt below, you will have 300 seconds to connect"
-    echo "the board and power cycle it before the setup times out"
+    echo "Once answering 'y' on the prompt below, the script will proceed with"
+    echo "automatically booting and configuring the board based on the responses"
+    echo "provided."
     echo
     echo "After successfully executing this script, your EVM will be set up. You will be "
     echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
@@ -431,8 +459,33 @@ if [ "$minicom" = "y" ]; then
     prompt_feedback "" minicomsetup y
 
     if [ "$minicomsetup" = "y" ]; then
+      create_bmc_scripts
+
       cd $cwd
-      sudo minicom -w -S updateBoard.minicom
+
+      tmp_fifo="$PWD/uart_boot_fifo"
+
+      rm "$tmp_fifo"
+      mkfifo "$tmp_fifo"
+
+      # stripping U-Boot img header and piping to fifo
+      (dd bs=64 count=1 of=/dev/null; dd bs=512k) < "$ubootimagesrc" > "$tmp_fifo" &
+
+      # Configuring bootmode to UART boot via BMC
+      screen -dmS minicom_${platform}_bmc minicom -D "$dev_bmc_port" -S bmcUartBoot.minicom -C bmcUartBoot.log
+
+      # Transfering uboot.bin using XMODEM protocol
+      sx -kb "$tmp_fifo" < "$dev_uart_port" > "$dev_uart_port"
+
+      # Configure U-Boot environment and optionally flash board
+      minicom -D "$dev_uart_port" -S updateBoard.minicom -C updateBoard.log
+      rm "$tmp_fifo"
+
+      # Configuring bootmode to SPI boot via BMC
+      minicom -D "$dev_bmc_port" -S bmcSpiBoot.minicom -C bmcSpiBoot.log
+
+      # Running terminal to board (UART)
+      minicom -w -D "$dev_uart_port" -C bootBoard.log
       cd -
     fi
 
-- 
1.9.1


