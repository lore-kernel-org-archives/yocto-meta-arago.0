Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id EFBCE52A7A
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 00:35:41 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM00BY0UZ6S020@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 13 Oct 2013 19:35:31 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CC332213B1; Sun,
	13 Oct 2013 20:35:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 13 Oct 2013 20:35:18 -0400
Message-id: <1381710923-22471-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381710923-22471-1-git-send-email-denis@denix.org>
References: <1381710923-22471-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/9] init-ifupdown: move init and interfaces files from netbase to new init-ifupdown
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

Follow similar changes in oe-core and meta-ti

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/{netbase/netbase => init-ifupdown/init-ifupdown}/init  | 0
 .../{netbase/netbase => init-ifupdown/init-ifupdown}/interfaces         | 0
 .../netbase_5.0.bbappend => init-ifupdown/init-ifupdown_1.0.bbappend}   | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-distro/recipes-core/{netbase/netbase => init-ifupdown/init-ifupdown}/init (100%)
 rename meta-arago-distro/recipes-core/{netbase/netbase => init-ifupdown/init-ifupdown}/interfaces (100%)
 rename meta-arago-distro/recipes-core/{netbase/netbase_5.0.bbappend => init-ifupdown/init-ifupdown_1.0.bbappend} (79%)

diff --git a/meta-arago-distro/recipes-core/netbase/netbase/init b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
similarity index 100%
rename from meta-arago-distro/recipes-core/netbase/netbase/init
rename to meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
diff --git a/meta-arago-distro/recipes-core/netbase/netbase/interfaces b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/interfaces
similarity index 100%
rename from meta-arago-distro/recipes-core/netbase/netbase/interfaces
rename to meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/interfaces
diff --git a/meta-arago-distro/recipes-core/netbase/netbase_5.0.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
similarity index 79%
rename from meta-arago-distro/recipes-core/netbase/netbase_5.0.bbappend
rename to meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
index 8c65bd1..c0ab069 100644
--- a/meta-arago-distro/recipes-core/netbase/netbase_5.0.bbappend
+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago2"
+PR_append = "-arago0"
-- 
1.8.3.2


