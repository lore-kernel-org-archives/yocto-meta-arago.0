Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C0CB8529B1
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2019 17:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D40F440BF3;
	Wed,  9 Oct 2019 17:54:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NF-pQ6DoULks; Wed,  9 Oct 2019 17:54:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B91EE40BE5;
	Wed,  9 Oct 2019 17:54:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C362D174282;
	Wed,  9 Oct 2019 13:54:28 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  9 Oct 2019 13:54:28 -0400
Message-Id: <1570643668-13431-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] Revert "recipes-bsp: ti-sci-fw: Enable traces for j7-evm"
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
X-List-Received-Date: Wed, 09 Oct 2019 17:55:45 -0000

This reverts commit 708accb8b4e2d615066c4b5280583c2e60eebdd7.
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
index e7cf1a8..fab4de4 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
@@ -72,9 +72,6 @@ EXTRA_OEMAKE_append_am65xx-hs-evm = " \
     HS=1 SYSFW_HS_PATH="${WORKDIR}/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${WORKDIR}/${SYSFW_BASE}-cert.bin" \
 "
 
-EXTRA_OEMAKE_append_j7-evm = " \
-    ENABLE_TRACE=1 \
-"
 do_compile() {
 	cd ${WORKDIR}/imggen/
 	oe_runmake
-- 
2.7.4


