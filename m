Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 21D1052974
	for <meta-arago@arago-project.org>;
	Wed,  2 Dec 2015 01:54:02 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NYP001JCJXLEA00@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Dec 2015 19:53:46 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=5th-gWMazHyPdSAGWDIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7A51D161D30;	Tue,
	1 Dec 2015 20:53:45 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Dec 2015 20:53:40 -0500
Message-id: <1449021220-25179-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] meta-arago-toolchain: fix relocation of default library paths
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
X-List-Received-Date: Wed, 02 Dec 2015 01:54:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Pass the actual SDKPATH to relocation script instead of what we want the
default to be (confusingly named SDKPATH_REAL). Since most of the binaries
use relative library paths (via $ORIGIN) anyways, it wasn't causing much
trouble. But git uses a set of commands executed from /usr/lib/git/git-core
and those binaries fail to locate libraries relative to that path and fall
back to default library paths, but those were not properly updated by the
relocation script, as it was looking for SDKPATH_REAL instead of SDKPATH.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index cda39a6..729f1dd 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -112,7 +112,7 @@ fakeroot create_sdk_files() {
 
 	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
 	# Escape special characters like '+' and '.' in the SDKPATH
-	escaped_sdkpath=$(echo ${SDKPATH_REAL} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
+	escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
-- 
1.7.9.5


