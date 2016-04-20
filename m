Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id CAB8E52A5B
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:50 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00DI96BX0R40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=NoPnThLtjExUehqcGK0A:9
Received: by 100.15.86.14 with SMTP id 05f56cfd; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B2AF6161FB9;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:15 -0400
Message-id: <1461180805-25733-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 06/16] dosfstools: remove large-file bbappend, oe-core now has it
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/dosfstools/dosfstools_2.11.bbappend             | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend

diff --git a/meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend b/meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend
deleted file mode 100644
index 52a539b..0000000
--- a/meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-arago0"
-
-# Add large file support and increase allowable FAT partition size.
-CFLAGS_append = " -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
-CFLAGS_append_libc-uclibc = ' ${@base_contains("DISTRO_FEATURES", "largefile", "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64", "", d)}'
-- 
2.2.0


