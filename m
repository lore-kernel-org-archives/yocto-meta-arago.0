Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4BFC35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.60688.1742236647680136038
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n4TXviCj;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbQsc2847534
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 13:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236646;
	bh=+S2qJsNKVOzHdHQExjApfBJIcj/y5lTXjRky9WAYzO8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=n4TXviCjI288VBFK9DQ9lhT5QzFrpp3uNLlS8VSH8VbGYuetifV+1NC/YOJglQQcQ
	 xG0Uen5BLsWCB7Enk5fJDDXdoQbEMaTaK4DEpt4MljVD3XqzcgznY0ahsNrnRWRJ02
	 oarZZ9YYw34JpJKrfAc4xL1pKwpqtXKZrXclkhJ8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbQUl092950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 13:37:26 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:26 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbQT7000497;
	Mon, 17 Mar 2025 13:37:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL4-0008FS-8c; Mon, 17 Mar 2025 13:37:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 14/14] netopeer2-server: move and clean up
Date: Mon, 17 Mar 2025 13:37:24 -0500
Message-ID: <20250317183724.31563-16-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250317183724.31563-1-reatmon@ti.com>
References: <20250317183724.31563-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 18:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16072

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Combine with bbappend
* Shorten SUMMARY, split DESCRIPTION
* Update DEPENDS - remove systemd and add sysrepo-native
* Don't hardcode /usr when passing to CMake
* Also pass -DSYSREPO_SETUP=OFF to CMake
* Update installing scripts - remove user/group, add permissions

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-Add-EST-Yang-Models.patch            |  0
 .../netopeer2-server/netopeer2-server         |  0
 .../netopeer2-serverd.service                 |  0
 .../sysrepo/netopeer2-server_git.bb           | 53 +++++++++++++++++++
 .../netopeer2-server/netopeer2-server_git.bb  | 47 ----------------
 .../netopeer2-server_git.bbappend             |  5 --
 6 files changed, 53 insertions(+), 52 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/0001-Add-EST-Yang-Models.patch (100%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/netopeer2-server (100%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/netopeer2-serverd.service (100%)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
 delete mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
 delete mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend

diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Add-EST-Yang-Models.patch
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
rename to meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Add-EST-Yang-Models.patch
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/netopeer2-server
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server
rename to meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/netopeer2-server
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-serverd.service b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/netopeer2-serverd.service
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-serverd.service
rename to meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/netopeer2-serverd.service
diff --git a/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
new file mode 100644
index 00000000..a704897f
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Implementation of network configuration tools based on NETCONF Protocol"
+DESCRIPTION = "Netopeer2 is based on the new generation of the NETCONF and YANG libraries - \
+libyang and libnetconf2. The Netopeer server uses sysrepo as a NETCONF datastore implementation."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41daedff0b24958b2eba4f9086d782e1"
+
+SRC_URI = " \
+    git://github.com/CESNET/Netopeer2.git;protocol=https;branch=master \
+    file://0001-Add-EST-Yang-Models.patch \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'file://netopeer2-server', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://netopeer2-serverd.service', '', d)} \
+"
+
+PV = "2.2.35+git"
+SRCREV = "6d1cb61ef3ce2274a91dc9cbc51318bcd0b54697"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libyang libnetconf2 sysrepo sysrepo-native"
+RDEPENDS:${PN} += "bash curl"
+
+FILES:${PN} += "${datadir}/yang* ${datadir}/netopeer2/* ${libdir}/sysrepo-plugind/*"
+
+inherit cmake pkgconfig
+inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_INSTALL_PREFIX=${prefix} \
+    -DCMAKE_BUILD_TYPE:String=Release \
+    -DSYSREPO_SETUP=OFF \
+    -DINSTALL_MODULES=OFF \
+    -DGENERATE_HOSTKEY=OFF \
+    -DMERGE_LISTEN_CONFIG=OFF \
+"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "netopeer2-serverd.service"
+SYSTEMD_AUTO_ENABLE:${PN} = "disable"
+
+do_install:append () {
+    install -d ${D}${sysconfdir}/netopeer2/scripts
+    install -m 0755 ${S}/scripts/setup.sh ${D}${sysconfdir}/netopeer2/scripts/setup.sh
+    install -m 0755 ${S}/scripts/merge_hostkey.sh ${D}${sysconfdir}/netopeer2/scripts/merge_hostkey.sh
+    install -m 0755 ${S}/scripts/merge_config.sh ${D}${sysconfdir}/netopeer2/scripts/merge_config.sh
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/netopeer2-server ${D}${sysconfdir}/init.d/
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/netopeer2-serverd.service ${D}${systemd_system_unitdir}
+    fi
+}
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
deleted file mode 100644
index 21bc9a03..00000000
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "Netopeer2 is a set of tools implementing network configuration tools based on the NETCONF Protocol."
-DESCRIPTION = "Netopeer2 is based on the new generation of the NETCONF and YANG libraries - libyang and libnetconf2. The Netopeer server uses sysrepo as a NETCONF datastore implementation."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=41daedff0b24958b2eba4f9086d782e1"
-
-SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=master \
-          ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
-	        'file://netopeer2-server', '', d)} \
-          ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
-	        'file://netopeer2-serverd.service', '', d)} \
-          "
-
-PV = "2.2.35+git"
-SRCREV = "6d1cb61ef3ce2274a91dc9cbc51318bcd0b54697"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "libyang libnetconf2 sysrepo systemd"
-RDEPENDS:${PN} += "bash curl"
-
-FILES:${PN} += "${datadir}/yang* ${datadir}/netopeer2/* ${libdir}/sysrepo-plugind/*"
-
-inherit cmake pkgconfig
-inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
-
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE:String=Release -DINSTALL_MODULES=OFF -DGENERATE_HOSTKEY=OFF -DMERGE_LISTEN_CONFIG=OFF"
-
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE:${PN} = "netopeer2-serverd.service"
-SYSTEMD_AUTO_ENABLE:${PN} = "disable"
-
-do_install:append () {
-    install -d ${D}${sysconfdir}/netopeer2/scripts
-    install -o root -g root ${S}/scripts/setup.sh ${D}${sysconfdir}/netopeer2/scripts/setup.sh
-    install -o root -g root ${S}/scripts/merge_hostkey.sh ${D}${sysconfdir}/netopeer2/scripts/merge_hostkey.sh
-    install -o root -g root ${S}/scripts/merge_config.sh ${D}${sysconfdir}/netopeer2/scripts/merge_config.sh
-    install -d ${D}${sysconfdir}/netopeer2
-    install -d ${D}${sysconfdir}/init.d
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -m 0755 ${WORKDIR}/netopeer2-server ${D}${sysconfdir}/init.d/
-    fi
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/netopeer2-serverd.service ${D}${systemd_system_unitdir}
-    fi
-}
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
deleted file mode 100644
index f8a9febe..00000000
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://0001-Add-EST-Yang-Models.patch"
-
-FILES:${PN} += "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sysrepo-plugind/*"
-- 
2.17.1


