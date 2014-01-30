Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7704052A73
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYPTK030181
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:25 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYPfq002382
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:25 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOI003617;	Thu, 30 Jan 2014 12:34:23 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:07 -0600
Message-ID: <1391106857-17112-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 01/11] qt4-embedded-gles: Update to 4.8.5 version
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:26 -0000
Content-Type: text/plain

* Dora release of oe-core uses 4.8.5 so this recipe needs
  to update.
* Change the preferred version setting for qt4

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    6 +++---
 ...ed-gles_4.8.4.bb => qt4-embedded-gles_4.8.5.bb} |    0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-qt/qt4/{qt4-embedded-gles_4.8.4.bb => qt4-embedded-gles_4.8.5.bb} (100%)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index d5176fd..4b021a8 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -9,9 +9,9 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
-PREFERRED_VERSION_qt4-embedded = "4.8.4"
-PREFERRED_VERSION_qt4-native = "4.8.4"
-PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.4"
+PREFERRED_VERSION_qt4-embedded = "4.8.5"
+PREFERRED_VERSION_qt4-native = "4.8.5"
+PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.5"
 PREFERRED_VERSION_linux-libc-headers = "3.8"
 
 # Use v4.09.00.01 of the Graphics SDK
diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bb
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb
rename to meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bb
-- 
1.7.9.5


