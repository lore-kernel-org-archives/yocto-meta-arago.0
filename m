Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A0E0152A64
	for <meta-arago@arago-project.org>;
	Fri, 17 Mar 2017 19:38:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2HJc2Gv031507
	for <meta-arago@arago-project.org>; Fri, 17 Mar 2017 14:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489779482;
	bh=uyhEQT5wncDQ4taj507urR11suZP5SEOFLPXW76pH2E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sDvdBk3efHQ0RdddwrqYs7cHFNRcS+/guMFyfeQjRDjsBPth3HfITlNNRm3Csn2z3
	mjOZv1Nh2hcdAenAlp4o9Uzdt/FcWIHPpHGh4sw7KkzB6SZAOpqgh1Gp01xepyxLsX
	8Ht8iBBRRZqEJ/U0mkafvEtGhuxRIPfiu0/k//kI=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HJc2bK030411
	for <meta-arago@arago-project.org>; Fri, 17 Mar 2017 14:38:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Mar 2017 14:38:02 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2HJc07K007022;	Fri, 17 Mar 2017 14:38:02 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Mar 2017 15:37:54 -0400
Message-ID: <1489779474-16764-4-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489779474-16764-1-git-send-email-h-gou@ti.com>
References: <1489779474-16764-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [morty/krogoth][PATCH 4/4] packagegroup-arago-tisdk-matrix: add simple-people-tracking demo
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
X-List-Received-Date: Fri, 17 Mar 2017 19:38:03 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 7598e66..3268ea9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r64"
+PR = "r65"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -63,6 +63,7 @@ MATRIX_OPENCL_APPS_append_dra7xx = " \
 
 MATRIX_OPENCV_ARM_ONLY_APPS = " \
      matrix-machinevision-demo-barcoderoi \
+     matrix-machinevision-demo-simplepeopletracking \
 "
 
 MATRIX_OPENCV_OPENCL_APPS = " \
@@ -71,6 +72,7 @@ MATRIX_OPENCV_OPENCL_APPS = " \
 
 MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
      matrix-machinevision-demo-barcoderoi \
+     matrix-machinevision-demo-simplepeopletracking \
 "
 
 MATRIX_APPS = ""
-- 
1.9.1


