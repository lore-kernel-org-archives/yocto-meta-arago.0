Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DD5E4529BF
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 14:43:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMEhWR8010295
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhWB3002371
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Nov 2013 08:43:31 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhFBO030461;
	Fri, 22 Nov 2013 08:43:30 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Nov 2013 09:45:21 -0600
Message-ID: <1385135121-14345-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385135121-14345-1-git-send-email-fcooper@ti.com>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/6] packagegroup-arago-tisdk-amsdk-sdk-host: Don't bother packaging blank uEnv.txt
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
X-List-Received-Date: Fri, 22 Nov 2013 14:43:33 -0000
Content-Type: text/plain

* Some devices such as omap-a15 need to override the default u-boot settings to
  work. Therefore, the default uEnv.txt is needed.
* For devices that currently don't need to override the default u-boot settings
  no point in packaging up a blank file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 89da2ff..cb95ae9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 inherit packagegroup
 
@@ -19,8 +19,8 @@ TOOLS_append_am3517-evm = " flash-utility"
 
 EXTRA_FILES = ""
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
-EXTRA_FILES_ti33x = "${@base_contains('ARAGO_BRAND','amsdk','','tisdk-readme tisdk-uenv',d)}"
-EXTRA_FILES_ti43x = "${@base_contains('ARAGO_BRAND','amsdk','','tisdk-readme tisdk-uenv',d)}"
+EXTRA_FILES_ti33x = "${@base_contains('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
+EXTRA_FILES_ti43x = "${@base_contains('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
 
 RDEPENDS_${PN} = "\
     ${TOOLS} \
-- 
1.7.0.4


