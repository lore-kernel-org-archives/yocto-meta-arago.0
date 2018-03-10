Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4254E52A3F
	for <meta-arago@arago-project.org>;
	Sat, 10 Mar 2018 02:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E87E4208D7;
	Sat, 10 Mar 2018 02:36:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NkrpLZNFWtpF; Sat, 10 Mar 2018 02:36:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BFA532005F;
	Sat, 10 Mar 2018 02:36:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 30B5716332C;
	Fri,  9 Mar 2018 21:36:43 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  9 Mar 2018 21:36:42 -0500
Message-Id: <1520649402-15770-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] external-linaro-toolchain: update to include latest updates for sgx
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
X-List-Received-Date: Sat, 10 Mar 2018 02:37:32 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-linaro-toolchain.bbappend        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
index fa3210b..306c547 100644
--- a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -4,7 +4,7 @@
 # duplication of code from corresponding recipe.
 
 BRANCH = "ti-lsk-linux-4.14.y"
-SRCREV = "57341df0b46c6be612d7487fb0a1df8b056449d8"
+SRCREV = "3bacc614e300e497679bdd7d2759f486e713f373"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
1.7.9.5


