Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id F0107529C0
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2015 05:28:54 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NZ400GZRN83B5N1@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Dec 2015 23:28:52 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=HihYlcsHAAAA:8	a=WTBVgR4bEvGbKzlNsnUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8BBC6161D30;	Thu,
	10 Dec 2015 00:28:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 10 Dec 2015 00:28:50 -0500
Message-id: <1449725330-24270-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ltp-ddt: update to the latest rev
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
X-List-Received-Date: Thu, 10 Dec 2015 05:29:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index 2bf9de4..1140cdc 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r8"
+PR = "r9"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -16,7 +16,7 @@ inherit autotools-brokensep module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "23dd00e6f29ff5777dd1b851fd41103ebccecacd"
+SRCREV = "4a2129a1fefdd065dcaedb415ffa1da46ef9ceb6"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
2.2.0


