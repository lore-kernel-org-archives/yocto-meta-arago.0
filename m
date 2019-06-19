Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C475B52972
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 23:17:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JNGx7f105422
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 18:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560986219;
	bh=XXkLA9wTmCZ5o2/oPWWuvLMeCYfs87SQO/sr5weqlX0=;
	h=From:To:CC:Subject:Date;
	b=xfG/+aT283krgMMlgqVEE/CwJBDErK61wHvxpKOOMIhbPxZ8+6uAu/Ab5/d68SEQY
	CxDzMf9eeAz0Lum+pNwAlC4VkfbFKIArevlwBkVcqy3P80OiOhn2JPXbUZLyQPbvAB
	+VxIV/WpNbcOkn76+FDi/xuB8bVsmygOQNPcnOOE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JNGxcw059899
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 18:16:59 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 18:16:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 18:16:58 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JNGw8k045486;
	Wed, 19 Jun 2019 18:16:58 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jun 2019 14:07:12 -0400
Message-ID: <20190619180712.17144-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [thud/master][PATCH] opencl: Add opencl to dra76 build
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
X-List-Received-Date: Wed, 19 Jun 2019 23:17:41 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-opencl.bb            | 1 +
 meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb      | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb                  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index b96f62d0..b33930c2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -25,6 +25,7 @@ EXTRA_PKGS_append_k2hk = " \
 
 EXTRA_PKGS_append_dra7xx = " \
     linalg-examples \
+    opencl-examples \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index c2552416..003889c2 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -20,7 +20,7 @@ DEPENDS = " common-csl-ip-rtos \
             opencl-tidl-fw \
 "
 
-COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor_ipu"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 46db2fed..8b363573 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -39,6 +39,7 @@ DEPENDS_remove_k2g = " libulm"
 MONITORS                      = " opencl-monitor"
 MONITORS_append_am57xx-evm    = " opencl-monitor-ipu"
 MONITORS_append_am57xx-hs-evm = " opencl-monitor-ipu"
+MONITORS_append_dra7xx        = " opencl-monitor-ipu"
 
 RDEPENDS_${PN} += " bash"
 RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
-- 
2.17.1


