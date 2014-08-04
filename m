Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 1963D52A88
	for <meta-arago@arago-project.org>;
	Mon,  4 Aug 2014 05:19:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9R0040UO3TFO90@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 04 Aug 2014 00:19:05 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DE61120190; Mon,
	04 Aug 2014 01:19:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 04 Aug 2014 01:19:00 -0400
Message-id: <1407129540-18312-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1407129540-18312-1-git-send-email-denis@denix.org>
References: <1407129540-18312-1-git-send-email-denis@denix.org>
Subject: [dora][PATCH 4/4] initscripts: overlay do_install from daisy to adjust runlevels
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
X-List-Received-Date: Mon, 04 Aug 2014 05:19:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Move mountall initscript before udev to ensure /run is available.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../initscripts/initscripts_1.0.bbappend           | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend

diff --git a/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend b/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend
new file mode 100644
index 0000000..7fe77ba
--- /dev/null
+++ b/meta-arago-distro/recipes-core/initscripts/initscripts_1.0.bbappend
@@ -0,0 +1,80 @@
+PR_append = "-arago0"
+
+# Overlay do_install from daisy
+do_install () {
+#
+# Create directories and install device independent scripts
+#
+	install -d ${D}${sysconfdir}/init.d
+	install -d ${D}${sysconfdir}/rcS.d
+	install -d ${D}${sysconfdir}/rc0.d
+	install -d ${D}${sysconfdir}/rc1.d
+	install -d ${D}${sysconfdir}/rc2.d
+	install -d ${D}${sysconfdir}/rc3.d
+	install -d ${D}${sysconfdir}/rc4.d
+	install -d ${D}${sysconfdir}/rc5.d
+	install -d ${D}${sysconfdir}/rc6.d
+	install -d ${D}${sysconfdir}/default
+	install -d ${D}${sysconfdir}/default/volatiles
+	# Holds state information pertaining to urandom
+	install -d ${D}/var/lib/urandom
+
+	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/bootmisc.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/checkroot.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/halt		${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/hostname.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/mountall.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/mountnfs.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/reboot		${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/rmnologin.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/sendsigs		${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/single		${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/umountnfs.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/urandom		${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/devpts.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/devpts		${D}${sysconfdir}/default
+	install -m 0755    ${WORKDIR}/sysfs.sh		${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
+	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
+	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
+	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
+
+	if [ "${TARGET_ARCH}" = "arm" ]; then
+		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
+	fi
+#
+# Install device dependent scripts
+#
+	install -m 0755 ${WORKDIR}/banner.sh	${D}${sysconfdir}/init.d/banner.sh
+	install -m 0755 ${WORKDIR}/umountfs	${D}${sysconfdir}/init.d/umountfs
+#
+# Create runlevel links
+#
+	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
+	update-rc.d -r ${D} sendsigs start 20 0 6 .
+	update-rc.d -r ${D} urandom start 30 S 0 6 .
+	update-rc.d -r ${D} umountnfs.sh start 31 0 1 6 .
+	update-rc.d -r ${D} umountfs start 40 0 6 .
+	update-rc.d -r ${D} reboot start 90 6 .
+	update-rc.d -r ${D} halt start 90 0 .
+	update-rc.d -r ${D} save-rtc.sh start 25 0 6 .
+	update-rc.d -r ${D} banner.sh start 02 S .
+	update-rc.d -r ${D} checkroot.sh start 06 S .
+	update-rc.d -r ${D} mountall.sh start 03 S .
+	update-rc.d -r ${D} hostname.sh start 39 S .
+	update-rc.d -r ${D} mountnfs.sh start 15 2 3 4 5 .
+	update-rc.d -r ${D} bootmisc.sh start 55 S .
+	update-rc.d -r ${D} sysfs.sh start 02 S .
+	update-rc.d -r ${D} populate-volatile.sh start 37 S .
+	update-rc.d -r ${D} read-only-rootfs-hook.sh start 29 S .
+	update-rc.d -r ${D} devpts.sh start 38 S .
+	if [ "${TARGET_ARCH}" = "arm" ]; then
+	        update-rc.d -r ${D} alignment.sh start 06 S .
+	fi
+	# We wish to have /var/log ready at this stage so execute this after
+	# populate-volatile.sh
+	update-rc.d -r ${D} dmesg.sh start 38 S .
+}
-- 
2.0.4


