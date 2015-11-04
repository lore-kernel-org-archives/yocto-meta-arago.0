Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 953EA52A19
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 20:00:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4K0Lf9028793
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:21 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K0L1s018156
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 14:00:21 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA4K0JUt001906;	Wed, 4 Nov 2015 14:00:20 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Nov 2015 15:00:14 -0500
Message-ID: <1446667217-21466-5-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446667217-21466-1-git-send-email-h-gou@ti.com>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] img-pvr-sdk: modify BRANCH and SRCREV to update the demos for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 20:00:22 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 96b7d5a..3c9727d 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -6,14 +6,14 @@ CLEANBROKEN = "1"
 
 BRANCH_omap-a15 = "master"
 BRANCH_ti33x = "am4/k4.1"
-BRANCH_ti43x = "am4/k4.1"
+BRANCH_ti43x = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
 SRCREV_ti33x = "f24650bc8243b25c23d6a0a502ed79fc472ac424"
-SRCREV_ti43x = "f24650bc8243b25c23d6a0a502ed79fc472ac424"
+SRCREV_ti43x = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
 
-PR = "r4"
+PR = "r5"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x"
 
@@ -41,9 +41,9 @@ do_install_append_ti33x () {
 }
 
 do_install_append_ti43x () {
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLESEvilSkull ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLESFilmTV ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
 }
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
1.9.1


