Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BB77E529F7
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2020 16:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DD06C40C13;
	Wed,  5 Feb 2020 16:24:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KY-wxI6cIhuK; Wed,  5 Feb 2020 16:24:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3A9440A52;
	Wed,  5 Feb 2020 16:24:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 53A3C1743D2;
	Wed,  5 Feb 2020 11:24:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  5 Feb 2020 11:24:44 -0500
Message-Id: <1580919886-43718-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH 1/3] ti-analytics: only install packages on compatible platforms
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
X-List-Received-Date: Wed, 05 Feb 2020 16:26:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index e5a13f6..116f3ad 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -1,9 +1,18 @@
 SUMMARY = "TI World packagegroup"
 LICENSE = "MIT"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup
 
-RDEPENDS_${PN} = "\
+ANALYTICS = "\
     armnn \
     tensorflow-lite-examples \
 "
+ANALYTICS_keystone = ""
+ANALYTICS_j7-evm = ""
+ANALYTICS_omapl138 = ""
+
+RDEPENDS_${PN} = "\
+    ${ANALYTICS} \
+"
-- 
2.7.4


