Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 451A052A5D
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 03:54:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4F3siSg032067
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4F3siiK014477
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:44 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 22:54:44 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4F3sXkR004084;
	Tue, 14 May 2013 22:54:42 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 May 2013 22:54:24 -0500
Message-ID: <1368590069-6700-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1368590069-6700-1-git-send-email-fcooper@ti.com>
References: <1368590069-6700-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/9] arago.conf: Drop SDKPATH a little bit lower
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
X-List-Received-Date: Wed, 15 May 2013 03:54:45 -0000
Content-Type: text/plain

* Some recipes are still failing to build due to the length of the SDKPATH.
* Reduce the path a little bit more to fix this problem.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index d20823a..078a740 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -8,7 +8,7 @@ SDK_VERSION = "${DISTRO_VERSION}"
 SDK_VENDOR = "-${SDK_NAME_PREFIX}"
 SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH_REAL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
-SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
+SDKPATH = "${@"/tmp/"+"x"*80+"/"+"y"*80}"
 
 # Mask some broken recipes
 BBMASK = "meta-ti/recipes-misc|meta-linaro/recipes-lamp|meta-oe/recipes-extended/lighttpd|meta-linaro/recipes-core/netbase"
-- 
1.7.0.4


