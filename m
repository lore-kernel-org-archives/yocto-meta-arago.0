Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 8226052972
	for <meta-arago@arago-project.org>;
	Thu, 31 Jul 2014 18:31:21 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9L00AWKA43DY20@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Jul 2014 13:31:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 683EF20187; Thu,
	31 Jul 2014 14:31:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Jul 2014 14:31:14 -0400
Message-id: <1406831474-1160-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
In-reply-to: <1406831474-1160-1-git-send-email-denis@denix.org>
References: <1406831474-1160-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] u-boot: update AUTOREV bbappend from mainline to ti-staging
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
X-List-Received-Date: Thu, 31 Jul 2014 18:31:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{u-boot_2014.07.bbappend => u-boot-ti-staging_2014.07.bbappend}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-bsp/u-boot/{u-boot_2014.07.bbappend => u-boot-ti-staging_2014.07.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-bsp/u-boot/u-boot_2014.07.bbappend
rename to meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
-- 
2.0.2


