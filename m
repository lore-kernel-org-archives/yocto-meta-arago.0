Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0F39752A81
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:59:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99Nx4wi000698
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99Nx4dR016506
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:59:04 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99Nx3JW012667	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:59:03 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0vk37013707	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:46 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0vkOK013706	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:46 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:38 +0100
Message-ID: <1381366658-13630-12-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366658-13630-1-git-send-email-r-monk@ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] ti-connectivity/uim: Add Usermode Init Mgr for TI Wilink Shared Transport
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
X-List-Received-Date: Wed, 09 Oct 2013 23:59:05 -0000
Content-Type: text/plain

   * New recipe pulling latest git version
   * Patched to allow sysfs node to be passed via command line argument
   * UIM Daemon plumbed to rcS.S03

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 ...mand-line-args-for-passing-sysfs-node-pat.patch |  135 ++++++++++++++++++++
 .../recipes-connectivity/uim/files/uim-sysfs       |   34 +++++
 .../recipes-connectivity/uim/uim_git.bb            |   28 ++++
 3 files changed, 197 insertions(+)
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
index 0000000..44b95c6
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/uim/files/uim-sysfs
@@ -0,0 +1,34 @@
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
+
diff --git a/meta-arago-extras/recipes-connectivity/uim/uim_git.bb b/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
new file mode 100644
index 0000000..7f3203f
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/uim/uim_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Shared Transport Line Discipline User Mode initialisation Manager Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://uim.c;beginline=1;endline=18;md5=9f0bbfbc10c67689e81a523e2976c31e"
+
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+PR ="r1"
+PR_append = "+gitr${SRCPV}"
+
+SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
+SRC_URI = "git://gitorious.org/uim/uim.git \
+           file://0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch \
+           file://uim-sysfs \
+"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+
+do_install() {
+        install -d ${D}${bindir}
+        install -m 0755 uim ${D}${bindir}
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/uim-sysfs ${D}${sysconfdir}/init.d
+        install -d ${D}${sysconfdir}/rcS.d
+        ln -sf  ../init.d/uim-sysfs ${D}${sysconfdir}/rcS.d/S03uim-sysfs
+}
+
-- 
1.7.9.5


