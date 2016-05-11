Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id E734652090
	for <meta-arago@arago-project.org>;
	Wed, 11 May 2016 18:11:16 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O70009NGYIKKTK0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 May 2016 13:11:09 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=R-98C5FL_jHcx6giyf0A:9
Received: by 100.15.86.14 with SMTP id 767fcb8d; Wed, 11 May 2016 18:11:09 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 61816161FDF;	Wed,
	11 May 2016 14:11:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 May 2016 14:11:06 -0400
Message-id: <1462990267-29603-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] mtd-utils: build and package ubifs tests
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
X-List-Received-Date: Wed, 11 May 2016 18:11:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/mtd/mtd-utils_git.bbappend    | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
index 9988fdc..5a1ad05 100644
--- a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
+++ b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
@@ -1,3 +1,41 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 BBCLASSEXTEND += "nativesdk"
+
+EXTRA_OEMAKE = "'CC=${CC} ${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'RANLIB=${RANLIB}' 'AR=${AR}' 'BUILDDIR=${S}'"
+
+do_compile_append() {
+	oe_runmake tests
+}
+
+do_install_append() {
+	install -m 0755 io_update ${D}${sbindir}/
+	install -m 0755 volrefcnt ${D}${sbindir}/
+	install -m 0755 integ ${D}${sbindir}/
+	install -m 0755 io_paral ${D}${sbindir}/
+	install -m 0755 io_read ${D}${sbindir}/
+	install -m 0755 io_basic ${D}${sbindir}/
+	install -m 0755 mkvol_basic ${D}${sbindir}/
+	install -m 0755 mkvol_bad ${D}${sbindir}/
+	install -m 0755 mkvol_paral ${D}${sbindir}/
+	install -m 0755 rsvol ${D}${sbindir}/
+	install -m 0755 tests/ubi-tests/runtests.sh ${D}${sbindir}/
+	install -m 0755 tests/ubi-tests/stress-test.sh ${D}${sbindir}/
+}
+
+PACKAGES =+ "mtd-utils-ubifs-tests"
+
+FILES_mtd-utils-ubifs-tests = " \
+${sbindir}/io_update \
+${sbindir}/volrefcnt \
+${sbindir}/integ \
+${sbindir}/io_paral \
+${sbindir}/io_read \
+${sbindir}/io_basic \
+${sbindir}/mkvol_basic \
+${sbindir}/mkvol_bad \
+${sbindir}/mkvol_paral \
+${sbindir}/rsvol \
+${sbindir}/runtests.sh \
+${sbindir}/stress-test.sh \
+"
-- 
2.2.0


