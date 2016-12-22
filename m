Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A5CD152A05
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 00:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E9DD2091B;
	Thu, 22 Dec 2016 00:01:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id T9t0RV7yWSEf; Thu, 22 Dec 2016 00:01:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CF9F207BD;
	Thu, 22 Dec 2016 00:01:28 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id AA8141621E2;
	Wed, 21 Dec 2016 19:01:27 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Dec 2016 19:01:27 -0500
Message-Id: <1482364887-14326-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master/morty][PATCH] external-linaro-sdk-toolchain: debug split is now controlled separately from strip
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
X-List-Received-Date: Thu, 22 Dec 2016 00:01:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Need to inhibit both debug split and strip due to x86 sysroot containing arm libs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
index f9cbedd..618d784 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
@@ -2,8 +2,9 @@ inherit cross-canadian
 
 require external-linaro-bfd-version.inc
 
-PR = "r5"
+PR = "r6"
 
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.7.4


