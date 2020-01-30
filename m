Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 17B8452A32
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2020 05:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8E13840A52;
	Thu, 30 Jan 2020 05:12:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AQb___i-TonY; Thu, 30 Jan 2020 05:12:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7590C40C06;
	Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 358DD1743BD;
	Thu, 30 Jan 2020 00:12:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jan 2020 00:12:51 -0500
Message-Id: <1580361172-41124-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580361172-41124-1-git-send-email-denis@denix.org>
References: <1580361172-41124-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 7/8] packagegroup-*-addons: disable acontis-atemsys as it breaks against K5.4
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
X-List-Received-Date: Thu, 30 Jan 2020 05:14:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 20d582f..7cfa4c8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -185,9 +185,11 @@ EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_am65xx = " ti-ipc-examples-linux"
 
-EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps acontis-atemsys"
+# acontis-atemsys
+EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
-EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps acontis-atemsys"
+# acontis-atemsys
+EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps"
 EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


