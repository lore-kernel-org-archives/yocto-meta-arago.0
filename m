Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 64982529FF
	for <meta-arago@arago-project.org>;
	Wed, 17 Jun 2015 15:11:25 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQ3009XQGU4MZ80@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 17 Jun 2015 10:10:57 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ff9QsBkF c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=XAFQembCKUMA:10
	a=sozttTNsAAAA:8 a=HihYlcsHAAAA:8	a=WTBVgR4bEvGbKzlNsnUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 07EAE161A99;	Wed,
	17 Jun 2015 11:10:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 17 Jun 2015 11:10:51 -0400
Message-id: <1434553851-28219-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ltp-ddt: update with latest fixes
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
X-List-Received-Date: Wed, 17 Jun 2015 15:11:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index 50523f0..c9dcbb4 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r3"
+PR = "r4"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -16,7 +16,7 @@ inherit autotools module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "8f0a90b4f0ee67b82dcf5f96bc4f5eef775ec021"
+SRCREV = "aa4fe3c6f6c1cd2dc8aeabd042f2226b78c7f1bf"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
2.2.0


