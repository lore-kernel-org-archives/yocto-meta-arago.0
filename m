Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B5BE752A77
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 13:53:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CDrXIs029691
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:53:33 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CDrWr5003644
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:53:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 08:53:32 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2CDrVBF023236;	Thu, 12 Mar 2015 08:53:32 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t2CDrT81028478;	Thu, 12 Mar 2015 19:23:30 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Mar 2015 08:53:27 -0500
Message-ID: <1426168407-5506-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] packagegroup-arago-standalone-sdk-target: Include libgomp into toolchain SDK
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
X-List-Received-Date: Thu, 12 Mar 2015 13:53:35 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* When compiling an application with the -fopenmp flag an error is given since
  libgomp isn't apart of the toolchain SDK.
* Since this package comes from the toolchain only include it when using the
  external linaro toolchain since it isn't included in the arago toolchain.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
v2 changes:
Depend on TCMODE instead of TCLIBC
Only pull in libgomp-dev since libgomp will end up being pulled in automatically

 .../packagegroup-arago-standalone-sdk-target.bb    |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index d4a5072..5696dec 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Target packages for the standalone SDK"
-PR = "r6"
+PR = "r7"
 LICENSE = "MIT"
 
 inherit packagegroup
@@ -33,4 +33,5 @@ RDEPENDS_${PN} = "\
     opkg-dev \
     sysvinit-dev \
     util-linux-dev \
+    ${@base_conditional('TCMODE', 'external-linaro', 'libgomp-dev', '', d)} \
     "
-- 
1.7.9.5


