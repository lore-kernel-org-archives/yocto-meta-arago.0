Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A31EC529E6
	for <meta-arago@arago-project.org>;
	Thu,  8 Jan 2015 11:23:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t08BNU6F011695
	for <meta-arago@arago-project.org>; Thu, 8 Jan 2015 05:23:30 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t08BNUu1032513
	for <meta-arago@arago-project.org>; Thu, 8 Jan 2015 05:23:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 05:23:30 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t08BNRFg009579;
	Thu, 8 Jan 2015 05:23:29 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 8 Jan 2015 16:53:24 +0530
Message-ID: <1420716205-24905-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1420716205-24905-1-git-send-email-a0393906@ti.com>
References: <1420716205-24905-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [v2 WILINK R8.5 1/2] packagegroup-*-connectivity: Include iptables package
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
X-List-Received-Date: Thu, 08 Jan 2015 11:23:32 -0000
Content-Type: text/plain

This is needed by the wilink test scripts that are included

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index f469fdd..08d2a4a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r30"
+PR = "r31"
 
 inherit packagegroup
 
@@ -25,6 +25,7 @@ WLAN_COMMON = "\
     hostap-daemon-wl18xx \
     ti-wifi-utils-wl18xx \
     wl18xx-target-scripts \
+    iptables \
 "
 
 # netperf has non-standard license, needs verifying
-- 
1.7.9.5


