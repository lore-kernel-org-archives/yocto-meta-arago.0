Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 770F0520DF
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2020 18:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3085840C28;
	Thu, 20 Aug 2020 18:03:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HMpD5-Y8pCCP; Thu, 20 Aug 2020 18:03:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A6DF40B2D;
	Thu, 20 Aug 2020 18:03:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C861B17341D;
	Thu, 20 Aug 2020 14:03:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 20 Aug 2020 14:03:03 -0400
Message-Id: <1597946584-11515-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH v2 1/2] packagegroup-arago-tisdk-addons: replace ipc-lld+cpsw9g-eth-fw with ti-rtos-firmware
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
X-List-Received-Date: Thu, 20 Aug 2020 18:05:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also, drop deprecated display sharing fw.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - mentioned dropping display sharing fw

 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2060d64..f2b29e2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -74,8 +74,8 @@ UTILS_append_k3 = " mmc-utils \
                     jailhouse \
 "
 
-UTILS_append_am65xx = " ipc-lld-examples-rtos pru-icss pru-pwm-fw"
-UTILS_append_j7 = " pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
+UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
+UTILS_append_j7 = " ti-rtos-firmware pru-icss"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
2.7.4


