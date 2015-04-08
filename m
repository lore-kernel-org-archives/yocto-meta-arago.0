Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 93D80529E0
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 10:49:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38AnwWv016058
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 05:49:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38Anvec000430
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 05:49:57 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Apr 2015 05:49:57 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38AnvCT025768;
	Wed, 8 Apr 2015 05:49:57 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YfnYS-00087M-P3;
	Wed, 08 Apr 2015 06:49:56 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Apr 2015 06:49:55 -0400
Message-ID: <1428490195-31174-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-amsdk-sdk-host: Include tisdk-uenv.
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
X-List-Received-Date: Wed, 08 Apr 2015 10:49:59 -0000
Content-Type: text/plain

* If tisdk-readme is packaged, then the uEnv.txt should also be
  packaged.
* Package both if not amsdk.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 61886ff..c6994ee 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -23,8 +23,8 @@ TOOLS_append_am3517-evm = " flash-utility"
 
 EXTRA_FILES = ""
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
-EXTRA_FILES_ti33x = "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
-EXTRA_FILES_ti43x = "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
+EXTRA_FILES_ti33x = "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme tisdk-uenv',d)}"
+EXTRA_FILES_ti43x = "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme tisdk-uenv',d)}"
 
 RDEPENDS_${PN} = "\
     ${TOOLS} \
-- 
1.7.9.5


