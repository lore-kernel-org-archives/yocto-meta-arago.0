Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 2FE2152A4F
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:41 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00CZJ5RS8PC0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=N5PUbDJB c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8	a=dwkTxPwAFGEwfSDG9B8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3048C161ACD;	Thu,
	2 Jul 2015 23:02:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:30 -0400
Message-id: <1435892533-6046-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 11/54] crda: remove older version
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/crda/crda_1.1.3.bbappend         | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend

diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend
deleted file mode 100644
index 6dd888a..0000000
--- a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-SRC_URI = "ftp://www.kernel.org/pub/software/network/crda/${BP}.tar.bz2;name=crda \
-           ftp://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2013.01.11.tar.gz;name=bin \
-"
-
-SRC_URI[bin.md5sum] = "57f2d4c2cdfa2d20c859bca202dd6ece"
-SRC_URI[bin.sha256sum] = "608c2fea6ca840a51bc1a8c35c53ca4c20a78d4f78c3bc7cbdcd53dee0cc0cf8"
-
-
-do_install() {
-    oe_runmake SBINDIR=${sbindir}/ install
-
-    install -d ${D}${libdir}/crda/
-
-    install -m 0644 ${WORKDIR}/wireless-regdb-2013.01.11/regulatory.bin ${D}${libdir}/crda/regulatory.bin
-}
-- 
2.2.0


