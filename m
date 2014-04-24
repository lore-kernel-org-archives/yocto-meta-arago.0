Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 49DF452A8F
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 17:18:01 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4J005F8PDVBAS0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 24 Apr 2014 12:17:56 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5108A2011D; Thu,
	24 Apr 2014 13:17:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 24 Apr 2014 13:17:50 -0400
Message-id: <1398359871-24257-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398359871-24257-1-git-send-email-denis@denix.org>
References: <1398359871-24257-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 2/3] local.conf.sample: remove no longer needed BBMASK
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
X-List-Received-Date: Thu, 24 Apr 2014 17:18:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 sample-files/local.conf.sample | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sample-files/local.conf.sample b/sample-files/local.conf.sample
index 24cb44f..66c1d51 100644
--- a/sample-files/local.conf.sample
+++ b/sample-files/local.conf.sample
@@ -149,9 +149,6 @@ PARALLEL_MAKE = "-j 1"
 # By default, go with the "distroless" configuration, when not set
 #DISTRO   = "arago"
 
-# Mask misc recipes for distroless setup
-BBMASK = "meta-ti/recipes-misc"
-
 # Set terminal types by default it expects gnome-terminal
 # but we chose xterm
 TERMCMD = "${XTERM_TERMCMD}"
-- 
1.9.2


