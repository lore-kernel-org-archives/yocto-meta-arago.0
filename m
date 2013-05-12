Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4DDE752A38
	for <meta-arago@arago-project.org>;
	Sun, 12 May 2013 23:13:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4CNDHEL010464
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:13:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4CNDHJ5015894
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:13:17 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 12 May 2013 18:13:17 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4CNDBag016294;
	Sun, 12 May 2013 18:13:16 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 12 May 2013 18:13:07 -0500
Message-ID: <1368400388-28708-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1368400388-28708-1-git-send-email-fcooper@ti.com>
References: <1368400388-28708-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] ltp-ddt-legacy: Duplicate ltp-ddt append
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
X-List-Received-Date: Sun, 12 May 2013 23:13:18 -0000
Content-Type: text/plain

* Copy append from ltp-ddt recipe which includes essential changes.

* Duplicate essential ltp-ddt bb append
Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ..._0.0.4.bbappend => ltp-ddt-legacy_1.0.bbappend} |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)
 copy meta-arago-distro/recipes-devtools/ltp-ddt/{ltp-ddt_0.0.4.bbappend => ltp-ddt-legacy_1.0.bbappend} (90%)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
similarity index 90%
copy from meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
copy to meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
index f8c99d8..65a16f9 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
@@ -3,10 +3,6 @@ PR_append = "-arago0+gitr${SRCPV}"
 # Auto rev so we pick up the latest changes
 SRCREV = "${AUTOREV}"
 
-# Use special branch for platforms with older <=3.2 kernel
-BRANCH_am37x-evm = "v3.2"
-BRANCH_am180x-evm = "v3.2"
-
 do_compile_kmodules() {
         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
         oe_runmake modules
-- 
1.7.0.4


