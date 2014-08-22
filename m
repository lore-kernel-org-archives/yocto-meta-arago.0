Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A9DD052A3F
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 01:58:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7M1wu79022468
	for <meta-arago@arago-project.org>; Thu, 21 Aug 2014 20:58:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7M1wuwd023251
	for <meta-arago@arago-project.org>; Thu, 21 Aug 2014 20:58:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 21 Aug 2014 20:58:56 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7M1wtK1016037;	Thu, 21 Aug 2014 20:58:55 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7M1wqCh002753;	Fri, 22 Aug 2014 07:28:53 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Aug 2014 20:58:43 -0500
Message-ID: <1408672731-19277-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/9] arago-core-tisdk-image: Set DTB_FILTER for am57xx-evm
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
X-List-Received-Date: Fri, 22 Aug 2014 01:58:58 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Package the  am57xx-evm dtb for am57xx-evm sdk builds

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 2932714..37f71d6 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -20,6 +20,7 @@ DTB_FILTER = "unknown"
 DTB_FILTER_ti33x = "am335x"
 DTB_FILTER_omap5-evm = "omap5"
 DTB_FILTER_dra7xx = "dra7"
+DTB_FILTER_am57xx-evm = "am57xx"
 DTB_FILTER_ti43x = "am43"
 DTB_FILTER_keystone = "k2hk"
 
-- 
1.7.9.5


