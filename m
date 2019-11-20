Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 833F152986
	for <meta-arago@arago-project.org>;
	Wed, 20 Nov 2019 11:15:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKBDoDo037621
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2019 05:13:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574248430;
	bh=t3fd3p06cIOil3c0LwZaMWvrtyXxjXfiBXzMfSmHVx8=;
	h=From:To:CC:Subject:Date;
	b=nSiuFnYVJjANJYpjntJdFTmjR3FAFyRxcZCd43Grh+oJxV3jtYsCsB64AIGxkMJ7/
	Xyqi8XrylO1aFDUVpXf1CwTTT8IQQ3HzeS0dMHn850WQVVLnnCRXWmbDwn33YYZA5W
	MJPwQMnsk19ANKKiqMhfwV0oa3Y/HWwercUSh4Ps=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAKBDorw052745
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2019 05:13:50 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 20 Nov 2019 05:13:49 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 20 Nov 2019 05:13:49 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKBDlRt120241; 
	Wed, 20 Nov 2019 05:13:48 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Nov 2019 16:43:43 +0530
Message-ID: <1574248423-156560-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: grygorii.strashko@ti.com, nsekhar@ti.com
Subject: [thud/master] [PATCH] branding: core: Autoload rpmsg_kdrv_switch for j7-evm
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
X-List-Received-Date: Wed, 20 Nov 2019 11:15:17 -0000
Content-Type: text/plain

rpmsg_kdrv_switch kernel module is needed for the cpsw9g virtual net
driver. Since there is no symbol dependency, rpmsg_kdrv_switch
does not get loaded automatically.

Add branding file override for j7-evm to autoload this module.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
Fixes: LCPD-17113

 meta-arago-distro/conf/distro/include/branding-core.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index cab9831..c70f8d1 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -11,3 +11,8 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
 
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
+
+# Autoload the kernel module
+KERNEL_MODULE_AUTOLOAD_EXTRAS = ""
+KERNEL_MODULE_AUTOLOAD_EXTRAS_j7-evm += "rpmsg_kdrv_switch"
+KERNEL_MODULE_AUTOLOAD += "${KERNEL_MODULE_AUTOLOAD_EXTRAS}"
-- 
1.9.1


