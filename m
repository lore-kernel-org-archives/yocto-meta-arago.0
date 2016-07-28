Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A2F5152AC2
	for <meta-arago@arago-project.org>;
	Thu, 28 Jul 2016 13:04:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6SD1V1u025758
	for <meta-arago@arago-project.org>; Thu, 28 Jul 2016 08:01:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6SD4viA018076
	for <meta-arago@arago-project.org>; Thu, 28 Jul 2016 08:04:57 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 28 Jul 2016 08:04:57 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6SD4piN022138;	Thu, 28 Jul 2016 08:04:56 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Jul 2016 18:34:49 +0530
Message-ID: <1469711089-3342-4-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1469711089-3342-1-git-send-email-a0393906@ti.com>
References: <1469711089-3342-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gstreamer1.0: Switch to GST 1.6.3
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
X-List-Received-Date: Thu, 28 Jul 2016 13:04:59 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index cc481cb..a67aaf0 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -66,3 +66,11 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
+
+PREFERRED_VERSION_gstreamer1.0 = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-libav = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.6.3"
-- 
1.9.1


