Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 17DC952AF2
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 22:01:21 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O43000KPP68AP60@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 15 Mar 2016 17:01:20 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=PdtXcO8pJYN-CpjZQHgA:9
Received: by 100.15.86.14 with SMTP id 210c4efb; Tue, 15 Mar 2016 22:01:20 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8E293161F22;	Tue,
	15 Mar 2016 18:01:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 15 Mar 2016 18:01:18 -0400
Message-id: <1458079278-20711-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gcc-crosssdk: enable NLS and GNU locales for clacc host tool to work properly in devkit
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
X-List-Received-Date: Tue, 15 Mar 2016 22:01:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/gcc/gcc-crosssdk_linaro-4.9.bbappend             | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_linaro-4.9.bbappend

diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_linaro-4.9.bbappend b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_linaro-4.9.bbappend
new file mode 100644
index 0000000..c30369d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_linaro-4.9.bbappend
@@ -0,0 +1,4 @@
+# Need to enable NLS and GNU locales for clacc locale support to work properly in the devkit
+USE_NLS = "yes"
+EXTRA_OECONF_remove = "--disable-nls"
+EXTRA_OECONF_append = " --enable-nls --enable-clocale=gnu"
-- 
2.2.0


