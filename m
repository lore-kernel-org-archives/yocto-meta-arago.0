Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8275F520C1
	for <meta-arago@arago-project.org>;
	Tue, 30 Oct 2018 01:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1714920B2F;
	Tue, 30 Oct 2018 01:32:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8cHcrh5Dq4Hi; Tue, 30 Oct 2018 01:32:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 00C2A20384;
	Tue, 30 Oct 2018 01:32:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 77A20164901;
	Mon, 29 Oct 2018 21:32:16 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 29 Oct 2018 21:32:15 -0400
Message-Id: <1540863135-28990-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] ti-sci-fw: update imggen code with R5 IRQ partitioning fix
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
X-List-Received-Date: Tue, 30 Oct 2018 01:32:28 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb
index 7ee6273..f436de4 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.09.bb
@@ -20,7 +20,7 @@ SRC_URI = " \
 	git://git.ti.com/processor-firmware/system-firmware-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
-SRCREV_imggen = "8641afac31fae30472edcef797d17d66a335f960"
+SRCREV_imggen = "3cbf4003060ead508653e2ec8f25c59bbe813e74"
 SRCREV_FORMAT = "imggen"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


