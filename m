Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id E007452A17
	for <meta-arago@arago-project.org>;
	Tue, 12 Jul 2016 00:46:06 +0000 (UTC)
Received: from vz-proxy-m007.mx.aol.com ([64.236.83.14])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA60083LFGUJL30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Jul 2016 19:46:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=pde4HmtcH4r9jvqD2LMA:9
Received: by 100.15.86.14 with SMTP id 24841083; Tue, 12 Jul 2016 00:46:06 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id A8160161B38;	Mon, 11 Jul 2016 20:46:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Jul 2016 20:45:55 -0400
Message-id: <1468284359-16073-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH 1/5] lib/common-functions: allow = sign inside variable value
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
X-List-Received-Date: Tue, 12 Jul 2016 00:46:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/common-functions | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/common-functions b/lib/common-functions
index e0fc8c6..cbd7bdd 100644
--- a/lib/common-functions
+++ b/lib/common-functions
@@ -54,7 +54,7 @@ parse_config_file() {
         # Trim trailing spaces for variables
         var=`echo $line | cut -d= -f1 | tr -d '[:space:]'`
         # Trim leading spaces for the variable value
-        val=`echo $line | cut -d= -f2 | sed -e 's/^[ ]*//'`
+        val=`echo $line | cut -d= -f2- | sed -e 's/^[ ]*//'`
         eval $var=$val
     done < $inputfile
 }
-- 
2.7.4


