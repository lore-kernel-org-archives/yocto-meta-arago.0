Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 94B6552A85
	for <meta-arago@arago-project.org>;
	Tue, 31 Jan 2012 20:35:50 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0VKZmMD019516
	for <meta-arago@arago-project.org>; Tue, 31 Jan 2012 14:35:49 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKZlZX027599
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2012 02:05:48 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 1 Feb 2012 02:05:47 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKZjBo027990;
	Wed, 1 Feb 2012 02:05:46 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Jan 2012 14:35:43 -0600
Message-ID: <1328042143-29570-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2] arm-benchmarks: port benchmarks from old arago
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
X-List-Received-Date: Tue, 31 Jan 2012 20:35:50 -0000
Content-Type: text/plain

* Port the am-benchmarks from the original arago overlay to
  meta-arago
* Change the name to arm-benchmarks
* Modify the recipe for oe-core changes
* Updated the SRCREV to pickup licensing file

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Changed in version 2
    * Moved to recipes-benchmark directory instead of recipes-core

---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
new file mode 100644
index 0000000..71f5eb8
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "ARM Benchmarks"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
+SECTION = "system"
+
+SRCREV = "76"
+PR = "r0+svnr${SRCPV}"
+
+SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+S = "${WORKDIR}/trunk"
+
+do_compile() {
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	export ARCH=${TUNE_PKGARCH}
+	# build the release version
+	make release 
+}
+
+do_install() {
+	export ARCH=${TUNE_PKGARCH}
+	make DESTDIR=${D} install
+}
-- 
1.7.0.4


