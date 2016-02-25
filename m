Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 6EBF6529CF
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 21:17:28 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O34007X9GGFORC0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 25 Feb 2016 15:17:04 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=ghYrmk0fNbdUyLRa_HUA:9
Received: by 100.15.86.14 with SMTP id 7fc6d73e; Thu, 25 Feb 2016 21:17:04 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 61DCA161EC3;	Thu,
	25 Feb 2016 16:17:03 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 25 Feb 2016 16:17:03 -0500
Message-id: <1456435023-15346-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] run-opentest: update am5 HS platform to dra7
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
X-List-Received-Date: Thu, 25 Feb 2016 21:17:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/run-opentest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/run-opentest b/lib/run-opentest
index 4515384..63879f9 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -19,8 +19,8 @@ set_opentest_platform() {
         am437x-hs-evm )
             oplatform="am43xx-hsevm"
             ;;
-        am57xx-hs-evm )
-            oplatform="am57xx-hsevm"
+        dra7xx-hs-evm )
+            oplatform="dra7xx-hsevm"
             ;;
         * )
             return 2
-- 
2.2.0


