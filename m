Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6D7AE529DC
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXtcn027271
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454435;
	bh=C+hV3DXw2Xkjya8wYhHkBGSBBFsCJH2/WgyEUoOrjh8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GQeMY1ERyuFOfJvRtNNAHd07kn4zz3i0zStI6c+c1bSrM374xofW/iuCI/u9A+h3M
	r00ZhjSw3bzXi3NUrpq3OjFLVYSfn3UTGpQP8alnU8L9krYrM/huKWUQjbq/Y6veBw
	utXRs+oXlv2a1msKGlCsJsXhveG57ko+wGF4gQto=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXtkO004791
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:55 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:55 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrh8019194;
	Mon, 8 Jan 2018 17:33:54 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:31 -0500
Message-ID: <1515454420-19972-4-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515454420-19972-1-git-send-email-a0271529@ti.com>
References: <1515454420-19972-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 03/12] common-csl-ip: upstreamed to meta-ti
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
X-List-Received-Date: Mon, 08 Jan 2018 23:34:02 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc       | 5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 4 ----
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 -
 3 files changed, 10 deletions(-)
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc b/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
deleted file mode 100644
index ebea173..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-PV = "03.03.00.09"
-INC_PR = "r0"
-
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.09"
-CSL_SRCREV = "7a7ef0633d9e305072b79ac978738c48e46583cc"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
deleted file mode 100644
index b3b7c1c..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
deleted file mode 100644
index b781ce2..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
-- 
1.9.1


