Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BBBEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:04:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9463.1687860246247516474
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 03:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yRjbC+zd;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RA44Sv073155;
	Tue, 27 Jun 2023 05:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687860244;
	bh=mkoMyUKrwcfh1N24LqGPHyHejTDtHh9hs9fNvudw00s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yRjbC+zdHKVbfPK00JN4uC8C8PyFC82k7R2k2l1KpEXi1jRibAH69Nm56Sk26r7FQ
	 pPuGXvvj3IVdk5xQPve9oukJmVzx5fB3SVzVlM/anpBy4c6RpSZd7eZIgL5lyM6tkJ
	 mU7ZmILC24K39JWnuVAdhJuT1Bk8ziitmVAchkg4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RA44WF008344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 05:04:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:04:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:04:04 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3klf115122;
	Tue, 27 Jun 2023 05:04:02 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v3 6/8] meta-arago-extras: sysrepo: Add sysrepo and sysrepo plugins
Date: Tue, 27 Jun 2023 15:33:43 +0530
Message-ID: <20230627100345.24340-7-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627100345.24340-1-r-gunasekaran@ti.com>
References: <20230627100345.24340-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 10:04:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14701

NETCONF protocol is implemented via netopeer2/sysrepo.
Add the sysrepo recipe so that the NETCONF protocol can be realized
on devices supporting ethernet.

The recipe is taken as-is from the commit 09f73e7 ("update for honister")
from the public repo [1].

[1] - https://github.com/sartura/meta-sysrepo

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Changes since v2:
---------------
Newly introduced in this series

 .../0001-so-version.patch                     | 12 +++++
 .../sysrepo-plugins-common_git.bb             | 26 ++++++++++
 .../recipes-sysrepo/sysrepo/sysrepo/sysrepo   | 51 +++++++++++++++++++
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 34 +++++++++++++
 4 files changed, 123 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb

diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
new file mode 100644
index 00000000..0eabf6a9
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
@@ -0,0 +1,12 @@
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fd64b80..910510d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -23,6 +23,7 @@ include_directories(${LIBYANG_INCLUDE_DIRS})
+ include_directories(${SYSREPO_INCLUDE_DIRS})
+
+ add_library(${PROJECT_NAME} SHARED ${SRPC_SOURCES})
++set_target_properties(${PROJECT_NAME} PROPERTIES VERSION 1.0.0 SOVERSION 1)
+
+ install(
+     TARGETS ${PROJECT_NAME}
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
new file mode 100644
index 00000000..48f6bc35
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Set of utilities/functionalities which can be used for easier build of sysrepo plugins."
+DESCRIPTION = ""
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f91d5dfaae99cc1943a8eca222cafa5c"
+
+SRC_URI = "gitsm://github.com/telekom/sysrepo-plugins-common.git;protocol=https;branch=devel "
+SRC_URI += " file://0001-so-version.patch "
+FILESEXTRAPATHS:prepend := "${THISDIR}:"
+
+PV = "dev+git${SRCPV}"
+SRCREV = "20885de0d3bb95a05610fdb3a0f83d8f7c370fad"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libyang sysrepo"
+
+FILES:${PN} += ""
+
+inherit cmake pkgconfig
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr "
+
+do_install:append () {
+    true
+}
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
new file mode 100644
index 00000000..06881c68
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+# Source function library.
+. /etc/init.d/functions
+
+EXEC_PATH="/usr/bin"
+SYSREPOPLUGIND_EXEC="sysrepo-plugind"
+SERVER_OPTS=" -d -v 1"
+
+init_sysrepo() {
+    export NP2_MODULE_DIR="/usr/share/yang/modules/netopeer2"
+    export NP2_MODULE_PERMS="600"
+    export NP2_MODULE_OWNER="root"
+    export NP2_MODULE_GROUP="root"
+    if [ -x /usr/bin/sysrepoctl ]; then
+        sh /etc/netopeer2/scripts/setup.sh
+    fi
+    if [ -x /usr/bin/sysrepocfg ]; then
+        sh /etc/netopeer2/scripts/merge_hostkey.sh
+        sh /etc/netopeer2/scripts/merge_config.sh
+    fi
+    touch /etc/sysrepo/init
+}
+
+
+case "$1" in
+    start)
+        test -r /etc/sysrepo/init || init_sysrepo
+        start-stop-daemon --start --background --exec $EXEC_PATH/$SYSREPOPLUGIND_EXEC -- $SERVER_OPTS
+        ;;
+    stop)
+        start-stop-daemon --stop --quiet --exec $EXEC_PATH/$SYSREPOPLUGIND_EXEC
+        rm -rf /var/run/sysrepo-subscriptions/*
+        ;;
+    status)
+        status $SYSREPOPLUGIND_EXEC
+        ;;
+    reload)
+        echo "not supported"
+        ;;
+    restart)
+        $0 stop
+        $0 start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|status|restart}"
+        exit 1;;
+esac
+
+
+exit 0
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
new file mode 100644
index 00000000..18da3ca3
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
@@ -0,0 +1,34 @@
+# Recipe created by recipetool
+SUMMARY = "YANG-based configuration and operational state data store for Unix/Linux applications."
+DESCRIPTION = ""
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ef345f161efb68c3836e6f5648b2312f"
+
+SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=devel file://sysrepo"
+
+PV = "2.2.71+git${SRCPV}"
+SRCREV = "b828f0ab4693c613cc66efd053a146e05854d5c8"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libyang protobuf protobuf-c protobuf-c-native libredblack libev libnetconf2"
+
+FILES:${PN} += "/usr/share/yang/* /usr/lib/sysrepo-plugind/*"
+
+inherit cmake pkgconfig python3native python3-dir
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release -DBUILD_EXAMPLES:String=False -DENABLE_TESTS:String=False -DREPOSITORY_LOC:PATH=/etc/sysrepo  -DCALL_TARGET_BINS_DIRECTLY=False -DGEN_LANGUAGE_BINDINGS:String=False "
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install:append () {
+    install -d ${D}/etc/sysrepo/data/notifications
+    install -d ${D}/etc/sysrepo/yang
+    install -o root -g root ${S}/modules/ietf-netconf-notifications.yang ${D}/etc/sysrepo/yang/ietf-netconf-notifications@2012-02-06.yang
+    install -o root -g root ${S}/modules/ietf-netconf-with-defaults.yang ${D}/etc/sysrepo/yang/ietf-netconf-with-defaults@2011-06-01.yang
+    install -o root -g root ${S}/modules/ietf-netconf.yang ${D}/etc/sysrepo/yang/ietf-netconf@2011-06-01.yang
+    install -d ${D}/etc/init.d
+    install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.d/
+    install -d ${D}/usr/lib/sysrepo/plugins
+}
-- 
2.17.1


