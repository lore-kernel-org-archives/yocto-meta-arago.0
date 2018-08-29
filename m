Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E438452A78
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 00:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 265CA20C5A;
	Wed, 29 Aug 2018 00:14:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id J0RyL3Qh6RSh; Wed, 29 Aug 2018 00:14:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F267820C68;
	Wed, 29 Aug 2018 00:14:03 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 821771635E1;
	Tue, 28 Aug 2018 20:14:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 28 Aug 2018 20:13:57 -0400
Message-Id: <1535501640-23640-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535501640-23640-1-git-send-email-denys@ti.com>
References: <1535501640-23640-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 4/7] packagegroup-arago-cross-canadian: fix leaked deprecated base_conditional
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
X-List-Received-Date: Wed, 29 Aug 2018 00:14:14 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-cross-canadian.bbappend            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
index b05e493..fb728e0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
@@ -6,5 +6,5 @@ SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
                        binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
 
 RDEPENDS_${PN}_append = " \
-    ${@base_conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
+    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
 "
-- 
2.7.4


