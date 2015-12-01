Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7046E52974
	for <meta-arago@arago-project.org>;
	Tue,  1 Dec 2015 15:30:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB1FUZwR030960
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:36 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB1FUZUd029353
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:35 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Dec 2015 09:30:35 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB1FUY6u003898	for <meta-arago@arago-project.org>;
	Tue, 1 Dec 2015 09:30:35 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Dec 2015 10:30:17 -0500
Message-ID: <1448983818-21402-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
References: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH V2 4/5] qt5/qtbase: Define GLES_EXTRA_DEPS based on the availability of SGX
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
X-List-Received-Date: Tue, 01 Dec 2015 15:30:43 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enable non-SGX build for AM3/AM4
For ti43x, add wayland dependency only if SGX is included at MACHINE_FEATURES.
Note: wayland is not included at ti33x because only nullDRM mode is supported.

Signed-off-by: Eric Ruei <a0850410@uda0850410>
---
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 19891e1..cd8876a 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -2,12 +2,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 GLES_EXTRA_DEPS = ""
 GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
-GLES_EXTRA_DEPS_ti43x = "libdrm wayland"
+GLES_EXTRA_DEPS_ti43x = "libdrm ${@base_contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"
 GLES_EXTRA_DEPS_ti33x = "libdrm"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago11"
+PR_append = "-arago12"
 
 QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
-- 
1.9.1


