Return-Path: <anandb@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 680C4529C2
	for <meta-arago@arago-project.org>;
	Sat, 13 Feb 2016 14:33:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1DEXvn5004145
	for <meta-arago@arago-project.org>; Sat, 13 Feb 2016 08:33:57 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1DEXvOd016449
	for <meta-arago@arago-project.org>; Sat, 13 Feb 2016 08:33:57 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 13 Feb 2016 08:33:57 -0600
Received: from uda0876520.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1DEXpi4027591;	Sat, 13 Feb 2016 08:33:56 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 13 Feb 2016 20:05:37 +0530
Message-ID: <1455374137-15885-2-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455374137-15885-1-git-send-email-anandb@ti.com>
References: <1455374137-15885-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] branding-core.inc: re-enable "sgx" after DDK 1.14 is published
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
X-List-Received-Date: Sat, 13 Feb 2016 14:33:58 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index ee3e34d..de4fbe6 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -13,7 +13,3 @@ SRCREV_pn-ltp-ddt = "${AUTOREV}"
 
 # Lower opencl-monitor priority for now, due to affected performance
 ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
-
-# Temporarily disable "sgx" machine feature for all SOCs while building
-# latest 4.1 integration kernel, until DDK 1.14 merges are finished
-MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
-- 
1.9.1


