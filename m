Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5A06352007
	for <meta-arago@arago-project.org>;
	Thu, 28 Jan 2016 18:23:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SINDLH028116
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 12:23:13 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SINDko017740
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 12:23:13 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 12:23:13 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SINDUY031764;
	Thu, 28 Jan 2016 12:23:13 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOrDs-0007SE-Iw; Thu, 28 Jan 2016 13:23:12 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Jan 2016 13:23:10 -0500
Message-ID: <1454005390-28620-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] img-pvr-sdk: ti43x: Update branch and SRCREV for HDMI underrun fix
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
X-List-Received-Date: Thu, 28 Jan 2016 18:23:24 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb         | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 3c9727d..90dd097 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -5,17 +5,18 @@ LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8
 CLEANBROKEN = "1"
 
 BRANCH_omap-a15 = "master"
-BRANCH_ti33x = "am4/k4.1"
-BRANCH_ti43x = "master"
+BRANCH_ti33x = "am3/k4.1"
+BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
-SRCREV_ti33x = "f24650bc8243b25c23d6a0a502ed79fc472ac424"
-SRCREV_ti43x = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
+SRCREV_ti33x = "ca2d479543fc6884818604b32a66de8ffc77145f"
+SRCREV_ti43x = "e4052bf874fce9d59c340ae1cda41a7391abcb1a"
 
-PR = "r5"
+PR = "r6"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


