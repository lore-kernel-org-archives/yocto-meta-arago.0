Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by arago-project.org (Postfix) with SMTP id 93AB052A22
	for <meta-arago@arago-project.org>;
	Thu,  9 Feb 2017 21:19:29 +0000 (UTC)
Received: from acheron (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with SMTP id A0A6F1C035A;
	Fri, 10 Feb 2017 10:19:26 +1300 (NZDT)
Received: by acheron (sSMTP sendmail emulation);
	Fri, 10 Feb 2017 10:19:26 +1300
Date: Fri, 10 Feb 2017 10:19:26 +1300
From: Douglas Royds <douglas.royds@taitradio.com>
To: meta-arago@arago-project.org
Subject: [PATCH] mtd-utils: Install renamed ubifs test scripts
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
X-List-Received-Date: Thu, 09 Feb 2017 21:19:32 -0000
Message-ID: <MADEUP.16AE422415B5E36B.14582@lists.yoctoproject.org>

When upstream moved over to the autotools, they also renamed
tests/ubi-tests/runtests.sh and tests/ubi-tests/stress-test.sh,
and made them autotools macro files.

See http://git.infradead.org/mtd-utils.git/commitdiff/8a00021b2ab5529640e5acaca30a27cdaca04178

Signed-off-by: Douglas Royds <douglas@taitradio.com>
---
 meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
index 5a1ad05..aadca84 100644
--- a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
+++ b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
@@ -19,8 +19,8 @@ do_install_append() {
 	install -m 0755 mkvol_bad ${D}${sbindir}/
 	install -m 0755 mkvol_paral ${D}${sbindir}/
 	install -m 0755 rsvol ${D}${sbindir}/
-	install -m 0755 tests/ubi-tests/runtests.sh ${D}${sbindir}/
-	install -m 0755 tests/ubi-tests/stress-test.sh ${D}${sbindir}/
+	install -m 0755 tests/ubi-tests/runubitests.sh ${D}${sbindir}/
+	install -m 0755 tests/ubi-tests/ubi-stress-test.sh ${D}${sbindir}/
 }

 PACKAGES =+ "mtd-utils-ubifs-tests"
@@ -36,6 +36,6 @@ ${sbindir}/mkvol_basic \
 ${sbindir}/mkvol_bad \
 ${sbindir}/mkvol_paral \
 ${sbindir}/rsvol \
-${sbindir}/runtests.sh \
-${sbindir}/stress-test.sh \
+${sbindir}/runubitests.sh \
+${sbindir}/ubi-stress-test.sh \
 "
--
2.7.4


