Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 67A2452A7A
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 00:35:42 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM0097EUZ7VE30@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 13 Oct 2013 19:35:32 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DC0D3214E7; Sun,
	13 Oct 2013 20:35:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 13 Oct 2013 20:35:20 -0400
Message-id: <1381710923-22471-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381710923-22471-1-git-send-email-denis@denix.org>
References: <1381710923-22471-1-git-send-email-denis@denix.org>
Subject: [PATCH 6/9] gettext: remove local bbappend that got merged upstream
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
X-List-Received-Date: Mon, 14 Oct 2013 00:35:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend

diff --git a/meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend b/meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend
deleted file mode 100644
index 58082a6..0000000
--- a/meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago0"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


