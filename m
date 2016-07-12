Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 62DF9529E8
	for <meta-arago@arago-project.org>;
	Tue, 12 Jul 2016 20:23:55 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA700DJ0XZEP600@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Jul 2016 15:23:39 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=E0IcA2W-ep6RqZjZWBMA:9
Received: by 100.15.86.14 with SMTP id 07ffb29a; Tue, 12 Jul 2016 20:23:39 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 704D71620A3;	Tue, 12 Jul 2016 16:23:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Jul 2016 16:23:36 -0400
Message-id: <1468355016-17595-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] arago-prefs.conf: switch back to 1.2.3 gstreamer due to last-minute issues
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
X-List-Received-Date: Tue, 12 Jul 2016 20:23:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a67aaf0..e0b0a90 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -67,10 +67,9 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
 
-PREFERRED_VERSION_gstreamer1.0 = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-libav = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.6.3"
-
+PREFERRED_VERSION_gstreamer1.0 = "1.2.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.2.3"
+PREFERRED_VERSION_gstreamer1.0-libav = "1.2.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.2.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.2.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.2.3"
-- 
2.7.4


