Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E5DA852988
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 22:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B67240C06;
	Tue, 10 Dec 2019 22:49:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8NpB8uzC-d6T; Tue, 10 Dec 2019 22:49:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 831604087C;
	Tue, 10 Dec 2019 22:49:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DD78417434B;
	Tue, 10 Dec 2019 17:49:51 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 10 Dec 2019 17:49:51 -0500
Message-Id: <1576018191-33660-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] ti-sci-fw: update to 2019.10
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
X-List-Received-Date: Tue, 10 Dec 2019 22:51:28 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2019.09.bb => ti-sci-fw_2019.10.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.09.bb => ti-sci-fw_2019.10.bb} (95%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.09.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10.bb
similarity index 95%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.09.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10.bb
index a61ede3..be57ddb 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.09.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10.bb
@@ -15,9 +15,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "2b292f87e7257d4f9103d4e862a7b1769b13fed7"
+SRCREV = "1707a289d55d91ca0dc22a12eb7745914858e2d1"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "70257db6e89f9c05ae2e87281b25169f4d356cf1"
+SRCREV_imggen = "d42023032b2e7d5487aa28cdbd04addfc4d372ff"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4


