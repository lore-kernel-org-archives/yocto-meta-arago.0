Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 166AC52A71
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 15:12:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QFC0hO006641
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:00 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QFC0A2014851
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 10:12:00 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 10:11:59 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QFBsFg032671;
	Wed, 26 Jun 2013 10:11:58 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 10:24:55 -0500
Message-ID: <1372260299-3134-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372260299-3134-1-git-send-email-fcooper@ti.com>
References: <1372260299-3134-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/6] am-sysinfo: Pull in updated commit to fix the CCS project file.
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
X-List-Received-Date: Wed, 26 Jun 2013 15:12:01 -0000
Content-Type: text/plain

* The CCS project file now contains symbols that the SDK installer will replace
  with correct values when the SDK is installed.
* This makes it easier to manage changes in the toolchain sdk structure.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 153d1f0..5d13ad5 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -6,17 +6,17 @@ LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e7
 SECTION = "system"
 
 PACKAGE_STRIP = "no"
-PR = "r7"
+PR = "r8"
 
 BRANCH ?= "master"
-SRCREV = "30c1dd8da089da41cac5686a0bebacc8950a8805"
+SRCREV = "7aa7e7a316d24c06c8e6a4931f7297f209dfd8e1"
 
 SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-
 do_compile() {
+
 	export CROSS_COMPILE=${TARGET_PREFIX}
 	export CFLAGS='${TARGET_CC_ARCH}'
 	# build the release version
-- 
1.7.0.4


