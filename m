Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1D50C52AAE
	for <meta-arago@arago-project.org>;
	Thu, 15 Sep 2016 18:35:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8FIZpNa004064
	for <meta-arago@arago-project.org>; Thu, 15 Sep 2016 13:35:51 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8FIZn9P022384
	for <meta-arago@arago-project.org>; Thu, 15 Sep 2016 13:35:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Sep 2016 13:35:49 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8FIZm2l021260;	Thu, 15 Sep 2016 13:35:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Sep 2016 14:35:09 -0400
Message-ID: <1473964509-21429-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473964509-21429-1-git-send-email-j-stiffler@ti.com>
References: <1473964509-21429-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] openmpacc: bump SRCREV to version 1.4.0.0
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
X-List-Received-Date: Thu, 15 Sep 2016 18:35:52 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
index 7e1adba..f222968 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -2,7 +2,7 @@ SUMMARY = "TI OpenMP Accelerator Model"
 HOMEPAGE = "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
 LICENSE = "BSD"
 
-PV = "1.3.2.0"
+PV = "1.4.0.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62eb0"
@@ -13,7 +13,7 @@ OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
 OMPACC_GIT_PROTOCOL = "git"
 OMPACC_GIT_BRANCH = "master"
 
-OMPACC_SRCREV = "26f6f8ef0ff800da3d49cccd5853c761b0673d2a"
+OMPACC_SRCREV = "af81476c403758bba065b056c63bb7dd4dd92704"
 
 BRANCH = "${OMPACC_GIT_BRANCH}"
 SRC_URI = "${OMPACC_GIT_URI};protocol=${OMPACC_GIT_PROTOCOL};branch=${BRANCH}"
-- 
2.7.4


