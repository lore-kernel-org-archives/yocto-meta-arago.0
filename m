Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id B1EDF529AC
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 16:59:07 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUF000VJ5U1Z780@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Sep 2015 11:58:49 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=4LowH6mONHlu_9SabhMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1B667161BCB;	Wed,
	9 Sep 2015 12:58:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 09 Sep 2015 12:58:48 -0400
Message-id: <1441817928-9003-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-prefs: drop some old outdated preferences
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
X-List-Received-Date: Wed, 09 Sep 2015 16:59:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index cc2c4db..1cafa96 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -27,14 +27,6 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 ARAGO_QT_PROVIDER = "${@base_conditional('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
-PREFERRED_VERSION_qt4-embedded = "4.8.5"
-PREFERRED_VERSION_qt4-native = "4.8.5"
-PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.5"
-
-# Use v4.09.00.01 of the Graphics SDK
-PREFERRED_VERSION_omap3-sgx-modules_omap3 = "4.09.00.01"
-PREFERRED_VERSION_libgles-omap3_omap3 = "4.09.00.01"
-
 PREFERRED_PROVIDER_omap3-sgx-modules = "omap3-sgx-modules"
 PREFERRED_PROVIDER_libgles-omap3 = "libgles-omap3"
 PREFERRED_PROVIDER_libgles-omap3-dev = "libgles-omap3-dev"
-- 
2.2.0


