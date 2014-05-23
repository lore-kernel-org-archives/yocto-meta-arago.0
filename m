Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 5008152A73
	for <meta-arago@arago-project.org>;
	Fri, 23 May 2014 20:34:14 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N61009WBNSMD4A0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 23 May 2014 15:33:58 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0B44420092; Fri,
	23 May 2014 16:33:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 23 May 2014 16:33:57 -0400
Message-id: <1400877237-14405-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.3
Subject: [tisdk-build-scripts][PATCH] machine-specific-functions: split keystone-evm into k2hk, k2e and k2l evms
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
X-List-Received-Date: Fri, 23 May 2014 20:34:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/machine-specific-functions | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
index d142dc3..83707b0 100644
--- a/lib/oesdk/machine-specific-functions
+++ b/lib/oesdk/machine-specific-functions
@@ -21,7 +21,7 @@ parse_machines() {
                 ARM9_MACHINES="$ARM9_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""ARM9"
                 ;;
-            am335x-evm | am437x-evm | am37x-evm | am3517-evm | keystone-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm )
+            am335x-evm | am437x-evm | am37x-evm | am3517-evm | k2hk-evm | k2e-evm | k2l-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm )
                 CORTEX_MACHINES="$CORTEX_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""CORTEX"
                 ;;
-- 
1.9.3


