Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BD0B452A6D
	for <meta-arago@arago-project.org>;
	Fri,  7 Mar 2014 21:57:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27LvEhq019414
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 15:57:15 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27LvEpL019068
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 15:57:14 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 15:57:14 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27Lv98b006131;
	Fri, 7 Mar 2014 15:57:13 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Mar 2014 15:57:04 -0600
Message-ID: <1394229426-12753-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1394229426-12753-1-git-send-email-fcooper@ti.com>
References: <1394229426-12753-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] ti-tisdk-makefile: Define SDK_PATH_TARGET
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
X-List-Received-Date: Fri, 07 Mar 2014 21:57:16 -0000
Content-Type: text/plain

* Define variable SDK_PATH_TARGET which will be used to cross compile some
  applications/libraries from the top level SDK makefile.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Rules.make |    2 ++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index a20c684..b2dbf64 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -31,3 +31,5 @@ export ENV_SETUP=$(LINUX_DEVKIT_PATH)/environment-setup
 LINUXKERNEL_INSTALL_DIR=$(TI_SDK_PATH)/board-support/__KERNEL_NAME__
 
 CFLAGS=__CFLAGS__
+
+SDK_PATH_TARGET=$(TI_SDK_PATH)/__SDK_PATH_TARGET__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 5863b23..67e1b81 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -34,7 +34,7 @@ SRC_URI = "\
     file://Makefile_dual-camera-demo \
 "
 
-PR = "r29"
+PR = "r30"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.0.4


