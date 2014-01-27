Return-Path: <eyalreizer@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by arago-project.org (Postfix) with ESMTPS id 8A2B85298A
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 10:11:05 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id z12so5350159wgg.30
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 02:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pePDYr7YKBtYKy2ptpyAqZAXWuE+8GUExgy6OZ/BIks=;
	b=0Wu3sHtjnCGoci8FVNNRBL88w86YvyAEe/DTGqOPC6NksdTkO1Idr6cmcXy7cOS5CO
	M/B3ZLbcnqKzT1bN3nGbtRYbiNQQj8qc4/1HRHEWJP8EuRLYRMMYo7zvOmKh0mguh/k0
	cLWJnC9hChefx24HMlcxzfGbyDaRO6KdO73y2lvZw4VECzs7PUSZ9s+hes5z+s45V/0V
	CS9kegk2jfbXqOxQeysUCF/7m293JWIAjbe9NUlf4B5cuHjVCJq6rbSfILp3onOx5iEq
	KtHeR533S2b5ljdfliJ5SFWX1BT16mR2CweRwW1DxDsGTT+xLki5VCcVahaUgMTVVGfm
	jarw==
X-Received: by 10.180.90.37 with SMTP id bt5mr11444192wib.43.1390817462269;
	Mon, 27 Jan 2014 02:11:02 -0800 (PST)
Received: from localhost.localdomain (93-172-91-221.bb.netvision.net.il.
	[93.172.91.221]) by mx.google.com with ESMTPSA id
	k10sm23991692wjf.11.2014.01.27.02.10.59 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Jan 2014 02:11:01 -0800 (PST)
From: Eyal Reizer <eyalreizer@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 27 Jan 2014 12:10:47 +0200
Message-Id: <1390817447-2951-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] ti-connectivity/uim: Add Usermode Init Mgr for TI Wilink Shared Transport
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
X-List-Received-Date: Mon, 27 Jan 2014 10:11:06 -0000

From: Roger Monk <r-monk@ti.com>

   * New recipe pulling latest git version
   * Patched to allow sysfs node to be passed via command line argument
   * UIM Daemon plumbed to rcS.S03

Signed-off-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...mand-line-args-for-passing-sysfs-node-pat.patch |  135 ++++++++++++++++++++
 .../recipes-connectivity/uim/files/uim-sysfs       |   33 +++++
 .../recipes-connectivity/uim/uim_git.bb            |   25 ++++
 3 files changed, 193 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch
 create mode 100755 meta-arago-extras/recipes-connectivity/uim/files/uim-sysfs
 create mode 100644 meta-arago-extras/recipes-connectivity/uim/uim_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch b/meta-arago-extras/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch
new file mode 100644
index 0000000..ad6f95f
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch
@@ -0,0 +1,135 @@
+From 0df5f6766722a844162e96777980feee146a3c86 Mon Sep 17 00:00:00 2001
+From: Roger Monk <r-monk@ti.com>
+Date: Tue, 1 Oct 2013 17:17:25 +0100
+Subject: [PATCH] uim:  Add command line args for passing sysfs node path
+
+   * pass -f <sysfs path> and/or -b <bd address>
+   * re-mapped DEFINEs to strings
+      * minimal code changes for minimal instrusion
+      * could be rewritten for cleaner implementation in the future
+   * default path (no args) remains the same
+   * users passing bd address via uim <addr> will need to add -b
+
+Signed-off-by: Roger Monk <r-monk@ti.com>
+---
+ uim.c |   61 +++++++++++++++++++++++++++++++++++++++++++++++++++++--------
+ uim.h |   10 +++++-----
+ 2 files changed, 58 insertions(+), 13 deletions(-)
+
+diff --git a/uim.c b/uim.c
+index 3775dda..4dfdbd7 100644
+--- a/uim.c
++++ b/uim.c
+@@ -38,6 +38,11 @@ static int exiting;
+ static int line_discipline;
+ static int dev_fd;
+ 
++static char install_sysfs_entry[48];
++static char dev_name_sysfs[48];
++static char baud_rate_sysfs[48];
++static char flow_cntrl_sysfs[48];
++
+ /* BD address as string and a pointer to array of hex bytes */
+ char uim_bd_address[BD_ADDR_LEN];
+ bdaddr_t *bd_addr;
+@@ -455,9 +460,17 @@ bdaddr_t *strtoba(const char *str)
+         return (bdaddr_t *) ba;
+ }
+ 
++void usage(void)
++{
++	UIM_ERR("Invalid arguments");
++	UIM_ERR("Usage: uim [ -f <path-to-sysfs-kim> ] [ -b <bd address XX:XX:XX:XX:XX:XX> ]");
++}
++
+ /*****************************************************************************/
+ int main(int argc, char *argv[])
+ {
++	int opt;
++	char *arg_kim_path = NULL, *arg_bd_addr = NULL, *temp_path = KIM_SYSFS_BASE;
+ 	int st_fd, err;
+ 	unsigned char install;
+ 	struct pollfd 	p;
+@@ -466,18 +479,50 @@ int main(int argc, char *argv[])
+ 	err = 0;
+ 
+ 	/* Parse the user input */
+-	if ((argc > 2)) {
+-		UIM_ERR("Invalid arguements");
+-		UIM_ERR("Usage: uim <bd address>");
+-		return -1;
++	while ((opt = getopt (argc, argv, "f:b:")) != -1) {
++		switch (opt) {
++			case 'f':
++				arg_kim_path = optarg;
++				break;
++			case 'b':
++				arg_bd_addr = optarg;
++				break;
++			default:
++				usage();
++				return -1;
++		}
++	}
++
++	if (arg_kim_path != NULL) {
++		temp_path = arg_kim_path;
++		if( strlen(temp_path) > (sizeof(install_sysfs_entry)-10) ) {
++			UIM_ERR("Path to sysfs node too long");
++			return -1;
++		}
+ 	}
+-	if (argc == 2) {
+-		if (strlen(argv[2]) != BD_ADDR_LEN) {
+-			UIM_ERR("Usage: uim XX:XX:XX:XX:XX:XX");
++	strcpy(install_sysfs_entry, temp_path);
++	strcpy(dev_name_sysfs, temp_path);
++	strcpy(baud_rate_sysfs, temp_path);
++	strcpy(flow_cntrl_sysfs, temp_path);
++
++	strcat(install_sysfs_entry, "/install");
++	strcat(dev_name_sysfs, "/dev_name");
++	strcat(baud_rate_sysfs, "/baud_rate");
++	strcat(flow_cntrl_sysfs, "/flow_cntrl");
++
++	UIM_DBG("install = %s", install_sysfs_entry);
++	UIM_DBG("dev_name = %s", dev_name_sysfs);
++	UIM_DBG("baud_rate = %s", baud_rate_sysfs);
++	UIM_DBG("flow_cntrl = %s", flow_cntrl_sysfs);
++
++	if (arg_bd_addr != NULL) {
++		if (strlen(arg_bd_addr) != BD_ADDR_LEN) {
++			usage();
+ 			return -1;
+ 		}
++		UIM_DBG("Address = %s", arg_bd_addr);
+ 		/* BD address passed as string in xx:xx:xx:xx:xx:xx format */
+-		strncpy(uim_bd_address, argv[2], sizeof(uim_bd_address));
++		strncpy(uim_bd_address, arg_bd_addr, sizeof(uim_bd_address));
+ 		bd_addr = strtoba(uim_bd_address);
+ 	}
+ 
+diff --git a/uim.h b/uim.h
+index a8ef699..32a8fe0 100644
+--- a/uim.h
++++ b/uim.h
+@@ -65,11 +65,11 @@
+ /* the sysfs entries with device configuration set by
+  * shared transport driver
+  */
+-#define INSTALL_SYSFS_ENTRY "/sys/devices/platform/kim/install"
+-#define DEV_NAME_SYSFS "/sys/devices/platform/kim/dev_name"
+-#define BAUD_RATE_SYSFS "/sys/devices/platform/kim/baud_rate"
+-#define FLOW_CTRL_SYSFS "/sys/devices/platform/kim/flow_cntrl"
+-
++#define KIM_SYSFS_BASE		"/sys/devices/platform/kim"
++#define INSTALL_SYSFS_ENTRY	install_sysfs_entry
++#define DEV_NAME_SYSFS		dev_name_sysfs
++#define BAUD_RATE_SYSFS		baud_rate_sysfs
++#define FLOW_CTRL_SYSFS		flow_cntrl_sysfs
+ 
+ #define VERBOSE
+ /*Debug logs*/
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-connectivity/uim/files/uim-sysfs b/meta-arago-extras/recipes-connectivity/uim/files/uim-sysfs
new file mode 100755
index 0000000..0891768
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/uim/files/uim-sysfs
@@ -0,0 +1,33 @@
+#! /bin/sh
+
+NODE=`cd /sys; find . | grep kim | grep install`
+if [ $NODE ]
+then
+    echo UIM SYSFS Node Found at /sys/$NODE
+else
+    echo UIM SYSFS Node Not Found 
+    exit 0
+fi 
+
+uim="/usr/bin/uim"
+uim_args="-f `dirname /sys/$NODE`"
+
+test -x "$uim" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting uim-sysfs daemon"
+    start-stop-daemon --start --quiet --pidfile /var/run/uim.pid --make-pidfile --exec $uim -- $uim_args & 
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping uim-sysfs daemon"
+    start-stop-daemon --stop --quiet --pidfile /var/run/uim.pid
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/uim-sysfs.sh {start|stop}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-connectivity/uim/uim_git.bb b/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
new file mode 100644
index 0000000..5b28884
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Shared Transport Line Discipline User Mode initialisation Manager Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://uim.c;beginline=1;endline=18;md5=9f0bbfbc10c67689e81a523e2976c31e"
+
+PR ="r1"
+PR_append = "+gitr${SRCPV}"
+
+SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
+SRC_URI = "git://gitorious.org/uim/uim.git \
+	   file://0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch \
+	   file://uim-sysfs \
+"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+
+do_install() {
+        install -d ${D}${bindir}
+        install -m 0755 uim ${D}${bindir}
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/uim-sysfs ${D}${sysconfdir}/init.d
+	install -d ${D}${sysconfdir}/rcS.d
+	ln -sf  ../init.d/uim-sysfs ${D}${sysconfdir}/rcS.d/S03uim-sysfs
+}
-- 
1.7.0.4


