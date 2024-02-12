Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE74C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 07:54:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2134.1707724478937734173
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 11 Feb 2024 23:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=csuDmN39;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41C7sa4M013344;
	Mon, 12 Feb 2024 01:54:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707724476;
	bh=eLC2IoYhz42Dr+WqkPafH1TalwcmZsV4+sw7nXc4nc4=;
	h=From:To:CC:Subject:Date;
	b=csuDmN39sO3d3oaf247tEIwrRCya95mcgsfG6Vo7j4ufP4SGaxob2B5JpqQb5s2tF
	 +gNQVMOHrTv+cRjNAsV/MW7Oyq5tlA+bKS3FbQ137Xf7vlSws/SSo7no4iCO0ZQ3vR
	 FkS+PXDKjeHlpyaGWnM8D5FticxShv0MJej6wTbw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41C7sab4026501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 01:54:36 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 01:54:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 01:54:36 -0600
Received: from uda0500640.dal.design.ti.com (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41C7sXxe010671;
	Mon, 12 Feb 2024 01:54:34 -0600
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <r-gunasekaran@ti.com>, <srk@ti.com>, <c-shilwant@ti.com>
Subject: [master/kirkstone][PATCH v2] meta-arago-extras: sysrepo: Update netopeer and sysrepo to start under systemd
Date: Mon, 12 Feb 2024 13:24:33 +0530
Message-ID: <20240212075433.24446-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 07:54:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15160

The init.d scripts for sysrepo and netopeer2-server requires certain
other init.d scripts that are now removed. And the systemd services generated
systemd-sysv-generator is not sufficient.

So introduce new unit files for sysrepo and netopeer2 and update the
respective bitbake recipes.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
Changes from v1:
---------------
* Use Yocto installation variables for /etc/ and /usr/lib

v1: https://lore.kernel.org/yocto-meta-arago/20240209103337.25332-1-r-gunasekaran@ti.com/

 .../netopeer2-serverd.service                 | 29 +++++++++++++++
 .../netopeer2-server/netopeer2-server_git.bb  | 20 +++++++++-
 .../sysrepo/sysrepo/sysrepod.service          | 37 +++++++++++++++++++
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 23 ++++++++++--
 4 files changed, 104 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-serverd.service
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.service

diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-serverd.service b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-serverd.service
new file mode 100644
index 00000000..3b365fca
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-serverd.service
@@ -0,0 +1,29 @@
+#Permission is hereby granted, free of charge, to any person obtaining a copy
+#of this software and associated documentation files (the "Software"), to deal
+#in the Software without restriction, including without limitation the rights
+#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+#copies of the Software, and to permit persons to whom the Software is
+#furnished to do so, subject to the following conditions:
+#
+#The above copyright notice and this permission notice shall be included in
+#all copies or substantial portions of the Software.
+#
+#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#THE SOFTWARE.
+
+[Unit]
+Description=Netopeer2-Server
+After=sysrepod.service
+
+[Service]
+RemainAfterExit=true
+Type=oneshot
+ExecStart=/usr/sbin/netopeer2-server -v 1
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
index e4278d23..427559e5 100644
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
@@ -3,7 +3,12 @@ DESCRIPTION = "Netopeer2 is based on the new generation of the NETCONF and YANG
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41daedff0b24958b2eba4f9086d782e1"
 
-SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=devel file://netopeer2-server"
+SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=devel \
+          ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
+	        'file://netopeer2-server', '', d)} \
+          ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
+	        'file://netopeer2-serverd.service', '', d)} \
+          "
 
 PV = "2.1.59+git${SRCPV}"
 SRCREV = "b81788d9a81770313a0eb7f88d4224726b3d6e15"
@@ -16,10 +21,15 @@ RDEPENDS:${PN} += "bash curl"
 FILES:${PN} += "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sysrepo-plugind/*"
 
 inherit cmake pkgconfig
+inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE:String=Release -DINSTALL_MODULES=OFF -DGENERATE_HOSTKEY=OFF -DMERGE_LISTEN_CONFIG=OFF"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "netopeer2-serverd.service"
+SYSTEMD_AUTO_ENABLE:${PN} = "disable"
+
 do_install:append () {
     install -d ${D}/etc/netopeer2/scripts
     install -o root -g root ${S}/scripts/setup.sh ${D}/etc/netopeer2/scripts/setup.sh
@@ -27,5 +37,11 @@ do_install:append () {
     install -o root -g root ${S}/scripts/merge_config.sh ${D}/etc/netopeer2/scripts/merge_config.sh
     install -d ${D}/etc/netopeer2
     install -d ${D}/etc/init.d
-    install -m 0755 ${WORKDIR}/netopeer2-server ${D}/etc/init.d/
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -m 0755 ${WORKDIR}/netopeer2-server ${D}${sysconfdir}/init.d
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/netopeer2-serverd.service ${D}${systemd_system_unitdir}
+    fi
 }
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.service b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.service
new file mode 100644
index 00000000..1b4c3e3b
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.service
@@ -0,0 +1,37 @@
+#Permission is hereby granted, free of charge, to any person obtaining a copy
+#of this software and associated documentation files (the "Software"), to deal
+#in the Software without restriction, including without limitation the rights
+#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+#copies of the Software, and to permit persons to whom the Software is
+#furnished to do so, subject to the following conditions:
+#
+#The above copyright notice and this permission notice shall be included in
+#all copies or substantial portions of the Software.
+#
+#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#THE SOFTWARE.
+
+[Unit]
+Description=Sysrepo
+After=local-fs.target
+
+[Service]
+RemainAfterExit=true
+Type=oneshot
+
+ExecStartPre=/bin/bash -c 'NP2_MODULE_DIR="/usr/share/yang/modules/netopeer2" \
+			   NP2_MODULE_PERMS="600" NP2_MODULE_OWNER="root" \
+			   NP2_MODULE_GROUP="root" \
+			   exec /etc/netopeer2/scripts/setup.sh'
+ExecStartPre=/bin/bash /etc/netopeer2/scripts/merge_hostkey.sh
+ExecStartPre=/bin/bash /etc/netopeer2/scripts/merge_config.sh
+ExecStartPre= touch /etc/sysrepo/init
+ExecStart=/usr/bin/sysrepo-plugind
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
index 18da3ca3..0688b61f 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
@@ -4,7 +4,11 @@ DESCRIPTION = ""
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ef345f161efb68c3836e6f5648b2312f"
 
-SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=devel file://sysrepo"
+SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=devel \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
+                'file://sysrepo','', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
+                'file://sysrepod.service','', d)}"
 
 PV = "2.2.71+git${SRCPV}"
 SRCREV = "b828f0ab4693c613cc66efd053a146e05854d5c8"
@@ -16,12 +20,18 @@ DEPENDS = "libyang protobuf protobuf-c protobuf-c-native libredblack libev libne
 FILES:${PN} += "/usr/share/yang/* /usr/lib/sysrepo-plugind/*"
 
 inherit cmake pkgconfig python3native python3-dir
+inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
+
 
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release -DBUILD_EXAMPLES:String=False -DENABLE_TESTS:String=False -DREPOSITORY_LOC:PATH=/etc/sysrepo  -DCALL_TARGET_BINS_DIRECTLY=False -DGEN_LANGUAGE_BINDINGS:String=False "
 
 BBCLASSEXTEND = "native nativesdk"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "sysrepod.service"
+SYSTEMD_AUTO_ENABLE:${PN} = "disable"
+
 do_install:append () {
     install -d ${D}/etc/sysrepo/data/notifications
     install -d ${D}/etc/sysrepo/yang
@@ -29,6 +39,13 @@ do_install:append () {
     install -o root -g root ${S}/modules/ietf-netconf-with-defaults.yang ${D}/etc/sysrepo/yang/ietf-netconf-with-defaults@2011-06-01.yang
     install -o root -g root ${S}/modules/ietf-netconf.yang ${D}/etc/sysrepo/yang/ietf-netconf@2011-06-01.yang
     install -d ${D}/etc/init.d
-    install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.d/
-    install -d ${D}/usr/lib/sysrepo/plugins
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -m 0775 ${WORKDIR}/sysrepo ${D}${sysconfdir}/init.d
+        install -d ${D}${libdir}/sysrepo/plugins
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/sysrepod.service ${D}${systemd_system_unitdir}
+    fi
 }

base-commit: db4752d19a46406683f4a4adf8187de8075b70b6
-- 
2.17.1


