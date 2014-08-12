Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BBE8752976
	for <meta-arago@arago-project.org>;
	Tue, 12 Aug 2014 23:06:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CN6en9018178
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 18:06:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CN6eRm030470
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 18:06:40 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 12 Aug 2014 18:06:40 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7CN6dnG024783;	Tue, 12 Aug 2014 18:06:40 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7CN6bqA012506;	Wed, 13 Aug 2014 04:36:38 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Aug 2014 18:06:35 -0500
Message-ID: <1407884796-2289-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] qtbase: Set wayland as the default display plugin
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
X-List-Received-Date: Tue, 12 Aug 2014 23:06:42 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Set wayland as the default display plugin for Qt apps.
* Its already the default now used by Arago but this eliminates the need to pass
  additional arguments for all the different Qt applications.
---
 .../recipes-qt/qt5/qtbase_5.2.1.bbappend           |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
index c879313..f5f772a 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
@@ -3,4 +3,6 @@ GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
+
+QT_CONFIG_FLAGS += "-qpa wayland"
-- 
1.7.9.5


