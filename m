Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B689952A28
	for <meta-arago@arago-project.org>;
	Fri, 28 Aug 2015 04:01:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7S41wGk016247
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7S41whS003353
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 23:01:58 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7S41vif027352;	Thu, 27 Aug 2015 23:01:58 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Aug 2015 00:01:53 -0400
Message-ID: <1440734514-16165-5-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440734514-16165-1-git-send-email-h-gou@ti.com>
References: <1440734514-16165-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] qtbase: add dependency on libdrm for AM3 and AM4 which now use null_window DRM from SGX user module
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
X-List-Received-Date: Fri, 28 Aug 2015 04:02:00 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index d32636f..49b3a2b 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -2,10 +2,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 GLES_EXTRA_DEPS = ""
 GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
+GLES_EXTRA_DEPS_ti43x = "libdrm"
+GLES_EXTRA_DEPS_ti33x = "libdrm"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago9"
+PR_append = "-arago10"
 
 QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
-- 
1.9.1


