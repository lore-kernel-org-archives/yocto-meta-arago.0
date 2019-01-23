Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2C295529E6
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D190140B5E;
	Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jjHjUhHrfbNM; Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DA8CD40AF5;
	Wed, 23 Jan 2019 04:52:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EDD53169B45;
	Tue, 22 Jan 2019 23:52:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:03 -0500
Message-Id: <1548219129-12459-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548219129-12459-1-git-send-email-denis@denix.org>
References: <1548219129-12459-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 3/9] busybox: disable conflicting rtcwake, provided by util-linux
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since rtcwake is now provided by util-linux and doesn't use alternatives,
it breaks arago-tiny-image postinst script when setting up a link.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index ce44700..5f89bf6 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -583,7 +583,7 @@ CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
 # CONFIG_READPROFILE is not set
-CONFIG_RTCWAKE=y
+# CONFIG_RTCWAKE is not set
 # CONFIG_SCRIPT is not set
 # CONFIG_SCRIPTREPLAY is not set
 # CONFIG_SETARCH is not set
-- 
2.7.4


