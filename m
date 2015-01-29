Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 205D152090
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 13:11:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TDBDI6003798
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 07:11:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TDBCu3013746
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 07:11:12 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 07:11:12 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TDBBu8032625;
	Thu, 29 Jan 2015 07:11:11 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Jan 2015 18:41:08 +0530
Message-ID: <1422537068-15904-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] crda: Fix issue with upstream repository
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
X-List-Received-Date: Thu, 29 Jan 2015 13:11:17 -0000
Content-Type: text/plain

* The download from wireless.kernel.org is not working.
* Pointing to an alternate source
* Adapted to the new way of picking up the required
  version of the regulatory.bin

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-connectivity/crda/crda_1.1.3.bbappend  |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend

diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend
new file mode 100644
index 0000000..6dd888a
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend
@@ -0,0 +1,15 @@
+SRC_URI = "ftp://www.kernel.org/pub/software/network/crda/${BP}.tar.bz2;name=crda \
+           ftp://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2013.01.11.tar.gz;name=bin \
+"
+
+SRC_URI[bin.md5sum] = "57f2d4c2cdfa2d20c859bca202dd6ece"
+SRC_URI[bin.sha256sum] = "608c2fea6ca840a51bc1a8c35c53ca4c20a78d4f78c3bc7cbdcd53dee0cc0cf8"
+
+
+do_install() {
+    oe_runmake SBINDIR=${sbindir}/ install
+
+    install -d ${D}${libdir}/crda/
+
+    install -m 0644 ${WORKDIR}/wireless-regdb-2013.01.11/regulatory.bin ${D}${libdir}/crda/regulatory.bin
+}
-- 
1.7.9.5


