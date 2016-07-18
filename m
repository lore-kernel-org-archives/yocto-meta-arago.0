Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7DE4252AB2
	for <meta-arago@arago-project.org>;
	Mon, 18 Jul 2016 16:21:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6IGJ6bj015490
	for <meta-arago@arago-project.org>; Mon, 18 Jul 2016 11:19:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6IGLdJW002376
	for <meta-arago@arago-project.org>; Mon, 18 Jul 2016 11:21:39 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 18 Jul 2016 11:21:38 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6IGLbCm008780;	Mon, 18 Jul 2016 11:21:38 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Jul 2016 12:20:59 -0400
Message-ID: <1468858859-8074-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1468858859-8074-1-git-send-email-j-stiffler@ti.com>
References: <1468858859-8074-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linalg: extend to dra7xx SOCs
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
X-List-Received-Date: Mon, 18 Jul 2016 16:21:40 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
This supersedes the patch "linalg: fix COMPATIBLE_MACHINE"

 meta-arago-extras/recipes-ti/linalg/linalg.inc    | 2 +-
 meta-arago-extras/recipes-ti/linalg/linalg_git.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index 31ea34b..bf56616 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -40,4 +40,4 @@ export OMP_DIR ="${OMP_INSTALL_DIR}"
 export LIBARCH_DIR = "${LIBARCH_INSTALL_DIR}"
 export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
 
-COMPATIBLE_MACHINE = "k2hk-evm|am57xx"
+COMPATIBLE_MACHINE = "k2hk-evm|dra7xx"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
index 18754a7..935c47e 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
@@ -4,9 +4,9 @@ include linalg.inc
 PR = "${INC_PR}.0"
 
 TARGET_k2hk-evm      = "SOC_K2H"
-TARGET_am57xx-evm    = "SOC_AM572x"
+TARGET_dra7xx        = "SOC_AM572x"
 MEM_MODEL_k2hk-evm   = "Large"
-MEM_MODEL_am57xx-evm = "Small"
+MEM_MODEL_dra7xx     = "Small"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_compile() {
-- 
2.7.4


