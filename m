Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0DEDE52A3F
	for <meta-arago@arago-project.org>;
	Wed,  6 May 2020 22:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C914940C3F;
	Wed,  6 May 2020 22:35:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4sQJSp5CHnLF; Wed,  6 May 2020 22:35:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B1BDB40C2F;
	Wed,  6 May 2020 22:35:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 39BAE172D0C;
	Wed,  6 May 2020 18:35:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  6 May 2020 18:35:49 -0400
Message-Id: <1588804551-10982-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588804551-10982-1-git-send-email-denis@denix.org>
References: <1588804551-10982-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/4] FIXME: ti-analytics: disable tensorflow-lite-demo due to breakage with OpenCV 4.1
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
X-List-Received-Date: Wed, 06 May 2020 22:38:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/ti-analytics.bb              | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index abdb609..7b227fb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -8,12 +8,13 @@ inherit packagegroup
 ARMNN_PACKAGES = ""
 #ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn', '', d)}"
 
-TENSORFLOW_DEMO = " \
-    ${@oe.utils.all_distro_features(d, 'opencv', 'tensorflow-lite-demo', '')} \
-"
-TENSORFLOW_DEMO_dra7xx = " \
-    ${@['','tensorflow-lite-demo'][oe.utils.all_distro_features(d, 'opencl opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
-"
+TENSORFLOW_DEMO = ""
+#TENSORFLOW_DEMO = " \
+#    ${@oe.utils.all_distro_features(d, 'opencv', 'tensorflow-lite-demo', '')} \
+#"
+#TENSORFLOW_DEMO_dra7xx = " \
+#    ${@['','tensorflow-lite-demo'][oe.utils.all_distro_features(d, 'opencl opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
+#"
 
 ANALYTICS = " \
     ${ARMNN_PACKAGES} \
-- 
2.7.4


