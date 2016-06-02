Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 76B7152AA0
	for <meta-arago@arago-project.org>;
	Thu,  2 Jun 2016 02:03:20 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O8400E8WGD40790@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 01 Jun 2016 21:03:05 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=rUTKIj25qtuxnlU_CUcA:9
Received: by 100.15.86.14 with SMTP id 2d853e68; Thu, 02 Jun 2016 02:03:05 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ED76116203B;	Wed,
	1 Jun 2016 22:03:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 01 Jun 2016 22:03:03 -0400
Message-id: <1464832983-8205-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] systemd: enable resolved and add clock synchronization service
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
X-List-Received-Date: Thu, 02 Jun 2016 02:03:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/systemd/systemd/sync-clocks.service     | 16 ++++++++++++++++
 .../recipes-core/systemd/systemd_%.bbappend              | 15 ++++++++++-----
 2 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service b/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service
new file mode 100644
index 0000000..3d506a3
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=Synchronize System and HW clocks
+DefaultDependencies=no
+Wants=sysinit.target
+Conflicts=shutdown.target
+After=systemd-timesyncd.service
+Before=sysinit.target shutdown.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/sbin/hwclock --systohc
+StandardOutput=syslog
+
+[Install]
+WantedBy=sysinit.target
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index ca67eee..123d1ad 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,9 +1,10 @@
-PR_append = ".arago2"
+PR_append = ".arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PACKAGECONFIG_append = " networkd"
+PACKAGECONFIG_append = " networkd resolved"
 USERADD_PARAM_${PN} += "--system -d / -M --shell /bin/nologin systemd-network;"
+USERADD_PARAM_${PN} += "--system -d / -M --shell /bin/nologin systemd-resolve;"
 
 SRC_URI_append = " \
     file://local.rules \
@@ -12,6 +13,7 @@ SRC_URI_append = " \
     file://10-eth.network \
     file://30-wlan.network \
     file://60-usb.network \
+    file://sync-clocks.service \
 "
 
 do_install_append() {
@@ -19,16 +21,19 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
 
     install -d ${D}${sysconfdir}/udev/scripts/
-    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scripts/usb1-rules.sh
-    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scripts/usb2-rules.sh
+    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scripts/
+    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scripts/
 
     install -d ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/10-eth.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
 
-    # Allow automount from udev
     install -d ${D}${sysconfdir}/systemd/system/
+    install -m 0644 ${WORKDIR}/sync-clocks.service ${D}${sysconfdir}/systemd/system/
+    ln -sf ../sync-clocks.service ${D}${sysconfdir}/systemd/system/sysinit.target.wants/sync-clocks.service
+
+    # Allow automount from udev
     install -m 0644 ${D}${systemd_system_unitdir}/systemd-udevd.service ${D}${sysconfdir}/systemd/system/
     sed -i 's/MountFlags=slave/MountFlags=shared/g' ${D}${sysconfdir}/systemd/system/systemd-udevd.service
 
-- 
2.2.0


