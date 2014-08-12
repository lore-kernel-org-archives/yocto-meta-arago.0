Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 7A48252976
	for <meta-arago@arago-project.org>;
	Tue, 12 Aug 2014 16:30:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NA700B6ZCIGOX71@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Aug 2014 11:30:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 370B72008C; Tue,
	12 Aug 2014 12:30:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Aug 2014 12:30:15 -0400
Message-id: <1407861015-29693-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] u-boot: switch to git for github access
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
X-List-Received-Date: Tue, 12 Aug 2014 16:30:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
index 1243058..b81d74e 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
@@ -1,7 +1,7 @@
 # Append the base 2014.07 u-boot mainline recipe to AUTOREV for now so that
 # we can test the latest mainline
 
-PR_append = "-arago2+gitr${SRCPV}"
+PR_append = "-arago3+gitr${SRCPV}"
 
 # AM57x EVM is currently on a seperate git tree/branch.
 # Once the software has been integrated to the u-boot-ti-staging
@@ -12,6 +12,6 @@ SRC_URI_am57xx-evm := "${@oe_filter_out('git://git.ti.com/ti-u-boot/ti-u-boot.gi
 
 BRANCH_am57xx-evm = "beaglex15"
 
-SRC_URI_am57xx-evm += "git://github.com/felipebalbi/u-boot.git;protocol=https;branch=${BRANCH}"
+SRC_URI_am57xx-evm += "git://github.com/felipebalbi/u-boot.git;protocol=git;branch=${BRANCH}"
 
 SRCREV = "${AUTOREV}"
-- 
2.0.4


