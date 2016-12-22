Return-Path: <jake@udc0866934>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7A5A752AFB
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 14:25:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBMEPaqD011198
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPasV002206
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZms032456;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cK4JL-00044E-FA; Thu, 22 Dec 2016 09:25:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Dec 2016 09:25:26 -0500
Message-ID: <1482416729-15556-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
References: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 5/8] setup-uboot-env-keystone.sh: create minicom script to update board
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

* Create an additional minicom script to update/flash NAND (ubifs) and
  NOR (uboot) on the board.
* Retain the old setup script so that users may manually pass this to
  minicom to setup the board.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-keystone.sh | 100 ++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 55 deletions(-)

diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index 0ec6e8e..2c28430 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -235,13 +235,14 @@ check_for_board() {
 }
 
 echo "timeout 1800" > $cwd/setupBoard.minicom
+echo "timeout 1800" > $cwd/updateBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
-do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+echo "verbose on" >> $cwd/updateBoard.minicom
+
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 
-# Disable upgrading major U-boot versions
-#if [ "$ubootupdate" != "y" ]; then
-	# If not updating U-Boot, refure to procede if running an old MCSDK version.
-	cat >> $cwd/setupBoard.minicom << __EOF__
+# If U-Boot was not updated, refuse to proceed.
+cat >> $cwd/setupBoard.minicom << __EOF__
 expect {
     "$prompt"
     "# " goto uboot_update_required
@@ -249,76 +250,65 @@ expect {
 }
 send " "
 __EOF__
-#fi
 
 # Reset to the default environment
-do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+
 do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
 # Reset incase any variables are set when u-boot initializes
 do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
-# Set vars required to flash u-boot
-do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
-
-if [ "$ubootupdate" = "y" ]; then
-	# Use common "burn_uboot" command
-	do_expect "\"$prompt\"" "send \"if test -n \$burn_uboot_spi; then setenv burn_uboot \$burn_uboot_spi; fi\"" $cwd/setupBoard.minicom
-
-	# Create command to print a known message if u-boot update succeeds
-	update_uboot_success="U-Boot successfully updated"
+# Set up the U-Boot environment
+do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv nfs_root '$rootpath'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 
-	# Create command to fetch and flash u-boot
-	do_expect "\"$prompt\"" "send \"setenv update_uboot 'if run get_uboot_net burn_uboot; then echo $update_uboot_success; else echo U-boot update failed!; fi'\"" $cwd/setupBoard.minicom
-	do_expect "\"$prompt\"" "send \"run update_uboot\"" $cwd/setupBoard.minicom
-
-	do_expect "\"$update_uboot_success\"" "send \"reset\"" $cwd/setupBoard.minicom
-
-	# Reset once to get new u-boot
-	do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
-
-	# Reset environment to the new U-Boot's defaults
-	do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-	do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+# Create command to fetch and flash u-boot and ubi
+#
+# TBD: Save minicom output to a log and use these strings to determine the
+#      update status on the host machine.
+#
+update_uboot_status="U-Boot update:"
+update_ubi_status="UBI update:"
 
-	# Reset a second time incase any variables are set when u-boot initializes
-	do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
-	do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv update_uboot 'if run get_uboot_net burn_uboot_spi; then echo $update_uboot_status SUCCESS; else echo $update_uboot_status FAILED; fi'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv update_ubi 'if run get_ubi_net burn_ubi; then echo $update_ubi_status SUCCESS; else echo $update_ubi_status FAILED; fi'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 
-	# Reinitialize any variables previously set
-	do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-	do_expect "\"$prompt\"" "send setenv tftp_root '$tftproot'" $cwd/setupBoard.minicom
-	do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
+if [ "$secondary_boot" -eq "1" ]; then
+	#TFTP and NFS Boot
+	do_expect "\"$prompt\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+else
+	#SD and NFS Boot
+	do_expect "\"$prompt\"" "send \"setenv boot ubi\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 fi
 
-do_expect "\"$prompt\"" "send setenv nfs_root '$rootpath'" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 
+if [ "$ubootupdate" = "y" ]; then
+    do_expect "\"$prompt\"" "send \"run update_uboot\"" $cwd/updateBoard.minicom
+fi
 if [ "$ubifsupdate" = "y" ]; then
-    do_expect "\"$prompt\"" "send \"run get_ubi_net\"" $cwd/setupBoard.minicom
-    do_expect "\"$prompt\"" "send \"run burn_ubi\"" $cwd/setupBoard.minicom
+    do_expect "\"$prompt\"" "send \"run update_ubi\"" $cwd/updateBoard.minicom
 fi
 
-if [ "$secondary_boot" -eq "1" ]; then
-    #TFTP and NFS Boot
-    do_expect "\"$prompt\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom
-else
-    #UBI Boot
-    do_expect "\"$prompt\"" "send \"setenv boot ubi\"" $cwd/setupBoard.minicom
-fi
-
-do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
 
 cat >> $cwd/setupBoard.minicom << __EOF__
 goto end
 uboot_update_required:
-send echo; echo "*** U-boot is require to be updated before proceding!"; echo "*** The automatic upgrade of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
+send echo; echo "*** U-boot is require to be updated before proceeding!"; echo "*** The automatic upgrade of this version of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
+end:
+__EOF__
+
+cat >> $cwd/updateBoard.minicom << __EOF__
+goto end
+uboot_update_required:
+send echo; echo "*** U-boot is require to be updated before proceeding!"; echo "*** The automatic upgrade of this version of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
 end:
 __EOF__
 #echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
@@ -442,7 +432,7 @@ if [ "$minicom" = "y" ]; then
 
     if [ "$minicomsetup" = "y" ]; then
       cd $cwd
-      sudo minicom -w -S setupBoard.minicom
+      sudo minicom -w -S updateBoard.minicom
       cd -
     fi
 
-- 
1.9.1


