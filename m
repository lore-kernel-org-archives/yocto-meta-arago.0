Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7C4DA52A5B
	for <meta-arago@arago-project.org>;
	Tue,  1 Dec 2015 15:30:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB1FUZuO021349
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:35 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB1FUZfe029330
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:35 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Dec 2015 09:30:34 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB1FUY6s003898	for <meta-arago@arago-project.org>;
	Tue, 1 Dec 2015 09:30:35 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Dec 2015 10:30:15 -0500
Message-ID: <1448983818-21402-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
References: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/5] branding-processor-sdk:Update ti33x feature based on the availability of SGX
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
X-List-Received-Date: Tue, 01 Dec 2015 15:30:42 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enable non-SGX build for AM3/AM4:
For ti33x, remove wayland from DISTRO_FEATURES only if SGX is included at MACHINE_FEATURES.


Signed-off-by: Eric Ruei <a0850410@uda0850410>
---
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 0c5e41c..0de7204 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -1,7 +1,7 @@
 ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
 
-# Remove wayland from ti33x DISTRO_FEATURES.
-DISTRO_FEATURES_remove_ti33x = "wayland"
+# Remove wayland from ti33x DISTRO_FEATURES if SGX is present.
+DISTRO_FEATURES_remove_ti33x = "${@base_contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"
 
 # Set CMEM reserved memory region
 CMEM_BASE_omap-a15 ?= "a0000000"
-- 
1.9.1


