Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 430DB52A08
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:17 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00J335RR2S40@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=N5PUbDJB c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=1XWaLZrsAAAA:8	a=YvMztWTk58EDEelq_4oA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F16F4161AC6;	Thu,
	2 Jul 2015 23:02:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:23 -0400
Message-id: <1435892533-6046-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 04/54] opkg: fix accepted upstream, remove locally
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...e-send-Collected-errors-messages-to-stder.patch | 32 ----------------------
 .../recipes-devtools/opkg/opkg_0.2.1.bbappend      |  6 ----
 2 files changed, 38 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg/0001-opkg_message-send-Collected-errors-messages-to-stder.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg_0.2.1.bbappend

diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg/0001-opkg_message-send-Collected-errors-messages-to-stder.patch b/meta-arago-extras/recipes-devtools/opkg/opkg/0001-opkg_message-send-Collected-errors-messages-to-stder.patch
deleted file mode 100644
index dd8291c..0000000
--- a/meta-arago-extras/recipes-devtools/opkg/opkg/0001-opkg_message-send-Collected-errors-messages-to-stder.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 49e49ca76d2c181772e74447b4f231ff260102d7 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 8 Aug 2011 16:59:16 -0400
-Subject: [PATCH] opkg_message: send "Collected errors:" messages to stderr not stdout
-
-Upstream-status: Submitted [http://code.google.com/p/opkg/issues/detail?id=63]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- libopkg/opkg_message.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libopkg/opkg_message.c b/libopkg/opkg_message.c
-index 7114e3a..2862ea6 100644
---- a/libopkg/opkg_message.c
-+++ b/libopkg/opkg_message.c
-@@ -64,10 +64,10 @@ print_error_list(void)
- 	struct errlist *err = error_list_head;
- 
- 	if (err) {
--		printf("Collected errors:\n");
-+		fprintf(stderr, "Collected errors:\n");
- 		/* Here we print the errors collected and free the list */
- 		while (err != NULL) {
--			printf(" * %s", err->errmsg);
-+			fprintf(stderr, " * %s", err->errmsg);
- 			err = err->next;
- 		}
- 	}
--- 
-1.7.0.4
-
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg_0.2.1.bbappend b/meta-arago-extras/recipes-devtools/opkg/opkg_0.2.1.bbappend
deleted file mode 100644
index b215b5e..0000000
--- a/meta-arago-extras/recipes-devtools/opkg/opkg_0.2.1.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# look for files in this layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PR_append = "-arago0"
-
-SRC_URI += "file://0001-opkg_message-send-Collected-errors-messages-to-stder.patch"
-- 
2.2.0


