Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 9405352A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 18:06:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H005G3BNFMEC0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 13:06:51 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 86EAD255E2; Fri,
	20 Jun 2014 13:57:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:41 -0400
Message-id: <1403287009-11256-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 11/19] wl18xx-firmware: specify the branch being used for this version
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
X-List-Received-Date: Fri, 20 Jun 2014 18:06:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Bitbake fetcher now requires the branch to be specified when SRCREV is not on master

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
index 5db1c99..b59f1c4 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
@@ -13,7 +13,7 @@ RCONFLICTS_${PN} += "wl12xx-firmware"
 
 # Tag: ol_r8.a8.10
 SRCREV = "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
-SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
+SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git;branch=mbss \
            file://0001-Add-Makefile-for-SDK.patch \
           "
 
-- 
2.0.0


