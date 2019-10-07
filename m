Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3A5C05298A
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2019 23:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0076540BE9;
	Mon,  7 Oct 2019 23:49:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sIfv7WU6paEE; Mon,  7 Oct 2019 23:49:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDA2740BC0;
	Mon,  7 Oct 2019 23:49:36 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 22917174221;
	Mon,  7 Oct 2019 19:49:36 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  7 Oct 2019 19:49:35 -0400
Message-Id: <1570492175-28079-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] Revert "packagegroup-arago-tisdk-addons: replacing ipc-lld-fw"
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
X-List-Received-Date: Mon, 07 Oct 2019 23:50:51 -0000

This reverts commit 31c3f87ed665991799c798afea0a84e1e1851746.
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8c4a6e4..d39fe1d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -77,8 +77,8 @@ UTILS_append_k3 = " mmc-utils \
                     jailhouse \
 "
 
-UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss"
-UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
+UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss"
+UTILS_append_j7-evm = " ipc-lld-fw pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
2.7.4


