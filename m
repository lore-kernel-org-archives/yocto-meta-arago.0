Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 23A1B52A09
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2020 05:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 752BA40C28;
	Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RCGgOycexeI1; Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 619CF40C1E;
	Thu, 30 Jan 2020 05:12:55 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1DD001711C5;
	Thu, 30 Jan 2020 00:12:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jan 2020 00:12:49 -0500
Message-Id: <1580361172-41124-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580361172-41124-1-git-send-email-denis@denix.org>
References: <1580361172-41124-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 5/8] packagegroup-*-addons: disable switch-config, as kernel uapi isn't ready yet
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
X-List-Received-Date: Thu, 30 Jan 2020 05:14:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index b80a770..20d582f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -40,27 +40,27 @@ UTILS_DSP = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gdbc6x dsptop', '', d)} \
 "
 
+# switch-config
 UTILS_append_ti33x = " mmc-utils \
                        can-utils \
-                       switch-config \
                        pru-icss \
                        pru-swuart-fw \
                        uio-module-drv-test \
                        uio-test-pruss \
 "
 
+# switch-config
 UTILS_append_ti43x = " mmc-utils \
                        can-utils \
-                       switch-config \
                        libdrm-omap \
                        pru-icss \
                        uio-module-drv-test \
                        uio-test-pruss \
 "
 
+# switch-config
 UTILS_append_omap-a15 = " mmc-utils \
                           parted \
-                          switch-config \
                           libdrm-omap \
                           stream-openmp \
                           pru-icss \
@@ -69,10 +69,10 @@ UTILS_append_omap-a15 = " mmc-utils \
                           uio-module-drv-test \
 "
 
+# switch-config
 UTILS_append_k3 = " mmc-utils \
                     can-utils \
                     parted \
-                    switch-config \
                     irqbalance \
                     jailhouse \
 "
-- 
2.7.4


