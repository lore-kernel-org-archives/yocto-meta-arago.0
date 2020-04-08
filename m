Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C004952A2D
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9318040C1D;
	Wed,  8 Apr 2020 00:51:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GbejMSVoirYs; Wed,  8 Apr 2020 00:51:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 330BA40A6E;
	Wed,  8 Apr 2020 00:51:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DF9DF17126C;
	Tue,  7 Apr 2020 20:51:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:51:11 -0400
Message-Id: <1586307071-8916-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] arago.conf, packagegroup-arago-tisdk-qte: enable examples PACKAGECONFIG for qt5 modules
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
X-List-Received-Date: Wed, 08 Apr 2020 00:53:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

qtdeclarative-examples is broken for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                     | 12 +++++++++++-
 .../packagegroups/packagegroup-arago-tisdk-qte.bb            |  2 +-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 3215fe7..05201f3 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -103,7 +103,17 @@ PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples accessibility gif gbm kms libinpu
 PACKAGECONFIG_FONTS_pn-qtbase = "fontconfig"
 
 # Add gstreamer in package configuration to enable video
-PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
+PACKAGECONFIG_append_pn-qtmultimedia = " gstreamer"
+
+# Add examples in Qt5 package configurations
+PACKAGECONFIG_append_pn-qtcharts = " examples"
+#PACKAGECONFIG_append_pn-qtdeclarative = " examples"
+PACKAGECONFIG_append_pn-qtlocation = " examples"
+PACKAGECONFIG_append_pn-qtmultimedia = " examples"
+PACKAGECONFIG_append_pn-qtscript = " examples"
+PACKAGECONFIG_append_pn-qtserialport = " examples"
+PACKAGECONFIG_append_pn-qtsvg = " examples"
+PACKAGECONFIG_append_pn-qtwayland = " examples"
 
 # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
 PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index f83ac52..a2e3794 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -12,9 +12,9 @@ QT4_DEMOS = "\
     ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
 "
 
+#    qtdeclarative-examples
 QT5_DEMOS = "\
     qtbase-examples \
-    qtdeclarative-examples \
     qtdeclarative-tools \
     qtlocation-examples \
     qtmultimedia-examples \
-- 
2.7.4


