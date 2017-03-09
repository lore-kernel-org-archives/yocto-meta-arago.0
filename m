Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id A87AC52A34
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 18:16:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29IGbOx003974
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 12:16:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489083397;
	bh=eI0a4tIYDoXorfOIfmWBJ49cOgvfG7yLhtHjnhjF/JU=;
	h=From:To:CC:Subject:Date;
	b=N5RugsjeVCSrABECJeCwra8GGIlTBtdHldMtcreCqOvq9S57Ow1mjT1jHnyVK+LO0
	Y7Yk8RerOqZzMUJIYYm0KWeZy0pa/tuXO3OudaOaleXIgt0CMNu3qO3KFlXcWerANH
	V4fj8B61LmhslEp2qpnvfS+Uk/iy1CrgdZluQ8eA=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29IGbsE012826
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 12:16:37 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 12:16:36 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v29IGaXT008947;	Thu, 9 Mar 2017 12:16:36 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 13:14:25 -0500
Message-ID: <1489083265-10509-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [krogoth/morty/master][PATCH] ti-tisdk-makefile: opencl-examples: restrict to non-persistent examples
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
X-List-Received-Date: Thu, 09 Mar 2017 18:16:38 -0000
Content-Type: text/plain

* The opencl persistent examples require the TI RTOS SDK

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples        | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
index c1cbf67..0b8aa96 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
@@ -3,7 +3,7 @@ opencl-examples:
 	@echo =====================================
 	@echo     Building the OpenCL Examples
 	@echo =====================================
-	@cd example-applications; cd `find . -name "*opencl-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x
+	@cd example-applications; cd `find . -name "*opencl-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x EXAMPLE_SET=EXCLUDE_PERSISTENT
 
 opencl-examples_install:
 	@echo =======================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 9f1a575..1cc0ccf 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r79"
+PR = "r80"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
2.7.4


