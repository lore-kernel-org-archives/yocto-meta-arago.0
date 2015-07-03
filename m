Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 75DD252ACD
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:27 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00J3U5S22S40@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:27 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=KZwvylsD c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=CsDJgnP02Pow1scYdRwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 15D2B161AE3;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:53 -0400
Message-id: <1435892533-6046-35-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 34/54] lmbench: changes are version-agnostic, rename bbappend accordingly, mandir was fixed upstream
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../lmbench/{lmbench_3.0-a9.bbappend => lmbench_%.bbappend}         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta-arago-distro/recipes-benchmark/lmbench/{lmbench_3.0-a9.bbappend => lmbench_%.bbappend} (75%)

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
similarity index 75%
rename from meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend
rename to meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
index 5a8bfe9..9685f42 100644
--- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend
+++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
@@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 INSANE_SKIP_${PN} += "ldflags"
 
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 SRC_URI += "file://0001-Makefile-Add-TI-SDK-Modifications.patch"
 
@@ -14,7 +14,3 @@ do_compile () {
     unset CPPFLAGS
     oe_runmake -C src
 }
-
-do_install_append() {
-    mv ${D}${prefix}/man ${D}${mandir}
-}
-- 
2.2.0


