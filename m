Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 92EA252AB8
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYmbR024731
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:48 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYm45002610
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:48 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOR003617;	Thu, 30 Jan 2014 12:34:47 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:16 -0600
Message-ID: <1391106857-17112-11-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] Update bbappends for Dora
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:49 -0000
Content-Type: text/plain

* Update the bbappend files for the versions found in Dora

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 ...enssh_6.1p1.bbappend => openssh_6.2p2.bbappend} |    3 +++
 ...box_1.20.2.bbappend => busybox_1.21.1.bbappend} |    0
 .../{dbus_1.6.8.bbappend => dbus_1.6.10.bbappend}  |    0
 ..._2012.55.bbappend => dropbear_2013.58.bbappend} |    2 ++
 ...pe_2.4.11.bbappend => freetype_2.4.12.bbappend} |    0
 ...eaudio_3.0.bbappend => pulseaudio_4.0.bbappend} |    0
 ...bbappend => nativesdk-qt4-tools_4.8.5.bbappend} |    0
 ...4.bbappend => qt4-embedded-gles_4.8.5.bbappend} |    0
 ..._4.8.4.bbappend => qt4-embedded_4.8.5.bbappend} |    0
 .../{curl_7.29.0.bbappend => curl_7.32.0.bbappend} |    0
 10 files changed, 5 insertions(+)
 rename meta-arago-distro/recipes-connectivity/openssh/{openssh_6.1p1.bbappend => openssh_6.2p2.bbappend} (91%)
 rename meta-arago-distro/recipes-core/busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dbus/{dbus_1.6.8.bbappend => dbus_1.6.10.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dropbear/{dropbear_2012.55.bbappend => dropbear_2013.58.bbappend} (92%)
 rename meta-arago-distro/recipes-graphics/freetype/{freetype_2.4.11.bbappend => freetype_2.4.12.bbappend} (100%)
 rename meta-arago-distro/recipes-multimedia/pulseaudio/{pulseaudio_3.0.bbappend => pulseaudio_4.0.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.4.bbappend => nativesdk-qt4-tools_4.8.5.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded-gles_4.8.4.bbappend => qt4-embedded-gles_4.8.5.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded_4.8.4.bbappend => qt4-embedded_4.8.5.bbappend} (100%)
 rename meta-arago-distro/recipes-support/curl/{curl_7.29.0.bbappend => curl_7.32.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/openssh/openssh_6.1p1.bbappend b/meta-arago-distro/recipes-connectivity/openssh/openssh_6.2p2.bbappend
similarity index 91%
rename from meta-arago-distro/recipes-connectivity/openssh/openssh_6.1p1.bbappend
rename to meta-arago-distro/recipes-connectivity/openssh/openssh_6.2p2.bbappend
index c0f449e..b3cb26c 100644
--- a/meta-arago-distro/recipes-connectivity/openssh/openssh_6.1p1.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssh/openssh_6.2p2.bbappend
@@ -6,5 +6,8 @@
 #
 # Versions of openssh that are TSU Exempted:
 # openssh-5.6p1
+# openssh-5.9p1
+# openssh-6.1p1
+# openssh-6.2p2
 
 PR_append = "-arago0"
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.21.1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
rename to meta-arago-distro/recipes-core/busybox/busybox_1.21.1.bbappend
diff --git a/meta-arago-distro/recipes-core/dbus/dbus_1.6.8.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_1.6.10.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-core/dbus/dbus_1.6.8.bbappend
rename to meta-arago-distro/recipes-core/dbus/dbus_1.6.10.bbappend
diff --git a/meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-arago-distro/recipes-core/dropbear/dropbear_2013.58.bbappend
similarity index 92%
rename from meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend
rename to meta-arago-distro/recipes-core/dropbear/dropbear_2013.58.bbappend
index f766014..6c43541 100644
--- a/meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend
+++ b/meta-arago-distro/recipes-core/dropbear/dropbear_2013.58.bbappend
@@ -3,6 +3,8 @@
 ################################################################################
 # Versions of dropbear that are TSU Exempted:
 # dropbear-0.51
+# dropbear-2012.55
+# dropbear-2013.58
 #
 # This package requires TSU exemption. Any update to the version of dropbear being
 # appended must be double checked to see if a new TSU exemption must be made.
diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_2.4.11.bbappend b/meta-arago-distro/recipes-graphics/freetype/freetype_2.4.12.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/freetype/freetype_2.4.11.bbappend
rename to meta-arago-distro/recipes-graphics/freetype/freetype_2.4.12.bbappend
diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_3.0.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_4.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_3.0.bbappend
rename to meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_4.0.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bbappend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bbappend
rename to meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bbappend
rename to meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.5.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
rename to meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.5.bbappend
diff --git a/meta-arago-distro/recipes-support/curl/curl_7.29.0.bbappend b/meta-arago-distro/recipes-support/curl/curl_7.32.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-support/curl/curl_7.29.0.bbappend
rename to meta-arago-distro/recipes-support/curl/curl_7.32.0.bbappend
-- 
1.7.9.5


