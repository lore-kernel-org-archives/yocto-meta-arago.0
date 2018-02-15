Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2AB30529AB
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 17:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E74202017C;
	Thu, 15 Feb 2018 17:13:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id tQlSrep1RW-J; Thu, 15 Feb 2018 17:13:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 975A220AA4;
	Thu, 15 Feb 2018 17:13:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1E8B51632A9;
	Thu, 15 Feb 2018 12:13:35 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Feb 2018 12:13:24 -0500
Message-Id: <1518714813-23100-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518714813-23100-1-git-send-email-denys@ti.com>
References: <1518714813-23100-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 03/12] kexec: upstream has latest kexec-tools now, drop locally
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
X-List-Received-Date: Thu, 15 Feb 2018 17:13:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/kexec/kexec-tools/kdump         | 163 ---------------------
 .../recipes-kernel/kexec/kexec-tools/kdump.conf    |  18 ---
 .../recipes-kernel/kexec/kexec-tools_2.0.14.bb     |  40 -----
 3 files changed, 221 deletions(-)
 delete mode 100755 meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump
 delete mode 100644 meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump.conf
 delete mode 100644 meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.14.bb

diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump b/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump
deleted file mode 100755
index 3fb133f..0000000
--- a/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump
+++ /dev/null
@@ -1,163 +0,0 @@
-#! /bin/sh
-#
-#  kdump
-#
-#  Description: The kdump script provides the support:
-#		1. Load a kdump kernel image into memory;
-#		2. Copy away vmcore when system panic.
-#
-
-#default
-KDUMP_KVER="`uname -r`"
-KDUMP_KIMAGE="/boot/bzImage-${KDUMP_KVER}"
-KDUMP_CMDLINE="`cat /proc/cmdline`"
-KDUMP_CMDLINE_APPEND="kdump_needed maxcpus=1 irqpoll reset_devices"
-KDUMP_VMCORE_PATH="/var/crash/`date +"%Y-%m-%d"`"
-
-#get right kernel image
-march="`uname -m`"
-case ${march} in
-	x86*|i?86)
-		;;
-		*)
-		KDUMP_KIMAGE="/boot/uImage-${KDUMP_KVER}"
-		;;
-esac
-
-KEXEC=usr/sbin/kexec
-KEXEC_ARGS="-p"
-
-MAKEDUMPFILE=/usr/bin/makedumpfile
-MAKEDUMPFILE_ARGS="-E -d 1"
-
-LOGGER="logger -p info -t kdump"
-
-if [ -f /etc/sysconfig/kdump.conf ]; then
-	. /etc/sysconfig/kdump.conf
-fi
-
-do_check()
-{
-	#check makedumpfile
-	if [ ! -e ${MAKEDUMPFILE} -o ! -x ${MAKEDUMPFILE} ] ;then
-		echo "No makedumpfile found."
-		return 1;
-	fi
-
-	#check kexec
-	if [ ! -e ${KEXEC} -o ! -x ${KEXEC} ] ;then
-		echo "No kexec found."
-		return 1;
-	fi
-
-	#check whether kdump kernel image exists on the system
-	if [ ! -f ${KDUMP_KIMAGE} ]; then
-		echo "No kdump kernel image found."
-		return 1
-	fi
-}
-
-do_save_vmcore()
-{
-	mkdir -p ${KDUMP_VMCORE_PATH}
-	echo "Saving a vmcore to ${KDUMP_VMCORE_PATH}."
-
-	${MAKEDUMPFILE} ${MAKEDUMPFILE_ARGS} /proc/vmcore ${KDUMP_VMCORE_PATH}/vmcore-"`date +"%H:%M:%S"`"
-#	cp --sparse=always /proc/vmcore ${KDUMP_VMCORE_PATH}/vmcore-"`date +"%H:%M:%S"`"
-	rc=$?
-	if [ ${rc} == 0 ]; then
-		${LOGGER} "Saved a vmcore to ${KDUMP_VMCORE_PATH}."
-	else
-		${LOGGER} "Failed to save vmcore!"
-	fi
-	return ${rc}
-}
-
-do_start()
-{
-	#check file
-	do_check
-
-	#check whether the running kernel supports kdump.
-	if [ ! -e /sys/kernel/kexec_crash_loaded ]; then
-		echo "Kdump isn't supported on the running kernel!!!"
-		${LOGGER} "Kdump isn't supported on the running kernel!!!"
-		return 1
-	fi
-
-	#check whether kdump kernel image has been loaded
-	rc=`cat /sys/kernel/kexec_crash_loaded`
-	if [ ${rc} != 0 ]; then
-		echo "Kdump is already running.";
-		${LOGGER} "Kdump is already running."
-		return 0
-	fi
-
-	#check the running kernel cmdline option,insure "crashkenrel=" always set.
-	grep -q crashkernel= /proc/cmdline
-	if [ $? != 0 ]; then
-		echo "Kdump isn't supported on the running kernel,please check boot option!!!"
-		${LOGGER} "Kdump isn't supported on the running kernel,please check boot option!!!"
-		return 1
-	fi
-
-	#handle kdump cmdline parameters, remove some useless options
-	kcmdline=""
-	for x in `cat /proc/cmdline`; do
-		case $x in
-			crashkernel*)
-				;;
-			*)
-				kcmdline="${kcmdline} $x"
-				;;
-		esac
-	done
-
-	KDUMP_CMDLINE="${kcmdline} ${KDUMP_CMDLINE_APPEND}"
-
-	#Load the kdump kernel image
-	${KEXEC} ${KEXEC_ARGS} "${KDUMP_KIMAGE}" --append="${KDUMP_CMDLINE}"
-	if [ $? != 0 ]; then
-		echo "Failed to load kdump kernel!"
-		${LOGGER} "Failed to load kdump kernel!"
-		return 1
-	fi
-
-	echo "Kdump started up."
-	${LOGGER} "Kdump started up."
-}
-
-do_stop()
-{
-	${KEXEC} -p -u 2>/dev/null
-	if [ $? == 0 ]; then
-		echo "Kdump has been stopped."
-		${LOGGER} "Kdump has been stopped."
-	else
-		echo "Failed to stop kdump!"
-		${LOGGER} "Failed to stop kdump!"
-	fi
-}
-
-case "$1" in
-  start)
-	if [ -s /proc/vmcore ]; then
-		do_save_vmcore
-		reboot
-	else
-		do_start
-	fi
-	;;
- restart)
-	do_stop
-	do_start
-	;;
-  stop)
-	do_stop
-	;;
-   *)
-	echo $"Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump.conf b/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump.conf
deleted file mode 100644
index 42a2435..0000000
--- a/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump.conf
+++ /dev/null
@@ -1,18 +0,0 @@
-#the kdump kernel version string.
-#KDUMP_KVER="`uname -r`"
-
-#this will be passed to the kdump kernel as kdump kernel command line, it
-#usually comes from /proc/cmdline
-#KDUMP_CMDLINE="`cat /proc/cmdline`"
-
-# append arguments to the kdump commandline
-#KDUMP_CMDLINE_APPEND="kdump_needed maxcpus=1 irqpoll reset_devices"
-
-#the kernel image for kdump
-#KDUMP_KIMAGE="/boot/bzImage-${KDUMP_KVER}"
-
-#Where to save the vmcore
-#KDUMP_VMCORE_PATH="/var/crash/`date +"%Y-%m-%d"`"
-
-#the arguments to makedumpfile
-MAKEDUMPFILE_ARGS="--dump-dmesg -x /boot/vmlinux-`uname -r`"
diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.14.bb
deleted file mode 100644
index 9cf5e94..0000000
--- a/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.14.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-require recipes-kernel/kexec/kexec-tools.inc
-export LDFLAGS = "-L${STAGING_LIBDIR}"
-EXTRA_OECONF = " --with-zlib=yes"
-
-S = "${WORKDIR}/git"
-
-PV = "2.0.14"
-
-BRANCH = "master"
-SRCREV = "69291dbef14f02b5b97d44220412b02a9fa7b5eb"
-
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git;protocol=git;branch=${BRANCH}"
-
-SRC_URI += " \
-    file://kdump \
-    file://kdump.conf \
-"
-
-PACKAGES =+ "kexec kdump vmcore-dmesg"
-
-ALLOW_EMPTY_${PN} = "1"
-RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
-
-FILES_kexec = "${sbindir}/kexec"
-FILES_kdump = "${sbindir}/kdump ${sysconfdir}/init.d/kdump \
-               ${sysconfdir}/sysconfig/kdump.conf"
-FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
-
-inherit update-rc.d
-
-INITSCRIPT_PACKAGES = "kdump"
-INITSCRIPT_NAME_kdump = "kdump"
-INITSCRIPT_PARAMS_kdump = "start 56 2 3 4 5 . stop 56 0 1 6 ."
-
-do_install_append () {
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
-        install -d ${D}${sysconfdir}/sysconfig
-        install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
-}
-- 
2.7.4


