Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B0994529D5
	for <meta-arago@arago-project.org>;
	Wed, 25 Apr 2018 16:59:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PGxVGS031114
	for <meta-arago@arago-project.org>; Wed, 25 Apr 2018 11:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524675571;
	bh=YuA7l+Gk0cEcchjcW2gif/reWO+MVc13H4PVLzWYdxc=;
	h=From:To:CC:Subject:Date;
	b=MY+N5Nh1KpDxUO4vwFKx+/qysdRmVtjLKH/0kQhgfnARSRjbH1pwx74Cu1SBH5vEv
	TwYbik046agpgNx8+uG9c/Zgmqk89EawdJW3zcpWLtyaCtIjrwSA7/Abgo270z3th7
	Nc9UIdseyNq0Krok8daedP34rORrvdcz3xk+ssXc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PGxV03003616
	for <meta-arago@arago-project.org>; Wed, 25 Apr 2018 11:59:31 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Apr 2018 11:59:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 25 Apr 2018 11:59:31 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PGxUT5013603;
	Wed, 25 Apr 2018 11:59:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Apr 2018 12:49:11 -0400
Message-ID: <1524674951-20311-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] opencl-monitor-rtos: skip arch check
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
X-List-Received-Date: Wed, 25 Apr 2018 16:59:35 -0000
Content-Type: text/plain

* The package contains DSP binaries, so disable this QA check.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
index 62e7131..b0e7016 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
@@ -63,3 +63,4 @@ do_install() {
 }
 
 FILES_${PN} += "${OCL_RTOS_INSTALL_DIR_RECIPE}"
+INSANE_SKIP_${PN} = "arch"
-- 
2.7.4


