Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 1436652A6D
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 23:07:02 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAB00E9AK7CG960@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Aug 2014 18:06:49 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6300B2008C; Thu,
	14 Aug 2014 19:06:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 14 Aug 2014 19:06:46 -0400
Message-id: <1408057607-15900-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH 1/2] omapconf: update to 1.70 version, add am335x support
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
X-List-Received-Date: Thu, 14 Aug 2014 23:07:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 2170d9e..590b3a5 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -4,13 +4,13 @@ HOMEPAGE = "https://github.com/omapconf/omapconf"
 LICENSE = "GPLv2 BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
 
-PV = "1.68"
+PV = "1.70"
 PR = "r0"
 
-COMPATIBLE_MACHINE = "omap-a15|omap4"
+COMPATIBLE_MACHINE = "ti33x|omap-a15|omap4"
 
 BRANCH ?= "master"
-SRCREV = "51fa0acb6ae24a9f14b11bc4b56c4f764b017f3f"
+SRCREV = "f24676c8283b94216a8cb1d398bdb00ec1324946"
 
 SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
 
-- 
2.0.4


