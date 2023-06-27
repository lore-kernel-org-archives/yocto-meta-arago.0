Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA00C001B0
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:43:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.15378.1687876991739415452
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Oj+Eyx8S;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35REhAxO026894;
	Tue, 27 Jun 2023 09:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687876990;
	bh=l08xuNwoQ3tGPOGDK20SynFllfZ64zLKFdWzTEubzPI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Oj+Eyx8Sy6HBNfx+9+WqyYPIuPLYIlN0+Bvu50C1LZLwfJOuzEox1tERDB8wvy9pL
	 QFrA4VQ3LR9z3W1Wa9u7jSwfrRKW4D0FyIbedrHMhYxkZApTyn+LlYkvV/uXekLruu
	 mP3piwy6SdAvtUKuNxDP70larhdkFvKuXVU/4+zM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35REhAvG068796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 09:43:10 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 09:43:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 09:43:10 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35REgnll097343;
	Tue, 27 Jun 2023 09:43:07 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <r-gunasekaran@ti.com>, <afd@ti.com>
Subject: [master/kirkstone][PATCH v4 7/8] meta-arago-extras: sysrepo: Add netopeer2 recipe
Date: Tue, 27 Jun 2023 20:12:48 +0530
Message-ID: <20230627144249.30543-8-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627144249.30543-1-r-gunasekaran@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:43:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14713

NETCONF protocol is implemented via netopeer2/sysrepo.
Add the netopeer2 recipe so that the NETCONF protocol can be realized
on devices supporting ethernet.

The recipe is taken as-is from the commit 09f73e7 ("update for honister")
from the public repo [1].

[1] - https://github.com/sartura/meta-sysrepo

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Changes since v3:
----------------
No changes

Changes since v2:
---------------
Newly introduced in this series

 .../netopeer2-server/netopeer2-server         | 35 +++++++++++++++++++
 .../netopeer2-server/netopeer2-server_git.bb  | 31 ++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb

diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server
new file mode 100644
index 00000000..7077df03
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+# Source function library.
+. /etc/init.d/functions
+
+EXEC_PATH="/usr/sbin"
+SERVER_EXEC="netopeer2-server"
+SERVER_OPTS=" -v 1"
+
+
+case "$1" in
+    start)
+        /etc/init.d/sysrepo start
+        start-stop-daemon --start --exec $EXEC_PATH/$SERVER_EXEC -- $SERVER_OPTS
+        ;;
+    stop)
+        start-stop-daemon --stop --quiet --exec $EXEC_PATH/$SERVER_EXEC
+        ;;
+    status)
+        status $SERVER_EXEC
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
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
new file mode 100644
index 00000000..e4278d23
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Netopeer2 is a set of tools implementing network configuration tools based on the NETCONF Protocol."
+DESCRIPTION = "Netopeer2 is based on the new generation of the NETCONF and YANG libraries - libyang and libnetconf2. The Netopeer server uses sysrepo as a NETCONF datastore implementation."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41daedff0b24958b2eba4f9086d782e1"
+
+SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=devel file://netopeer2-server"
+
+PV = "2.1.59+git${SRCPV}"
+SRCREV = "b81788d9a81770313a0eb7f88d4224726b3d6e15"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libyang libnetconf2 sysrepo curl"
+RDEPENDS:${PN} += "bash curl"
+
+FILES:${PN} += "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sysrepo-plugind/*"
+
+inherit cmake pkgconfig
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE:String=Release -DINSTALL_MODULES=OFF -DGENERATE_HOSTKEY=OFF -DMERGE_LISTEN_CONFIG=OFF"
+
+do_install:append () {
+    install -d ${D}/etc/netopeer2/scripts
+    install -o root -g root ${S}/scripts/setup.sh ${D}/etc/netopeer2/scripts/setup.sh
+    install -o root -g root ${S}/scripts/merge_hostkey.sh ${D}/etc/netopeer2/scripts/merge_hostkey.sh
+    install -o root -g root ${S}/scripts/merge_config.sh ${D}/etc/netopeer2/scripts/merge_config.sh
+    install -d ${D}/etc/netopeer2
+    install -d ${D}/etc/init.d
+    install -m 0755 ${WORKDIR}/netopeer2-server ${D}/etc/init.d/
+}
-- 
2.17.1


