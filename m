Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 844BC52099
	for <meta-arago@arago-project.org>;
	Fri, 17 Apr 2015 20:25:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3HKPnsT014606
	for <meta-arago@arago-project.org>; Fri, 17 Apr 2015 15:25:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3HKPmsJ011706
	for <meta-arago@arago-project.org>; Fri, 17 Apr 2015 15:25:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 17 Apr 2015 15:25:48 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3HKPlLg029519;	Fri, 17 Apr 2015 15:25:48 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Apr 2015 16:25:46 -0400
Message-ID: <1429302346-9926-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ltp-ddt: Skip mv of kernel files if no files found
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
X-List-Received-Date: Fri, 17 Apr 2015 20:25:50 -0000
Content-Type: text/plain

- Install was failing if there are no modules for certain platforms

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index 68e1a3c..609b344 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -87,7 +87,7 @@ do_install() {
     oe_runmake install
     install -d ${D}${datadir}
     install -d ${D}${kmoddir}
-    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
+    find ${D}${LTPROOT}/testcases/bin/ddt/*.ko && mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
 }
 
 # do_make_scripts should be a separate task for the lock to work
-- 
1.7.9.5


