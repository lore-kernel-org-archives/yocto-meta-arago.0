Return-Path: <e-ruei1@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5FE7D52976
	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 23:08:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPN84TC005800
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPN84tg017212
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 17:08:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPN83pe018422	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 17:08:03 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Nov 2015 18:07:56 -0500
Message-ID: <1448492879-1050-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
References: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] branding-processor-sdk:Update ti33x feature based on the availability of SGX
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
X-List-Received-Date: Wed, 25 Nov 2015 23:08:06 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enable non-SGX build for AM3/AM4:
For ti33x, remove wayland from DISTRO_FEATURES only if SGX is included 
at MACHINE_FEATURES.

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


