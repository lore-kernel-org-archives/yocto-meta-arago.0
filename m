Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DA40F52A57
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 00:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0F62E207AB;
	Wed, 29 Aug 2018 00:14:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gQIr_KdPn6Rw; Wed, 29 Aug 2018 00:14:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E24F020C65;
	Wed, 29 Aug 2018 00:14:03 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 753841635E0;
	Tue, 28 Aug 2018 20:14:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 28 Aug 2018 20:13:56 -0400
Message-Id: <1535501640-23640-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535501640-23640-1-git-send-email-denys@ti.com>
References: <1535501640-23640-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/7] arago-prefs: update prefernce for gstreamer to 1.14.2
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
X-List-Received-Date: Wed, 29 Aug 2018 00:14:14 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 0d2f31c..d5f7fbb 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -47,9 +47,9 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
 
-PREFERRED_VERSION_gstreamer1.0 = "1.14.1"
-PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.14.1"
-PREFERRED_VERSION_gstreamer1.0-libav = "1.14.1"
-PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.14.1"
-PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.14.1"
-PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.14.1"
+PREFERRED_VERSION_gstreamer1.0 = "1.14.2"
+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.14.2"
+PREFERRED_VERSION_gstreamer1.0-libav = "1.14.2"
+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.14.2"
+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.14.2"
+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.14.2"
-- 
2.7.4


