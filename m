Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 8075B52960
	for <meta-arago@arago-project.org>;
	Sun, 10 Jul 2016 18:19:08 +0000 (UTC)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA400F6A2VFWI00@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 10 Jul 2016 13:18:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=TvcL36JCrQXoVDjD6CUA:9
Received: by 100.15.86.14 with SMTP id 4a0ccabf; Sun, 10 Jul 2016 18:18:51 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 9AA64162066;	Sun, 10 Jul 2016 14:18:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 10 Jul 2016 14:18:50 -0400
Message-id: <1468174730-14323-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] arago-gpl-notice: update with systemd service for proper output
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
X-List-Received-Date: Sun, 10 Jul 2016 18:19:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/arago-gpl-notice/arago-gpl-notice.bb      | 14 ++++++++++----
 .../arago-gpl-notice/arago-gpl-notice/gplv3-notice.service | 11 +++++++++++
 2 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/gplv3-notice.service

diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index d9d3710..6d89f46 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -2,18 +2,24 @@ DESCRIPTION = "Script to warn users of GPLv3 content on the target file system a
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}"
 
 INITSCRIPT_NAME = "gplv3-notice"
 INITSCRIPT_PARAMS = "defaults 99"
 
-inherit allarch update-rc.d
+inherit allarch update-rc.d systemd
 
-SRC_URI = "file://print-gplv3-packages.sh"
+SRC_URI = " file://print-gplv3-packages.sh \
+            file://gplv3-notice.service"
 
 do_install(){
 	install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${S}/print-gplv3-packages.sh ${D}${sysconfdir}/init.d/gplv3-notice
+	install -m 0755 ${S}/print-gplv3-packages.sh ${D}${sysconfdir}/init.d/gplv3-notice
+
+	install -d ${D}${systemd_system_unitdir}
+	install -m0644 ${WORKDIR}/gplv3-notice.service ${D}${systemd_system_unitdir}
 }
+
+SYSTEMD_SERVICE_${PN} = "gplv3-notice.service"
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/gplv3-notice.service b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/gplv3-notice.service
new file mode 100644
index 0000000..50cb839
--- /dev/null
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/gplv3-notice.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Print notice about GPLv3 packages
+
+[Service]
+Type=oneshot
+ExecStart=/etc/init.d/gplv3-notice
+WorkingDirectory=/etc/init.d
+StandardOutput=tty
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4


