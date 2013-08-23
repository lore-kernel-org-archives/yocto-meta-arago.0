Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 88AD052A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:17:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS000MER303J7V0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 23 Aug 2013 15:16:52 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3AB5B200E2; Fri,
	23 Aug 2013 16:16:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 23 Aug 2013 16:16:40 -0400
Message-id: <1377289002-20230-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1377289002-20230-1-git-send-email-denis@denix.org>
References: <1377289002-20230-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/4] toolchain-linaro.inc: set default tunes for am437x-evm
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
X-List-Received-Date: Fri, 23 Aug 2013 20:17:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 45bc715..1ab13ee 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -7,6 +7,7 @@ DEFAULTTUNE = "cortexa8thf-neon"
 DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
 DEFAULTTUNE_keystone = "cortexa15thf-neon"
 DEFAULTTUNE_omap4 = "cortexa9thf-neon"
+DEFAULTTUNE_ti43x = "cortexa9thf-neon"
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
 
-- 
1.8.3.2


