Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id C49C552A1C
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 08:05:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHS00MTKH4SVFZ4@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 06 Feb 2013 02:05:22 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B192320077; Wed,
	06 Feb 2013 03:05:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 06 Feb 2013 03:05:07 -0500
Message-id: <1360137907-18916-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] arago.conf: HACK! for rpath substitution, hardcode a longer path
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
X-List-Received-Date: Wed, 06 Feb 2013 08:05:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

The new devkit framework uses rpath for relocatability and requires the
initial rpath to be longer than the one replaced with using $ORIGIN.
Need to properly rework the old stub-based method we used in denzil with
this new one, but unblock the rpath substitution for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b72959d..4a5234e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -3,7 +3,7 @@ DISTRO_NAME = "Arago"
 DISTRO_VERSION = "2012.12"
 
 # SDK paths and names
-SDK_NAME_PREFIX = "arago"
+SDK_NAME_PREFIX = "fixme-here-goes-a-very-long-pathname-to-work-with-rpath-substitution"
 SDK_VERSION = "${DISTRO_VERSION}"
 SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH = "/${SDK_NAME_PREFIX}-${SDK_VERSION}"
-- 
1.8.1.2


