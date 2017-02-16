Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2481A52AA3
	for <meta-arago@arago-project.org>;
	Thu, 16 Feb 2017 19:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F207920B64;
	Thu, 16 Feb 2017 19:58:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VhW3ihQhvt1f; Thu, 16 Feb 2017 19:58:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C161320147;
	Thu, 16 Feb 2017 19:58:42 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4F756162374;
	Thu, 16 Feb 2017 14:58:42 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 16 Feb 2017 14:58:30 -0500
Message-Id: <1487275110-60319-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] kms++: update to the latest, package python bindings
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
X-List-Received-Date: Thu, 16 Feb 2017 19:58:46 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Alejandro Hernandez <ajhernandez@ti.com>
---
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index 9b30569..121479b 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -4,17 +4,21 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c670e18272184fc0e86e1648678b4f2a"
 
 PV = "1.0"
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=git;branch=${BRANCH}"
-SRCREV = "546e8d16dbc4dc74038dbcf86567186dbd80c3ab"
+SRCREV = "6d28a0dd5d6747116f631d24bcc59d944a1b8b95"
 
-DEPENDS = "drm python3 python3-pybind11"
+DEPENDS = "drm python3-pybind11"
+
+PACKAGES =+ "${PN}-python"
+
+FILES_${PN}-python += "${libdir}/python*/site-packages"
 
 S = "${WORKDIR}/git"
 
-inherit cmake update-alternatives
+inherit python3native cmake update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "kmstest"
-- 
2.7.4


