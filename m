Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7360C52A68
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2020 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3199A40A41;
	Tue, 17 Mar 2020 20:11:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uu5Q8xi4q5j3; Tue, 17 Mar 2020 20:11:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 15BDE40C33;
	Tue, 17 Mar 2020 20:11:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1FC89171269;
	Tue, 17 Mar 2020 16:11:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 17 Mar 2020 16:11:42 -0400
Message-Id: <1584475904-3730-7-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584475904-3730-1-git-send-email-denys@ti.com>
References: <1584475904-3730-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 7/9] voxelsdk: only build when Python2 is enabled
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
X-List-Received-Date: Tue, 17 Mar 2020 20:13:58 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
index 00dd860..30c4fbf 100644
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
+++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
@@ -31,7 +31,8 @@ OPCLK_ti43x = "RESET_OPCLK"
 CXXFLAGS_append = " -I${STAGING_INCDIR}/libusb-1.0 -D${OPCLK}"
 EXTRA_OECMAKE += "-DDISTROFEATURE=ExcludePCL -DCMAKE_BUILD_TYPE=Debug -DPYTHON_INCLUDE_DIRS=${STAGING_INCDIR}/include/python2.7"
 
-inherit pkgconfig cmake pythonnative python-dir
+inherit pkgconfig cmake
+inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "pythonnative python-dir", "", d)}
 
 DEPENDS = "libusb1 udev opencv boost python swig swig-native"
 
@@ -54,3 +55,8 @@ FILES_${PN}-dev += "${libdir}/cmake ${libdir}/cmake/Voxel ${libdir}/cmake/TI3DTo
 FILES_${PN}-dev += "${libdir}/cmake/Voxel/*.cmake"
 FILES_${PN}-dev += "${libdir}/cmake/TI3DToF/*.cmake"
 FILES_${PN}-dev += "${libdir}/voxel/*.so"
+
+python() {
+    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
+}
-- 
2.7.4


