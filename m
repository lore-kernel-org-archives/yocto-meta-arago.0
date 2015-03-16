Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 619CF52A0B
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 22:52:40 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB00MJ3U79EX80@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Mar 2015 17:52:27 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=NqFmqHZM c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=BKnvCB8l_7Tj7Oe19xwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6F342201B1;	Mon,
	16 Mar 2015 18:52:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2015 18:52:00 -0400
Message-id: <1426546322-25230-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1426546322-25230-1-git-send-email-denis@denix.org>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/7] external-linaro-toolchain: package libgcc-dev stubs and libs for compilation
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
X-List-Received-Date: Mon, 16 Mar 2015 22:52:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend      | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 8aef835..0ecbab8 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -1,8 +1,9 @@
 INSANE_SKIP_libstdc++-dev += "staticdev"
 
 ALLOW_EMPTY_${PN}-utils = "1"
+ALLOW_EMPTY_ldd = "1"
 
-PR_append = "-arago7"
+PR_append = "-arago8"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -94,10 +95,18 @@ FILES_libstdc++-dev = "\
 	${base_libdir}/libsupc++.a \
 "
 
+FILES_libgcc-dev += " \
+	${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/libgcc*.a \
+	${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/*.o"
+
 do_install_append() {
 	install -d ${D}/include
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}/include
 
+	install -d ${D}/${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/
+	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/*.o ${D}/${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/
+	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/libgcc*.a ${D}/${libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/
+
 	ln -sf ld-${ELT_VER_LIBC}.so ${D}${base_libdir}/ld-linux-armhf.so.3
 	if [ -f ${D}${libdir}/libc.so ];then
 		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${libdir}/libc.so
-- 
2.2.0


