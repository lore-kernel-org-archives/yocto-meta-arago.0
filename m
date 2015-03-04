Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0C20752A8C
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 20:05:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24K5Nef029314
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:05:23 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24K5Mnu013463
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:05:22 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 14:05:21 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24K5Lkx012940;	Wed, 4 Mar 2015 14:05:21 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t24K5J7V032494;	Thu, 5 Mar 2015 01:35:20 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Mar 2015 14:05:14 -0600
Message-ID: <1425499517-11576-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] stream: Add Stream benchmark
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
X-List-Received-Date: Wed, 04 Mar 2015 20:05:24 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-benchmark/stream/stream_git.bb         |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-arago-extras/recipes-benchmark/stream/stream_git.bb

diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_git.bb b/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
new file mode 100644
index 0000000..56be33f
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Stream Benchmark"
+HOMEPAGE = "http://www.cs.virginia.edu/stream/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bca8cbe07976fe64c8946378d08314b0"
+SECTION = "system"
+
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "bd474633b7b0352211b48d84065bf7b7e166e4c2"
+
+SRC_URI = "git://git.ti.com/sitara-linux/stream.git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+do_compile() {
+	# build the release version
+	oe_runmake stream_linux
+}
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/stream_c ${D}/${bindir}/
+}
+
-- 
1.7.9.5


