Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 068A5529A8
	for <meta-arago@arago-project.org>;
	Mon, 23 Mar 2020 23:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7F29940CD4;
	Mon, 23 Mar 2020 23:39:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id c1f9ORyPABlv; Mon, 23 Mar 2020 23:39:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 69B3940CC7;
	Mon, 23 Mar 2020 23:39:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 855BC1718E5;
	Mon, 23 Mar 2020 19:39:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Mar 2020 19:39:24 -0400
Message-Id: <1585006764-20750-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585006764-20750-1-git-send-email-denis@denix.org>
References: <1585006764-20750-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 2/2] ti-world: re-enable chromium-ozon-wayland
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
X-List-Received-Date: Mon, 23 Mar 2020 23:41:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 9244d49..e46a1b4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -8,12 +8,12 @@ inherit packagegroup
 INSANE_SKIP_${PN} += "dev-deps"
 
 CHROMIUM = ""
-#CHROMIUM_append_omap-a15 = "\
-#    chromium-ozone-wayland \
-#"
-#CHROMIUM_append_k3 = "\
-#    chromium-ozone-wayland \
-#"
+CHROMIUM_append_omap-a15 = "\
+    chromium-ozone-wayland \
+"
+CHROMIUM_append_k3 = "\
+    chromium-ozone-wayland \
+"
 
 EXTRABROWSERS = " \
     qtwebbrowser-examples \
-- 
2.7.4


