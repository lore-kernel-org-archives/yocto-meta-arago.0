Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id BD5585298A
	for <meta-arago@arago-project.org>;
	Fri, 31 Mar 2017 23:04:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2VN4IN7003103
	for <meta-arago@arago-project.org>; Fri, 31 Mar 2017 18:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1491001458;
	bh=0hUh3hD0MZFA5Akx7f0EOVQK6oei+hj1wlr8VvyayoM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MzAD/BieCB0ZyqNBii1ebsaMn5VH0wn4u0V5RMohyZsJWHllZmEwcy45s8KmKbNLC
	bPx522qDBHEojzAgU5b+WrjwR71J7NUwU/SoQbq38AyyA+FEasGOwOJ88/wHHMN+Ft
	an/9tWzpqKZPTaXdY8HiHQPT6L7w72aPeyyDSuJ8=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2VN4InQ001529
	for <meta-arago@arago-project.org>; Fri, 31 Mar 2017 18:04:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 31 Mar 2017 18:04:17 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2VN3qi9005619;	Fri, 31 Mar 2017 18:04:18 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Mar 2017 19:03:41 -0400
Message-ID: <1491001421-28683-4-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1491001421-28683-1-git-send-email-h-gou@ti.com>
References: <1491001421-28683-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [morty][PATCH 4/4] packagegroup-arago-tisdk-matrix: add simple-people-tracking demo
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
X-List-Received-Date: Fri, 31 Mar 2017 23:04:19 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 1cc3c42..acfdeea 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r64"
+PR = "r65"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -65,6 +65,7 @@ MATRIX_OPENCL_APPS_append_dra7xx = " \
 
 MATRIX_OPENCV_ARM_ONLY_APPS = " \
      matrix-machinevision-demo-barcoderoi \
+     matrix-machinevision-demo-simplepeopletracking \
 "
 
 MATRIX_OPENCV_OPENCL_APPS = " \
@@ -73,6 +74,7 @@ MATRIX_OPENCV_OPENCL_APPS = " \
 
 MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
      matrix-machinevision-demo-barcoderoi \
+     matrix-machinevision-demo-simplepeopletracking \
 "
 
 MATRIX_APPS = ""
-- 
1.9.1


