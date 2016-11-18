Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 097EB5299E
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 208A320863;
	Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GD64uYD1oJ6M; Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 052B320AFB;
	Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id E17DE1621AA;
	Fri, 18 Nov 2016 17:09:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 17:09:48 -0500
Message-Id: <1479506990-10407-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479506990-10407-1-git-send-email-denis@denix.org>
References: <1479506990-10407-1-git-send-email-denis@denix.org>
Subject: [PATCH 6/8] eventdump: fix build with any toolchain, pass CC var
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
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index 7eabf25..d01833b 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -1,8 +1,8 @@
-DESCRIPTION = "Utility for parsing system events"
+SUMMARY = "Utility for parsing system events"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://eventdump.c;beginline=1;endline=34;md5=23b59be24a88ddc407b553035f3fd3e9"
 
-PR = "r2"
+PR = "r3"
 PV = "1.0+git${SRCPV}"
 
 SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} DEST_DIR=${D} BIN_DIR=${bindir}"
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} DEST_DIR=${D} BIN_DIR=${bindir} CC="${CC}""
 
 do_install() {
 	oe_runmake install
-- 
2.7.4


