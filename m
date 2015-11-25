Return-Path: <e-ruei1@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6023852A22
	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 23:08:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPN844k005804
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPN84W2026951
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 17:08:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPN83pg018422	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 17:08:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Nov 2015 18:07:58 -0500
Message-ID: <1448492879-1050-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
References: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] qt5/qtbase: Define GLES_EXTRA_DEPS based on the availability of SGX
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
X-List-Received-Date: Wed, 25 Nov 2015 23:08:06 -0000
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


