Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 7D65652A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:42:04 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X00DKIRLRM380@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=M7vdlXD7Sg3jjoq2kbsA:9
Received: by 100.15.86.14 with SMTP id 6502f369; Fri, 01 Apr 2016 03:41:52 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EA49B161F66;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:34 -0400
Message-id: <1459482106-27723-15-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 14/26] serialcheck: fix cross-compilation by passing correct parameters
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
X-List-Received-Date: Fri, 01 Apr 2016 03:42:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
index 9cfb6da..16d3ddd 100644
--- a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -14,7 +14,7 @@ CLEANBROKEN = "1"
 
 S = "${WORKDIR}/git"
 
-CFLAGS_prepend = "-Wall -Wextra -Wno-sign-compare -Wno-pointer-sign "
+EXTRA_OEMAKE = "CC="${CC}""
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.2.0


