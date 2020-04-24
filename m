Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id F209F52A52
	for <meta-arago@arago-project.org>;
	Fri, 24 Apr 2020 20:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8016140C1F;
	Fri, 24 Apr 2020 20:18:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JfjK2wRzmoQB; Fri, 24 Apr 2020 20:18:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63A5040A9E;
	Fri, 24 Apr 2020 20:18:41 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BB0C9172564;
	Fri, 24 Apr 2020 16:18:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Apr 2020 16:18:40 -0400
Message-Id: <1587759520-26955-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-sci-fw: upgrade 2020.02 -> 2020.03
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
X-List-Received-Date: Fri, 24 Apr 2020 20:21:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2020.02.bb => ti-sci-fw_2020.03.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.02.bb => ti-sci-fw_2020.03.bb} (96%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.03.bb
similarity index 96%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.03.bb
index 4dba62b..bae8e5c 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.03.bb
@@ -15,9 +15,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "7f9b01f1ff05eaf375b3e591bfe18dffb4e24c15"
+SRCREV = "1c5f73de97c27d99dd8672d9c26c450cd9a4677d"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "93c0ee5566a075d1f82678b3ba607bfe3f0d1ce6"
+SRCREV_imggen = "79f3807e0b169f2029dec9f3a679c231f4deb625"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4


