Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 123B352A1A
	for <meta-arago@arago-project.org>;
	Fri, 29 Jul 2016 17:35:52 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OB300CPS7J3EN30@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 29 Jul 2016 12:35:32 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=lQw1ReBiijulbxZ20icA:9
Received: by 100.15.86.14 with SMTP id 24a505d1; Fri, 29 Jul 2016 17:35:31 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 0CFAE161B38;	Fri, 29 Jul 2016 13:35:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 Jul 2016 13:35:26 -0400
Message-id: <1469813726-29576-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] layer.conf: add cryptodev-module to safe ABI list
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
X-List-Received-Date: Fri, 29 Jul 2016 17:35:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

This prevents repackaging openssl for different machines, since it depends
on cryptodev-module.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 4f8f8a6..f4e2a17 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -18,4 +18,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     eudev \
     weston-conf \
     qtbase-conf \
+    cryptodev-module \
 "
-- 
2.7.4


