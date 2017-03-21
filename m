Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 69AB252A78
	for <meta-arago@arago-project.org>;
	Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6CE6920BBD;
	Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jiPVHrLs7hQY; Tue, 21 Mar 2017 01:43:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2743420B6A;
	Tue, 21 Mar 2017 01:43:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6463B16241D;
	Mon, 20 Mar 2017 21:43:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 20 Mar 2017 21:43:07 -0400
Message-Id: <1490060589-72852-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490060589-72852-1-git-send-email-denis@denix.org>
References: <1490060589-72852-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 10/12] arago-prefs: update gstreamer preference to 1.10.4
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
X-List-Received-Date: Tue, 21 Mar 2017 01:43:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index f0fc38f..ac18258 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -42,9 +42,9 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
 
-PREFERRED_VERSION_gstreamer1.0 = "1.10.1"
-PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.10.1"
-PREFERRED_VERSION_gstreamer1.0-libav = "1.10.1"
-PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.10.1"
-PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.10.1"
-PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.10.1"
+PREFERRED_VERSION_gstreamer1.0 = "1.10.4"
+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.10.4"
+PREFERRED_VERSION_gstreamer1.0-libav = "1.10.4"
+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.10.4"
+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.10.4"
+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.10.4"
-- 
2.7.4


