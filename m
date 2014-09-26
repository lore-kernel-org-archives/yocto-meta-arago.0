Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 48074529B7
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 15:41:15 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCI00I4BM8B7N70@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Sep 2014 10:41:04 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9465B235E6; Fri,
	26 Sep 2014 11:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Sep 2014 11:40:38 -0400
Message-id: <1411746038-21612-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1411746038-21612-1-git-send-email-denis@denix.org>
References: <1411746038-21612-1-git-send-email-denis@denix.org>
Subject: [PATCH 7/7] arago.conf: enable libinput PACKAGECONFIG for weston
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
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index d1e83b7..37fc5ab 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -27,7 +27,7 @@ QT_PROVIDER = "qt5"
 
 # Distro-specific package configuration
 # Weston - use fbdev compositor and provide launcher
-PACKAGECONFIG_pn-weston = "fbdev launch"
+PACKAGECONFIG_pn-weston = "fbdev launch libinput"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-- 
2.0.4


