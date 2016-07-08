Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 8FF9152975
	for <meta-arago@arago-project.org>;
	Fri,  8 Jul 2016 22:34:48 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA000JDBPD6IC90@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 Jul 2016 17:34:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=VwQbUJbxAAAA:8
	a=zx-GAdwck4han6BJVKMA:9
Received: by 100.15.86.14 with SMTP id 2a0fc5ca; Fri, 08 Jul 2016 22:34:33 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id BCB52162066;	Fri,  8 Jul 2016 18:34:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 Jul 2016 18:34:15 -0400
Message-id: <1468017256-9345-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] kexec-tools: add version from git with latest ARM patches
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
X-List-Received-Date: Fri, 08 Jul 2016 22:34:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/kexec/kexec-tools/kdump         | 163 +++++++++++++++++++++
 .../recipes-kernel/kexec/kexec-tools/kdump.conf    |  18 +++
 .../recipes-kernel/kexec/kexec-tools_2.0.13pre.bb  |  40 +++++
 3 files changed, 221 insertions(+)
 create mode 100755 meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump
 create mode 100644 meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump.conf
 create mode 100644 meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.13pre.bb

diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump b/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump
new file mode 100755
index 0000000..3fb133f
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump
@@ -0,0 +1,163 @@
+#! /bin/sh
+#
+#  kdump
+#
+#  Description: The kdump script provides the support:
+#		1. Load a kdump kernel image into memory;
+#		2. Copy away vmcore when system panic.
+#
+
+#default
+KDUMP_KVER="`uname -r`"
+KDUMP_KIMAGE="/boot/bzImage-${KDUMP_KVER}"
+KDUMP_CMDLINE="`cat /proc/cmdline`"
+KDUMP_CMDLINE_APPEND="kdump_needed maxcpus=1 irqpoll reset_devices"
+KDUMP_VMCORE_PATH="/var/crash/`date +"%Y-%m-%d"`"
+
+#get right kernel image
+march="`uname -m`"
+case ${march} in
+	x86*|i?86)
+		;;
+		*)
+		KDUMP_KIMAGE="/boot/uImage-${KDUMP_KVER}"
+		;;
+esac
+
+KEXEC=usr/sbin/kexec
+KEXEC_ARGS="-p"
+
+MAKEDUMPFILE=/usr/bin/makedumpfile
+MAKEDUMPFILE_ARGS="-E -d 1"
+
+LOGGER="logger -p info -t kdump"
+
+if [ -f /etc/sysconfig/kdump.conf ]; then
+	. /etc/sysconfig/kdump.conf
+fi
+
+do_check()
+{
+	#check makedumpfile
+	if [ ! -e ${MAKEDUMPFILE} -o ! -x ${MAKEDUMPFILE} ] ;then
+		echo "No makedumpfile found."
+		return 1;
+	fi
+
+	#check kexec
+	if [ ! -e ${KEXEC} -o ! -x ${KEXEC} ] ;then
+		echo "No kexec found."
+		return 1;
+	fi
+
+	#check whether kdump kernel image exists on the system
+	if [ ! -f ${KDUMP_KIMAGE} ]; then
+		echo "No kdump kernel image found."
+		return 1
+	fi
+}
+
+do_save_vmcore()
+{
+	mkdir -p ${KDUMP_VMCORE_PATH}
+	echo "Saving a vmcore to ${KDUMP_VMCORE_PATH}."
+
+	${MAKEDUMPFILE} ${MAKEDUMPFILE_ARGS} /proc/vmcore ${KDUMP_VMCORE_PATH}/vmcore-"`date +"%H:%M:%S"`"
+#	cp --sparse=always /proc/vmcore ${KDUMP_VMCORE_PATH}/vmcore-"`date +"%H:%M:%S"`"
+	rc=$?
+	if [ ${rc} == 0 ]; then
+		${LOGGER} "Saved a vmcore to ${KDUMP_VMCORE_PATH}."
+	else
+		${LOGGER} "Failed to save vmcore!"
+	fi
+	return ${rc}
+}
+
+do_start()
+{
+	#check file
+	do_check
+
+	#check whether the running kernel supports kdump.
+	if [ ! -e /sys/kernel/kexec_crash_loaded ]; then
+		echo "Kdump isn't supported on the running kernel!!!"
+		${LOGGER} "Kdump isn't supported on the running kernel!!!"
+		return 1
+	fi
+
+	#check whether kdump kernel image has been loaded
+	rc=`cat /sys/kernel/kexec_crash_loaded`
+	if [ ${rc} != 0 ]; then
+		echo "Kdump is already running.";
+		${LOGGER} "Kdump is already running."
+		return 0
+	fi
+
+	#check the running kernel cmdline option,insure "crashkenrel=" always set.
+	grep -q crashkernel= /proc/cmdline
+	if [ $? != 0 ]; then
+		echo "Kdump isn't supported on the running kernel,please check boot option!!!"
+		${LOGGER} "Kdump isn't supported on the running kernel,please check boot option!!!"
+		return 1
+	fi
+
+	#handle kdump cmdline parameters, remove some useless options
+	kcmdline=""
+	for x in `cat /proc/cmdline`; do
+		case $x in
+			crashkernel*)
+				;;
+			*)
+				kcmdline="${kcmdline} $x"
+				;;
+		esac
+	done
+
+	KDUMP_CMDLINE="${kcmdline} ${KDUMP_CMDLINE_APPEND}"
+
+	#Load the kdump kernel image
+	${KEXEC} ${KEXEC_ARGS} "${KDUMP_KIMAGE}" --append="${KDUMP_CMDLINE}"
+	if [ $? != 0 ]; then
+		echo "Failed to load kdump kernel!"
+		${LOGGER} "Failed to load kdump kernel!"
+		return 1
+	fi
+
+	echo "Kdump started up."
+	${LOGGER} "Kdump started up."
+}
+
+do_stop()
+{
+	${KEXEC} -p -u 2>/dev/null
+	if [ $? == 0 ]; then
+		echo "Kdump has been stopped."
+		${LOGGER} "Kdump has been stopped."
+	else
+		echo "Failed to stop kdump!"
+		${LOGGER} "Failed to stop kdump!"
+	fi
+}
+
+case "$1" in
+  start)
+	if [ -s /proc/vmcore ]; then
+		do_save_vmcore
+		reboot
+	else
+		do_start
+	fi
+	;;
+ restart)
+	do_stop
+	do_start
+	;;
+  stop)
+	do_stop
+	;;
+   *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump.conf b/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump.conf
new file mode 100644
index 0000000..42a2435
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/kexec/kexec-tools/kdump.conf
@@ -0,0 +1,18 @@
+#the kdump kernel version string.
+#KDUMP_KVER="`uname -r`"
+
+#this will be passed to the kdump kernel as kdump kernel command line, it
+#usually comes from /proc/cmdline
+#KDUMP_CMDLINE="`cat /proc/cmdline`"
+
+# append arguments to the kdump commandline
+#KDUMP_CMDLINE_APPEND="kdump_needed maxcpus=1 irqpoll reset_devices"
+
+#the kernel image for kdump
+#KDUMP_KIMAGE="/boot/bzImage-${KDUMP_KVER}"
+
+#Where to save the vmcore
+#KDUMP_VMCORE_PATH="/var/crash/`date +"%Y-%m-%d"`"
+
+#the arguments to makedumpfile
+MAKEDUMPFILE_ARGS="--dump-dmesg -x /boot/vmlinux-`uname -r`"
diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.13pre.bb b/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.13pre.bb
new file mode 100644
index 0000000..7f498c9
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.13pre.bb
@@ -0,0 +1,40 @@
+require recipes-kernel/kexec/kexec-tools.inc
+export LDFLAGS = "-L${STAGING_LIBDIR}"
+EXTRA_OECONF = " --with-zlib=yes"
+
+S = "${WORKDIR}/git"
+
+PV = "2.0.12+2.0.13pre"
+
+BRANCH="master"
+SRCREV = "4db7f295d59651ead1f7632198fe8c113a2e8890"
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git;protocol=git;branch=${BRANCH}"
+
+SRC_URI += " \
+    file://kdump \
+    file://kdump.conf \
+"
+
+PACKAGES =+ "kexec kdump vmcore-dmesg"
+
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
+
+FILES_kexec = "${sbindir}/kexec"
+FILES_kdump = "${sbindir}/kdump ${sysconfdir}/init.d/kdump \
+               ${sysconfdir}/sysconfig/kdump.conf"
+FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
+
+inherit update-rc.d
+
+INITSCRIPT_PACKAGES = "kdump"
+INITSCRIPT_NAME_kdump = "kdump"
+INITSCRIPT_PARAMS_kdump = "start 56 2 3 4 5 . stop 56 0 1 6 ."
+
+do_install_append () {
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
+        install -d ${D}${sysconfdir}/sysconfig
+        install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
+}
-- 
2.7.4


