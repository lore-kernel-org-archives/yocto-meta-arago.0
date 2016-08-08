Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 875DA5208C
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 13:40:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78De9Jm024487
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 08:40:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78De967026550
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 08:40:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 08:40:08 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78De8Zl002651;	Mon, 8 Aug 2016 08:40:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 09:39:29 -0400
Message-ID: <1470663570-5175-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470663570-5175-1-git-send-email-j-stiffler@ti.com>
References: <1470663570-5175-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] copy-defconfig: add ARAGO_KERNEL_SUFFIX to defconfig name
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
X-List-Received-Date: Mon, 08 Aug 2016 13:40:11 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
index 46de4a3..ffc8b2b 100644
--- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
+++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
@@ -1,4 +1,4 @@
-CONFIG_NAME ?= "tisdk_${MACHINE}_defconfig"
+CONFIG_NAME ?= "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
 
 # Copy the configuration file used during the SDK build in Arago to
 # the kernel sources to be packaged into the sourceipk.  Then call
-- 
2.7.4


