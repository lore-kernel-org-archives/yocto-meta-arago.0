Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4B413529BF
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 14:43:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMEhO2b010276
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:24 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhOh1002307
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2013 08:43:24 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Nov 2013 08:43:24 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEhFBL030461;
	Fri, 22 Nov 2013 08:43:22 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Nov 2013 09:45:18 -0600
Message-ID: <1385135121-14345-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385135121-14345-1-git-send-email-fcooper@ti.com>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/6] branding-core: Dont remove SGX from MACHINE_FEATURES
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
X-List-Received-Date: Fri, 22 Nov 2013 14:43:25 -0000
Content-Type: text/plain

* A version of the Graphics SDK has been added that supports 3.12+ kernels.
* No need to remove sgx from the list of MACHINE_FEATURES

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/branding-core.inc          |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 3850434..b1ae89b 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -4,7 +4,3 @@
 # Please avoid creating multiple versions of the same brand, if possible
 # The policy is for the "Core" brand to be the default,
 # hence this file is mostly empty and used as a template
-
-# Temporarily disable "sgx" machine feature for ti33x SOC while building
-# latest 3.12 integration kernel, until Graphics SDK catches up
-MACHINE_FEATURES_ti33x := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
-- 
1.7.0.4


