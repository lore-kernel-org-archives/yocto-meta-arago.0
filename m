Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E31E2529D4
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2019 16:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA2D840C0C;
	Tue, 19 Nov 2019 16:00:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HvvDpm0CPvpf; Tue, 19 Nov 2019 16:00:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1F97E40BE5;
	Tue, 19 Nov 2019 16:00:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9D3D6174310;
	Tue, 19 Nov 2019 11:00:03 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 19 Nov 2019 11:00:03 -0500
Message-Id: <1574179203-31137-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] packagegroup-ti-world: guard qte and hmi packagegroups by gpu feature
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
X-List-Received-Date: Tue, 19 Nov 2019 16:01:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
index 8457908..6403bf7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
@@ -22,7 +22,7 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-test-addons \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
-    packagegroup-arago-tisdk-qte \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
@@ -33,6 +33,6 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    packagegroup-arago-tisdk-hmi \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
 "
-- 
2.7.4


