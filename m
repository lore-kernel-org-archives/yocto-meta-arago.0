Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id AB5A752A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:42:18 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X0017SRLRYG20@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:42:02 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=NEAV23lmAAAA:8
	a=LrfmdQgV0UJwxSrRAf4A:9
Received: by 100.15.86.14 with SMTP id 4869ce4c; Fri, 01 Apr 2016 03:42:01 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DE5EA161F64;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:32 -0400
Message-id: <1459482106-27723-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 12/26] cpuloadgen: fix cross-compilation by passing correct parameters
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
X-List-Received-Date: Fri, 01 Apr 2016 03:42:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index a44083a..99bc6a4 100644
--- a/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -14,7 +14,9 @@ SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=git;branch=${BRANCH
 
 S = "${WORKDIR}/git"
 
+EXTRA_OEMAKE = "DESTDIR=${D}${bindir} CROSS_COMPILE=${TARGET_PREFIX}"
+
 do_install () {
     install -d ${D}${bindir}
-    oe_runmake DESTDIR=${D}${bindir} install
+    oe_runmake install
 }
-- 
2.2.0


