Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7284152995
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2020 20:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF43440C2D;
	Tue, 17 Mar 2020 20:11:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9X-1A6O0H4VQ; Tue, 17 Mar 2020 20:11:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B548540A41;
	Tue, 17 Mar 2020 20:11:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CA8341711B6;
	Tue, 17 Mar 2020 16:11:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 17 Mar 2020 16:11:36 -0400
Message-Id: <1584475904-3730-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/9] cpuset: drop Python2 code
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
X-List-Received-Date: Tue, 17 Mar 2020 20:13:55 -0000

Python2 has been deprecated. If functionality is needed, python-cpuset package
can be used for a while from meta-python2 layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb  |  1 -
 meta-arago-extras/recipes-support/cpuset/cpuset_1.5.7.bb | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/cpuset/cpuset_1.5.7.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 60db7de..7dc1fe4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -26,7 +26,6 @@ ARAGO_TEST = "\
     rwmem \
     pulseaudio-misc \
     kselftests \
-    cpuset \
     procps \
     mtd-utils-ubifs-tests \
     pcitest \
diff --git a/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.7.bb b/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.7.bb
deleted file mode 100644
index c3690f0..0000000
--- a/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.7.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = "https://github.com/lpechacek/cpuset/archive/v${PV}.tar.gz"
-
-SRC_URI[md5sum] = "6ad79b26ba03f559604d74513cc34392"
-SRC_URI[sha256sum] = "32334e164415ed5aec83c5ffc3dc01c418406eb02d96d881fdfd495587ff0c01"
-
-S = "${WORKDIR}/${P}"
-
-CLEANBROKEN = "1"
-
-inherit distutils
-- 
2.7.4


