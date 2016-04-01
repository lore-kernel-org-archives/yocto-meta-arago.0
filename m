Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id C78AE52A7F
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:41:51 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X00LSTRLR8E10@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=NEAV23lmAAAA:8
	a=PE2iM5pd_dAAC-tPnc0A:9
Received: by 100.15.86.14 with SMTP id 75ad34c2; Fri, 01 Apr 2016 03:41:51 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E8CC6161F65;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:33 -0400
Message-id: <1459482106-27723-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 13/26] eventdump: fix cross-compilation by passing correct parameters
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
X-List-Received-Date: Fri, 01 Apr 2016 03:41:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index c4bb15e..7eabf25 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Utility for parsing system events"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://eventdump.c;beginline=1;endline=34;md5=23b59be24a88ddc407b553035f3fd3e9"
 
-PR = "r1"
+PR = "r2"
 PV = "1.0+git${SRCPV}"
 
 SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
@@ -11,6 +11,8 @@ SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} DEST_DIR=${D} BIN_DIR=${bindir}"
+
 do_install() {
-	oe_runmake 'DEST_DIR=${D}' 'BIN_DIR=${bindir}' install
+	oe_runmake install
 }
-- 
2.2.0


