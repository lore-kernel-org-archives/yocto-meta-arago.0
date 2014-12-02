Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 2696A52A7E
	for <meta-arago@arago-project.org>;
	Tue,  2 Dec 2014 22:08:27 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NFZ003LA6TP5H60@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 02 Dec 2014 16:08:13 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=IOK10brD c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=jUsRu1A-omWHsH4R-NwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DD3B820086;	Tue,
	2 Dec 2014 17:08:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 02 Dec 2014 17:08:12 -0500
Message-id: <1417558092-8892-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] packagegroup-arago-test: re-enable am57xx test packages
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
X-List-Received-Date: Tue, 02 Dec 2014 22:08:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 9077c96..6b67ccb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r21"
+PR = "r22"
 
 inherit packagegroup
 
@@ -24,7 +24,6 @@ ARAGO_TEST = "\
     perf \
     "
 
-ARAGO_TI_TEST_am57xx-evm = ""
 ARAGO_TI_TEST = "\
     ltp-ddt \
     input-utils \
-- 
2.1.2


