Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 95F1452968
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 745B040AF7;
	Wed, 23 Jan 2019 04:52:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IjvU0Utqih67; Wed, 23 Jan 2019 04:52:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2696F40B36;
	Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 408FF169B4B;
	Tue, 22 Jan 2019 23:52:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:09 -0500
Message-Id: <1548219129-12459-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548219129-12459-1-git-send-email-denis@denix.org>
References: <1548219129-12459-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 9/9] branding-core: disable 'dsp' machine feature due to gcc8 breakage
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Breaking packages are: gdbc6x, gstreamer-dsp66, qt-openvc-opencl

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 43454f8..6a56f00 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -16,5 +16,9 @@ ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
 # latest code base, until it is fixed for gstreamer > 1.10
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
 
+# Temporarily disable "dsp" machine feature for all SOCs while building
+# latest code base, until it is fixed for gdbc6x, gstreamer-dsp66, qt-openvc-opencl
+MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('dsp', '')}"
+
 # Temporarily disable UBI images for K2 "server" rootfs due to size
 IMAGE_FSTYPES_remove_pn-tisdk-server-rootfs-image = "ubi ubifs"
-- 
2.7.4


