Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id AF23352093
	for <meta-arago@arago-project.org>;
	Wed, 18 Oct 2017 19:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 20498208CF;
	Wed, 18 Oct 2017 19:21:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WwEsPbyqLuKE; Wed, 18 Oct 2017 19:21:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F30E3204B1;
	Wed, 18 Oct 2017 19:21:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7302F162700;
	Wed, 18 Oct 2017 15:21:57 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 18 Oct 2017 15:21:56 -0400
Message-Id: <1508354516-12334-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] kms++: python bindings require Python3, RDEPENDS on it
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
X-List-Received-Date: Wed, 18 Oct 2017 19:22:03 -0000

This way if kms++-python package gets pulled to rootfs, it will bring the
necessary python3 runtime as well.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index 883607c..911384a 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -4,7 +4,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c670e18272184fc0e86e1648678b4f2a"
 
 PV = "1.0"
-PR = "r2"
+PR = "r3"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=git;branch=${BRANCH}"
@@ -14,6 +14,8 @@ DEPENDS = "drm python3-pybind11"
 
 PACKAGES =+ "${PN}-python"
 
+RDEPENDS_${PN}-python += "python3-core"
+
 FILES_${PN}-python += "${libdir}/python*/site-packages"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


