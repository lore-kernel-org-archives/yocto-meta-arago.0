Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7A291529AD
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2019 22:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 86E5940B0A;
	Mon, 25 Feb 2019 22:28:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NgXOz8lMqzZG; Mon, 25 Feb 2019 22:28:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D474403F2;
	Mon, 25 Feb 2019 22:28:42 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 10DA516ACB6;
	Mon, 25 Feb 2019 17:28:42 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2019 17:28:41 -0500
Message-Id: <1551133721-15338-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] meta-toolchain-arago-tisdk-server: fix install of TI OCL, CGT nativesdk tools
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
X-List-Received-Date: Mon, 25 Feb 2019 22:28:48 -0000

Previous commit 01b4c2ef967779e79b9367e439955b8466ccd04f changed meta-toolchain-arago
to be a bare devkit w/o those tools. Since "server" devkit was not using "qte"
packagegroup, it accidentally lost those tools as well, affecting K2 platforms.
Fix it by using the correct "tisdk" packagegroup for TOOLCHAIN_HOST_TASK.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
index f972eaa..3e781d0 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
@@ -1,3 +1,4 @@
+TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-tisdk-host"
 TOOLCHAIN_SUFFIX ?= "-tisdk-server"
 
 require meta-toolchain-arago-tisdk.inc
-- 
2.7.4


