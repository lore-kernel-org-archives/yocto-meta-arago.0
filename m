Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id F12DD52079
	for <meta-arago@arago-project.org>;
	Tue, 16 Dec 2014 16:11:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGO0093ANMOPZ40@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 16 Dec 2014 10:11:18 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=CoYIqc8G c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=yfdpQ_a0ETaoHcK2ZQAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 65333200F0;	Tue,
	16 Dec 2014 11:11:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 16 Dec 2014 11:11:10 -0500
Message-id: <1418746270-18779-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-prefs: set wpa-supplicant provider for dra7xx
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
X-List-Received-Date: Tue, 16 Dec 2014 16:11:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 5e36740..ac8cbf8 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -109,6 +109,7 @@ PREFERRED_VERSION_gettext = "0.16.1"
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
+PREFERRED_PROVIDER_wpa-supplicant_dra7xx-evm = "wpa-supplicant-wl18xx"
 
 PREFERRED_PROVIDER_gstreamer = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
 PREFERRED_PROVIDER_gstreamer-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dev', 'gstreamer-dev', d)}"
-- 
2.2.0


