Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id CF6A252A85
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:51:47 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X00M6IS2BSW10@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:51:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=VWoAh1RKMaW6KLqUWlwA:9
Received: by 100.15.86.14 with SMTP id 64dbdfb1; Fri, 01 Apr 2016 03:51:47 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 312B7161F6F;	Thu,
	31 Mar 2016 23:41:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:43 -0400
Message-id: <1459482106-27723-24-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 23/26] external-linaro-toolchain.bbappend: drop unneeded fixes for broken 2015.05
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
X-List-Received-Date: Fri, 01 Apr 2016 03:51:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Inhibit stripping for now - one of the libraries fails to strip

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend       | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 19e7617..c5c460b 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -1,4 +1,4 @@
-INHIBIT_PACKAGE_STRIP = "0"
+#INHIBIT_PACKAGE_STRIP = "0"
 
 ALLOW_EMPTY_${PN}-utils = "1"
 ALLOW_EMPTY_ldd = "1"
@@ -6,7 +6,7 @@ ALLOW_EMPTY_ldd = "1"
 ALLOW_EMPTY_libstdc++ = "1"
 ALLOW_EMPTY_libgomp = "1"
 
-PR_append = "-arago29"
+PR_append = "-arago30"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -104,12 +104,6 @@ FILES_libgomp-dev += "\
 "
 
 do_install_append() {
-	mv ${D}${base_libdir}/libc.so ${D}${libdir}/libc.so || true
-	mv ${D}${base_libdir}/libpthread.so ${D}${libdir}/libpthread.so || true
-
-	ln -sf ../../lib/libc.so.6 ${D}${libdir}/libc.so.6
-	ln -sf ../../lib/libpthread.so.0 ${D}${libdir}/libpthread.so.0
-
 	sed -i -e "s# /lib/${ELT_TARGET_SYS}# ../../lib#g" -e "s# /usr/lib/${ELT_TARGET_SYS}# .#g" -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${libdir}/libc.so
 	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libc.so
 
-- 
2.2.0


