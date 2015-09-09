Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id C7BC752979
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 17:56:11 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUF00F538H7CYC0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Sep 2015 12:55:56 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=TcUN6v173rxkS-YU7YMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 71A53161BDA;	Wed,
	9 Sep 2015 13:55:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 09 Sep 2015 13:55:55 -0400
Message-id: <1441821355-13700-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v2] external-linaro-toolchain: adjust -cross deps to avoid warning and race
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
X-List-Received-Date: Wed, 09 Sep 2015 17:56:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Many toolchain components like gcc share common work directory with sources
and rely on those sources being prepped by a corresponding -cross part.
Since we use a prebuilt cross toolchain, we have to fake some prep steps for
target toolchain components to build successfully (install unwind.h, etc.).
Need to make sure those prep steps get executed before target gcc requires
them.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain-cross.bb          | 8 +++++++-
 .../recipes-core/meta/external-linaro-toolchain.bbappend          | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
index d0b5bfe..d448f47 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
@@ -3,10 +3,16 @@ SUMMARY = "Stage provided unwind.h header being used by target gcc installation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
-PR = "r0"
+PR = "r1"
 
 inherit cross
 
+PN = "external-linaro-toolchain-cross-${TARGET_ARCH}"
+BPN = "external-linaro-toolchain"
+
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
+
 do_install() {
 	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
 	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index f382897..5155ffb 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -4,7 +4,7 @@ ALLOW_EMPTY_ldd = "1"
 ALLOW_EMPTY_libstdc++ = "1"
 ALLOW_EMPTY_libgomp = "1"
 
-PR_append = "-arago21"
+PR_append = "-arago22"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -18,7 +18,7 @@ PACKAGES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'exter
 
 DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
 
-do_build[depends] += "external-linaro-toolchain-cross:do_populate_sysroot"
+DEPENDS += "external-linaro-toolchain-cross-${TARGET_ARCH}"
 
 RDEPENDS_${PN}-utils = ""
 
-- 
2.2.0


