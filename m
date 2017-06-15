Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6BACA529BA
	for <meta-arago@arago-project.org>;
	Thu, 15 Jun 2017 13:06:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5FD6BZr002351
	for <meta-arago@arago-project.org>; Thu, 15 Jun 2017 08:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497531971;
	bh=LV3NifRapEZOSuIzom561it0zFO8Fq7lVE9YyckumLk=;
	h=From:To:CC:Subject:Date;
	b=Y/1c11QfuAGF7kmP39PglQLIT3Ql1p83ZXOGnmiiwZXD8P3/B5LTRdDN0esSZNnxc
	rVnQxULT/svD0FMbsVSIGSAhPdE9tiCJZLLxO0lLxp8dF6n1eMInZxlPYewSEJ4yDt
	XK0rHjeao2wzFeIVqQdkcYoLfOBvuMPtV1WK7rUc=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5FD6BfY013061
	for <meta-arago@arago-project.org>; Thu, 15 Jun 2017 08:06:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 08:06:10 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5FD69Xm001505;
	Thu, 15 Jun 2017 08:06:10 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Jun 2017 18:36:07 +0530
Message-ID: <1497531967-44780-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty] omapdrmtest: Update SRCREV
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
X-List-Received-Date: Thu, 15 Jun 2017 13:06:12 -0000
Content-Type: text/plain

This updates the following testcases:
 * display-kms: Call SetCrtc at init time
 * display-kmscube: Add support for RGB texture
 * filevpedisplay: Change argument numbers for kmscube support

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 4090061..48b1f87 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -7,8 +7,8 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r22"
-SRCREV = "116c940c2b06b221c13be28bb79af49233ba462a"
+PR = "r23"
+SRCREV = "7e63575f149d1a5a4a052d6211131676d4ccc655"
 
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.1


