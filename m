Return-Path: <anandb@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6650852007
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 16:10:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RGAlmN031301
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 10:10:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RGAl5p031348
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 10:10:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 10:10:46 -0600
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0RGAjsa009022;	Wed, 27 Jan 2016 10:10:46 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 21:40:35 +0530
Message-ID: <1453911035-17363-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/1] libgbm: synchronize libgbm with upstream Mesa
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
X-List-Received-Date: Wed, 27 Jan 2016 16:10:48 -0000
Content-Type: text/plain

Move to the latest GBM API defined in upstream Mesa:
git://anongit.freedesktop.org/mesa/mesa

This API change breaks backward compatibility. All dependent
applications/libraries need to be rebuilt against this GBM library.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../recipes-graphics/gbm/libgbm_10.0.0.bb          |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb

diff --git a/meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb b/meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb
new file mode 100644
index 0000000..303f245
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/gbm/libgbm_10.0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Userspace interface for the kernel GBM services."
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
+DEPENDS = "libdrm"
+
+inherit autotools pkgconfig
+
+BRANCH = "next"
+
+SRCREV = "96f37555c7e82a417b02051661377b10e6b3966e"
+
+SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+PR = "r0"
-- 
1.7.9.5


