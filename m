Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8CAC5529F8
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 00:33:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C0Xpw0011989
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:33:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C0Xnjo020310
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:33:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 19:33:49 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2C0XmVs021798;	Wed, 11 Mar 2015 19:33:49 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t2C0Xje3024854;	Thu, 12 Mar 2015 06:03:47 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2015 19:33:41 -0500
Message-ID: <1426120423-27425-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426120423-27425-1-git-send-email-fcooper@ti.com>
References: <1426120423-27425-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] stream: Update commit to include building openmp version of stream
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
X-List-Received-Date: Thu, 12 Mar 2015 00:33:51 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-benchmark/stream/stream_git.bb         |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_git.bb b/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
index 75955da..6a86dc9 100644
--- a/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
@@ -4,21 +4,26 @@ LICENSE = "Stream_Benchmark_License"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bca8cbe07976fe64c8946378d08314b0"
 SECTION = "system"
 
-PR = "r1"
+PR = "r2"
 
 BRANCH ?= "master"
-SRCREV = "bd474633b7b0352211b48d84065bf7b7e166e4c2"
+SRCREV = "b66f2bab5d6d0b35732ef8406ae03873725a3306"
 
 SRC_URI = "git://git.ti.com/sitara-linux/stream.git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
+PACKAGES =+ "${PN}-openmp"
+
 do_compile() {
 	# build the release version
-	oe_runmake stream_linux
+	oe_runmake
 }
 
 do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${S}/stream_c ${D}/${bindir}/
+	install -m 0755 ${S}/stream_c_openmp ${D}/${bindir}/
 }
+
+FILES_${PN}-openmp = "${bindir}/stream_c_openmp"
-- 
1.7.9.5


