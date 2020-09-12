Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 409CB5297D
	for <meta-arago@arago-project.org>;
	Sat, 12 Sep 2020 00:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DBAB140C23;
	Sat, 12 Sep 2020 00:52:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KPdIuOxYFCUT; Sat, 12 Sep 2020 00:52:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B83F140A28;
	Sat, 12 Sep 2020 00:52:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 208A217446E;
	Fri, 11 Sep 2020 20:52:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 11 Sep 2020 20:52:17 -0400
Message-Id: <1599871937-22189-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] packagegroups: only add pru-icss to j7-evm (j721e)
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
X-List-Received-Date: Sat, 12 Sep 2020 00:55:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

As j7200-evm is also a member of j7 family, but has no PRU.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 6 +++++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index adfcfa3..46817f9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -42,7 +42,11 @@ UTILS_append_k3 = " \
     trusted-firmware-a-src \
 "
 
-UTILS_append_j7 = " \
+UTILS_append_j7-evm = " \
+    pru-icss-src \
+"
+
+UTILS_append_j7-hs-evm = " \
     pru-icss-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f2b29e2..e2c3774 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -75,7 +75,9 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
-UTILS_append_j7 = " ti-rtos-firmware pru-icss"
+UTILS_append_j7 = " ti-rtos-firmware"
+UTILS_append_j7-evm = " pru-icss"
+UTILS_append_j7-hs-evm = " pru-icss"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
2.7.4


