Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0191752AC5
	for <meta-arago@arago-project.org>;
	Fri,  4 Dec 2015 15:01:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4F1Ffq008505
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:15 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1FXb001149
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 09:01:14 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1E4v012980;
	Fri, 4 Dec 2015 09:01:15 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1a4rrG-0001eN-QY; Fri, 04 Dec 2015 10:01:14 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Dec 2015 10:01:08 -0500
Message-ID: <1449241270-6294-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
References: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 3/5] setup-uboot-env-keystone: Add error checking to u-boot update
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

* Also refuse to proceed if not upgrading update from MCSDK

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-keystone.sh | 74 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index b709cd6..750b8cf 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -215,26 +215,67 @@ check_for_board() {
 echo "timeout 1800" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+
+if [ "$ubootupdate" != "y" ]; then
+	# If not updating U-Boot, refure to procede if running an old MCSDK version.
+	cat >> $cwd/setupBoard.minicom << '__EOF__'
+expect {
+    "U-Boot#"
+    "# " goto uboot_update_required
+    timeout 60 goto end
+}
+send " "
+__EOF__
+fi
+
+# Reset to the default environment
+do_expect "\"# \"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"# \"" "send \"saveenv\"" $cwd/setupBoard.minicom
+
+# Reset incase any variables are set when u-boot initializes
+do_expect "\"# \"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
-do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send setenv tftp_root '$tftproot'" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send setenv nfs_root '$rootpath'" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
-do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+# Set vars required to flash u-boot
+do_expect "\"# \"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+do_expect "\"# \"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom
+do_expect "\"# \"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
 
 if [ "$ubootupdate" = "y" ]; then
-	do_expect "\"U-Boot#\"" "send \"run get_uboot_net\"" $cwd/setupBoard.minicom
-	do_expect "\"U-Boot#\"" "send \"run burn_uboot_spi\"" $cwd/setupBoard.minicom
+	# Use common "burn_uboot" command
+	do_expect "\"# \"" "send \"if test -n \$burn_uboot_spi; then setenv burn_uboot \$burn_uboot_spi; fi\"" $cwd/setupBoard.minicom
+
+	# Create command to print a known message if u-boot update succeeds
+	update_uboot_success="U-Boot successfully updated"
+
+	# Create command to fetch and flash u-boot
+	do_expect "\"# \"" "send \"setenv update_uboot 'if run get_uboot_net burn_uboot; then echo $update_uboot_success; else echo U-boot update failed!; fi'\"" $cwd/setupBoard.minicom
+	do_expect "\"# \"" "send \"run update_uboot\"" $cwd/setupBoard.minicom
+
+	do_expect "\"$update_uboot_success\"" "send \"reset\"" $cwd/setupBoard.minicom
+
+	# Reset once to get new u-boot
+	do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
+	# Reset environment to the new U-Boot's defaults
+	do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+	do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+
+	# Reset a second time incase any variables are set when u-boot initializes
 	do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
 	do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
+	# Reinitialize any variables previously set
+	do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+	do_expect "\"U-Boot#\"" "send setenv tftp_root '$tftproot'" $cwd/setupBoard.minicom
+	do_expect "\"U-Boot#\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
 fi
 
+do_expect "\"U-Boot#\"" "send setenv nfs_root '$rootpath'" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+
 if [ "$secondary_boot" -eq "1" ]; then
 	#TFTP and NFS Boot
 	do_expect "\"U-Boot#\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom
@@ -248,8 +289,13 @@ fi
 do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
 
-echo "end:" >> $cwd/setupBoard.minicom
-echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
+cat >> $cwd/setupBoard.minicom << __EOF__
+goto end
+uboot_update_required:
+send echo; echo "*** U-boot is require to be updated before proceding!"; echo "*** Please re-run setup.sh and choose to update U-boot."; echo
+end:
+__EOF__
+#echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
 
 echo "--------------------------------------------------------------------------------"
 echo "Would you like to create a minicom script with the above parameters (y/n)?"
-- 
1.9.1


