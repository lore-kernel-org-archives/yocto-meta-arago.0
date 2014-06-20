Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 2499252AA4
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 17:57:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H00JY8B7CY640@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 12:57:14 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E038E22F54; Fri,
	20 Jun 2014 13:57:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:49 -0400
Message-id: <1403287009-11256-20-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 19/19] arago.conf: update version, remove FETCHCMD_wget workaround
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
X-List-Received-Date: Fri, 20 Jun 2014 17:57:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b652fda..7d916e3 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2014.05"
+DISTRO_VERSION = "2014.06"
 
 # SDK paths and names
 SDK_NAME_PREFIX = "arago"
@@ -13,9 +13,6 @@ SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
-# Bump the connection timeout to 5 minutes to overcome slow proxy servers
-FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 300 -nv --passive-ftp --no-check-certificate"
-
 # Also build 32bit Pseudo on 64bit machines, fix error when preloading libpseudo.so
 NO32LIBS = "0"
 
-- 
2.0.0


