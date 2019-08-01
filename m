Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4C31D52998
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2019 00:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 799F540BAE;
	Thu,  1 Aug 2019 00:53:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sXAv9gU3DdL7; Thu,  1 Aug 2019 00:53:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63B4740BC4;
	Thu,  1 Aug 2019 00:53:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 48A3E17121C;
	Wed, 31 Jul 2019 20:53:11 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 31 Jul 2019 20:53:10 -0400
Message-Id: <1564620790-9157-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564620790-9157-1-git-send-email-denys@ti.com>
References: <1564620790-9157-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] arago.conf: disable meta-virtualization sanity check and warning
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
X-List-Received-Date: Thu, 01 Aug 2019 00:54:08 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8c23b9e..ae151a7 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -173,6 +173,9 @@ require conf/distro/include/branding-${ARAGO_BRAND}.inc
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
 
+# Disable meta-virtualization sanity check and warning
+SKIP_META_VIRT_SANITY_CHECK = "1"
+
 # Set ENTERPRISE_DISTRO flag to ensure that recipes that have been flagged
 # do not attempt to enable features that have potential commercial
 # licensing issues.
-- 
2.7.4


