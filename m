Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 541C452995
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2020 00:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CBD0840BFC;
	Fri, 24 Jan 2020 00:17:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hUUKoaLV1Fxp; Fri, 24 Jan 2020 00:17:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC2F340AB5;
	Fri, 24 Jan 2020 00:17:23 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 54F4A1743A7;
	Thu, 23 Jan 2020 19:17:23 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 23 Jan 2020 19:17:23 -0500
Message-Id: <1579825043-33779-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] ti-sci-fw: update to 2019.12
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
X-List-Received-Date: Fri, 24 Jan 2020 00:19:14 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2019.10a.bb => ti-sci-fw_2019.12.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.10a.bb => ti-sci-fw_2019.12.bb} (95%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10a.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12.bb
similarity index 95%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10a.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12.bb
index c20239b..80f120c 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10a.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12.bb
@@ -15,9 +15,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "299211f4ed0641f4653d0b7b69ff5a85c42a0268"
+SRCREV = "a692931eba713a099ed9ae41ef4a4f7ba145a706"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "fa5f6d7d289b53d74ae14394678b32f5932b658b"
+SRCREV_imggen = "f91482582808377f850866375d92638ae4c284eb"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4


