Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 1846D529B3
	for <meta-arago@arago-project.org>;
	Fri,  8 Apr 2016 22:11:19 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5C009BU5MUB160@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 Apr 2016 17:11:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=2aZaBsUEHb_wgB0Q1c4A:9
Received: by 100.15.86.14 with SMTP id 03aef291; Fri, 08 Apr 2016 22:11:18 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2FACC161F54;	Fri,
	8 Apr 2016 18:11:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 Apr 2016 18:11:14 -0400
Message-id: <1460153474-15214-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: packagegroup-arago-test: disable omapdrmtest due to breakage
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
X-List-Received-Date: Fri, 08 Apr 2016 22:11:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

git/util/demux.c:87:23: error: 'CODEC_ID_H264' undeclared (first use in this function)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 2fe32fa..b49e28d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -47,9 +47,9 @@ ARAGO_TI_TEST_append_ti43x = " \
     omapconf \
     "
 
+#    ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
-    ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
     ti-ipc-test \
     "
 
-- 
2.2.0


