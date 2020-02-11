Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D808F529B5
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 19:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 155B040C11;
	Tue, 11 Feb 2020 19:01:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QRWrRbIfVJ31; Tue, 11 Feb 2020 19:01:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DCF7940BAC;
	Tue, 11 Feb 2020 19:01:39 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3D6BB1743F7;
	Tue, 11 Feb 2020 14:01:39 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 11 Feb 2020 14:01:38 -0500
Message-Id: <1581447698-7436-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] branding-core: re-enable "gpu" flag for graphics
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
X-List-Received-Date: Tue, 11 Feb 2020 19:03:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index e7a32a2..7ec9fc4 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -15,4 +15,3 @@ ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
 # Temporarily disable "dsp", "mmip" and "gpu" machine features for all SOCs
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('dsp', '')}"
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
-MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('gpu', '')}"
-- 
2.7.4


