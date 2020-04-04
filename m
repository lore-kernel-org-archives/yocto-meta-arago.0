Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2944A529A5
	for <meta-arago@arago-project.org>;
	Sat,  4 Apr 2020 01:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 404C240AF7;
	Sat,  4 Apr 2020 01:09:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DT-MG25xAj3U; Sat,  4 Apr 2020 01:09:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26A9D40027;
	Sat,  4 Apr 2020 01:09:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 699F117126C;
	Fri,  3 Apr 2020 21:09:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  3 Apr 2020 21:09:52 -0400
Message-Id: <1585962592-41889-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] ti-sci-fw: update SYSFW to 2020.02
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
X-List-Received-Date: Sat, 04 Apr 2020 01:12:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2019.12b.bb => ti-sci-fw_2020.02.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.12b.bb => ti-sci-fw_2020.02.bb} (95%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12b.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb
similarity index 95%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12b.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb
index bff9d6e..d73e919 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12b.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb
@@ -15,9 +15,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "6a07e130e7dac6b49c9e516ffc84e33a68155260"
+SRCREV = "7f9b01f1ff05eaf375b3e591bfe18dffb4e24c15"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "642da4e2a01ea5d8a553ae0d674839cd5e0715b9"
+SRCREV_imggen = "93c0ee5566a075d1f82678b3ba607bfe3f0d1ce6"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4


