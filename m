Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8F2AC52AAA
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 00:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B47BC2091B;
	Thu, 22 Dec 2016 00:44:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ls3_YamAbhPq; Thu, 22 Dec 2016 00:44:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 929A3208B1;
	Thu, 22 Dec 2016 00:44:16 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 3CAF21621E2;
	Wed, 21 Dec 2016 19:44:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Dec 2016 19:44:15 -0500
Message-Id: <1482367455-4782-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] arago-prefs: update gstreamer pref version
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
X-List-Received-Date: Thu, 22 Dec 2016 00:44:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 5b9d56b..ba7e865 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -47,9 +47,9 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
 
-PREFERRED_VERSION_gstreamer1.0 = "1.8.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.8.3"
-PREFERRED_VERSION_gstreamer1.0-libav = "1.8.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.8.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.8.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.8.3"
+PREFERRED_VERSION_gstreamer1.0 = "1.10.1"
+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.10.1"
+PREFERRED_VERSION_gstreamer1.0-libav = "1.10.1"
+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.10.1"
+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.10.1"
+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.10.1"
-- 
2.7.4


