Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0068E5299E
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ECB7520863;
	Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZOHnktc5_TnC; Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7AFFD2084E;
	Fri, 18 Nov 2016 22:09:52 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id A4DCB1621A4;
	Fri, 18 Nov 2016 17:09:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 17:09:43 -0500
Message-Id: <1479506990-10407-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479506990-10407-1-git-send-email-denis@denix.org>
References: <1479506990-10407-1-git-send-email-denis@denix.org>
Subject: [PATCH 1/8] arm-benchmarks: fix build with any toolchain, pass CC var
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
X-List-Received-Date: Fri, 18 Nov 2016 22:09:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb        | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 7e75a74..d167f08 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -1,10 +1,10 @@
-DESCRIPTION = "ARM Benchmarks"
+SUMMARY = "ARM Benchmarks"
 HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r11"
+PR = "r12"
 
 BRANCH ?= "master"
 SRCREV = "5bcbca9b3d75a6aa6d0e25132cc36a6ad2883de3"
@@ -14,14 +14,12 @@ SRC_URI = "git://git.ti.com/apps/arm_benchmarks.git;protocol=git;branch=${BRANCH
 S = "${WORKDIR}/git"
 
 do_compile() {
-
 	export CROSS_COMPILE=${TARGET_PREFIX}
 	export CFLAGS='${TARGET_CC_ARCH}'
 	# build the release version
-	oe_runmake release
+	oe_runmake release CC="${CC}"
 }
 do_install() {
 
 	oe_runmake DESTDIR=${D} install
 }
-
-- 
2.7.4


