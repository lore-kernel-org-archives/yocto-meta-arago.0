Return-Path: <a0132163@swubn01>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9BCA052AB1
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 10:58:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r69AwuUb028337
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 05:58:56 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r69Awu5a007566
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 05:58:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Jul 2013 05:58:55 -0500
Received: from swubn01 (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r69Awt6S000772;
	Tue, 9 Jul 2013 05:58:55 -0500
Received: from a0132163 by swubn01 with local (Exim 4.71)	(envelope-from
	<a0132163@swubn01>)	id 1UwVdH-0001dy-0E; Tue, 09 Jul 2013 16:28:55 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jul 2013 16:28:52 +0530
Message-ID: <1373367532-6282-1-git-send-email-mrinmayee@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv3] KMSCube: Add Demo 3D graphics application
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
X-List-Received-Date: Tue, 09 Jul 2013 10:58:58 -0000
Content-Type: text/plain

* Showcases 3D graphics on SGX using kms and gbm

v2:

* Added DEPENDS for libdrm, libgbm and omap-sgx userspace
* INSANE_SKIP to avoid package dependencies

v3:

* Remove inc file as we have a version only .bb file. This
  fixes the review comment received with v1.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
new file mode 100644
index 0000000..e18e398
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Demo application to showcase 3D graphics on SGX using kms and gbm"
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
+
+DEPENDS = "libdrm libgbm-glsdk omap5-sgx-ddk-um-linux"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "5a03757c0aa52eff44fb0d8ac0529f8cc18b1da0"
+
+INSANE_SKIP_kmscube += "dev-deps"
-- 
1.7.0.4


