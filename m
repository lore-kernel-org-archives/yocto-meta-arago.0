Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C91EE529D6
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 88A9540AB7;
	Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 7754Ccw21LgU; Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD2AB40AD5;
	Wed, 23 Jan 2019 04:52:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 061E4169B46;
	Tue, 22 Jan 2019 23:52:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:04 -0500
Message-Id: <1548219129-12459-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548219129-12459-1-git-send-email-denis@denix.org>
References: <1548219129-12459-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 4/9] busybox: disable conflicting tc, provided by iproute2
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since tc is now provided by iproute2 and doesn't use alternatives,
it breaks tisdk-rootfs-image postinst script when setting up a link.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 5f89bf6..65470bc 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -807,6 +807,7 @@ CONFIG_NSLOOKUP=y
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 CONFIG_TCPSVD=y
+# CONFIG_TC is not set
 CONFIG_TELNET=y
 # CONFIG_FEATURE_TELNET_TTYPE is not set
 CONFIG_FEATURE_TELNET_AUTOLOGIN=y
-- 
2.7.4


