Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 52C9B529AF
	for <meta-arago@arago-project.org>;
	Fri, 19 Oct 2018 05:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5624A20BC4;
	Fri, 19 Oct 2018 05:48:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vQFw9abLuCx9; Fri, 19 Oct 2018 05:48:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3476020BB0;
	Fri, 19 Oct 2018 05:48:13 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A4FB516457D;
	Fri, 19 Oct 2018 01:48:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 19 Oct 2018 01:48:12 -0400
Message-Id: <1539928092-10247-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko-next][PATCH] ti-sci-fw: update to 2018.09 version
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
X-List-Received-Date: Fri, 19 Oct 2018 05:48:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2018.08b.bb => ti-sci-fw_2018.09.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2018.08b.bb => ti-sci-fw_2018.09.bb} (94%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb
similarity index 94%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb
index bf34031..76516b6 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb
@@ -11,9 +11,9 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "463b1b4a50e8e361fa333f87caf74d2e05bc0a82"
+SRCREV = "a18a84895c6d40ba8c4dd439883e227db425232d"
 
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-firmware-next"
 
 SRC_URI = " \
 	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-- 
2.7.4


