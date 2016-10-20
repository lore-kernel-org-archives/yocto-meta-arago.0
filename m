Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 71B7052AAB
	for <meta-arago@arago-project.org>;
	Thu, 20 Oct 2016 02:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 84D69208EE;
	Thu, 20 Oct 2016 02:48:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BcOX798E22lj; Thu, 20 Oct 2016 02:48:05 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 529A520A34;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 6786116217B;
	Wed, 19 Oct 2016 22:48:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Oct 2016 22:47:58 -0400
Message-Id: <1476931679-4689-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476931679-4689-1-git-send-email-denis@denix.org>
References: <1476931679-4689-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 7/8] gstreamer, arago-prefs: update to gstreamer 1.8.3
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
X-List-Received-Date: Thu, 20 Oct 2016 02:48:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc        | 12 ++++++------
 ....6.3.bbappend => gstreamer1.0-plugins-bad_1.8.3.bbappend} |  0
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.6.3.bbappend => gstreamer1.0-plugins-bad_1.8.3.bbappend} (100%)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 0fbafd8..0ac52d3 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -67,9 +67,9 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
 
-PREFERRED_VERSION_gstreamer1.0 = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-libav = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.6.3"
-PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.6.3"
+PREFERRED_VERSION_gstreamer1.0 = "1.8.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.8.3"
+PREFERRED_VERSION_gstreamer1.0-libav = "1.8.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.8.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.8.3"
+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.8.3"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
-- 
2.7.4


