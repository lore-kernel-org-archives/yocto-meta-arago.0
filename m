Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6E9BE52A63
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 01:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3652040AC8;
	Tue, 18 Dec 2018 01:34:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id L1mgwcrMF1IH; Tue, 18 Dec 2018 01:34:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E444840022;
	Tue, 18 Dec 2018 01:33:59 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D1DE71677F0;
	Mon, 17 Dec 2018 20:33:58 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Dec 2018 20:33:58 -0500
Message-Id: <1545096838-31519-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] arago-prefs: drop version preferences no longer used
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
X-List-Received-Date: Tue, 18 Dec 2018 01:34:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

There's one version of gstreamer now, no need for specific preference

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index d5f7fbb..a96569f 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -34,11 +34,6 @@ PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 # application that does not have a GPLv3 license
 PREFERRED_VERSION_crda = "3.18"
 PREFERRED_VERSION_obex = "0.34"
-# These old GPLv2 versions are no longer in OE-Core
-#PREFERRED_VERSION_gdbm = "1.8.3"
-#PREFERRED_VERSION_bash = "3.2.57"
-#PREFERRED_VERSION_gettext = "0.16.1"
-#PREFERRED_VERSION_elfutils = "0.148"
 
 PREFERRED_PROVIDER_libnl-xfrm = "libnl"
 
@@ -46,10 +41,3 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
-
-PREFERRED_VERSION_gstreamer1.0 = "1.14.2"
-PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.14.2"
-PREFERRED_VERSION_gstreamer1.0-libav = "1.14.2"
-PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.14.2"
-PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.14.2"
-PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.14.2"
-- 
2.7.4


