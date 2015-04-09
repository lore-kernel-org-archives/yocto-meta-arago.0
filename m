Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A1608529C6
	for <meta-arago@arago-project.org>;
	Thu,  9 Apr 2015 12:59:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t39CxMch022132
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 07:59:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39CxLC3005078
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 07:59:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 07:59:21 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39CxLsH003989;
	Thu, 9 Apr 2015 07:59:21 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YgC3F-00012U-7n;
	Thu, 09 Apr 2015 08:59:21 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Apr 2015 08:59:19 -0400
Message-ID: <1428584359-3964-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-amsdk-sdk-host: Remove tisdk-readme.
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
X-List-Received-Date: Thu, 09 Apr 2015 12:59:23 -0000
Content-Type: text/plain

* Remove for ti33x and ti43x devices since this information is kept up
  to date on the wiki.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 61886ff..22bdf36 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r20"
+PR = "r21"
 
 inherit packagegroup
 
@@ -23,8 +23,6 @@ TOOLS_append_am3517-evm = " flash-utility"
 
 EXTRA_FILES = ""
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
-EXTRA_FILES_ti33x = "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
-EXTRA_FILES_ti43x = "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
 
 RDEPENDS_${PN} = "\
     ${TOOLS} \
-- 
1.7.9.5


