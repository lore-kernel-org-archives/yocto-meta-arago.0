Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 1144052A34
	for <meta-arago@arago-project.org>;
	Tue,  7 Mar 2017 19:56:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v27JubSO022596
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 13:56:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488916597;
	bh=BuxoviKO7zFQUzgjXAACrS+mrkBBIvqCerGa3iHyOLY=;
	h=From:To:CC:Subject:Date;
	b=kn9tSJBkviUEW4LsaebBdgaD2f11g1Lg2njnVkERa0z97s4yBL9yIaNAb2lAE9eSr
	RlVcXHNUka5jfkxlbRsy7HgcUmYK34+ipA9Q4/SRdTjZJuh8E6H1ec0t8S9SO2Dh8P
	TDbwm7hG81MCC6ICReZBIFs93fR7juKj4aXKOpZY=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v27Jub5I015643
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 13:56:37 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 13:56:36 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v27Jua1S022149;	Tue, 7 Mar 2017 13:56:36 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Mar 2017 14:54:24 -0500
Message-ID: <1488916464-6535-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [morty/master][PATCH] opencv: clean up PACKAGECONFIG appends
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
X-List-Received-Date: Tue, 07 Mar 2017 19:56:37 -0000
Content-Type: text/plain

* add qtwayland for all but keystone
* add opencl if MACHINE_FEATURES includes dsp

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index 2de9b96..fd69ed8 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r2"
 
 BRANCH = "tiopencvrelease_3.1"
 
@@ -17,9 +17,12 @@ DEPENDS_remove_keystone = "qtbase"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PACKAGECONFIG_append_dra7xx = " opencl"
-PACKAGECONFIG_append_keystone = " opencl"
-PACKAGECONFIG_append_dra7xx = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", " qtwayland", "", d)}"
+PACKAGECONFIG_QTWAYLAND = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
+PACKAGECONFIG_QTWAYLAND_keystone = ""
+
+PACKAGECONFIG_append = " ${PACKAGECONFIG_QTWAYLAND} \
+                         ${@bb.utils.contains('MACHINE_FEATURES','dsp','opencl', '', d)} \
+"
 
 inherit cmake_qt5
 
-- 
2.7.4


