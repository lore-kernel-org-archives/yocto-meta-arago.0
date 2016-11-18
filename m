Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1F86D529C6
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3DDFF2084E;
	Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xTOs8D7ZXuGx; Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 16F5B2098D;
	Fri, 18 Nov 2016 22:09:54 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id D5B4D1621A9;
	Fri, 18 Nov 2016 17:09:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 17:09:47 -0500
Message-Id: <1479506990-10407-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479506990-10407-1-git-send-email-denis@denix.org>
References: <1479506990-10407-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/8] cpuloadgen: fix build with any toolchain, pass CC var
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
X-List-Received-Date: Fri, 18 Nov 2016 22:09:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index 99bc6a4..a792060 100644
--- a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6c2eb46c569d0cd7884089fea6b4f31"
 
 PV = "0.93"
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
 SRCREV ?= "301d69899d6f4d84f143e0ed86957eea416a27a6"
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=git;branch=${BRANCH
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "DESTDIR=${D}${bindir} CROSS_COMPILE=${TARGET_PREFIX}"
+EXTRA_OEMAKE = "DESTDIR=${D}${bindir} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
 
 do_install () {
     install -d ${D}${bindir}
-- 
2.7.4


