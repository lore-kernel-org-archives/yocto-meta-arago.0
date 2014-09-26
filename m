Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 27B8D52007
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 15:41:15 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCI000ZUM831140@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Sep 2014 10:40:59 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7D0622064A; Fri,
	26 Sep 2014 11:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Sep 2014 11:40:35 -0400
Message-id: <1411746038-21612-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1411746038-21612-1-git-send-email-denis@denix.org>
References: <1411746038-21612-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/7] wayland_1.5.0.bbappend: remove no longer needed bbappend
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
X-List-Received-Date: Fri, 26 Sep 2014 15:41:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend
deleted file mode 100644
index 47ff4db..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago0"
-
-SRCREV = "b24fa4c8216e3f0f7b644c7b8c6949925f19ada9"
-- 
2.0.4


