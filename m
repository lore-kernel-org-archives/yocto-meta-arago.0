Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5E5F1529FD
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 13:15:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JLtvqu022016
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 16:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505858157;
	bh=nDm67juVtrUqVDyp25qsoM7+Dz7fzD50q5Ylxzk12M0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jgqF4r4C6Kh7d0QujPfkCIElFKK15DIi/qRP+JAdKr+IeQA7s0j1eiebe1Go+J3WG
	FvmiSzqAv/2jE80Tii+osq1JofiSGiZ619lHGxZAMsGRa0A/JZkuhJEu4Cy7v80tK8
	6nUsOEUKce+kCIEyQ9YltwqZz0f7j+FO3vivyQXg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JLtq5v002105
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 16:55:52 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 16:55:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 16:55:52 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JLtpBC012034;
	Tue, 19 Sep 2017 16:55:52 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Sep 2017 17:55:48 -0400
Message-ID: <1505858148-5618-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1505858148-5618-1-git-send-email-a0271529@ti.com>
References: <1505858148-5618-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH 2/2] uio-module-drv-test: include pruss_uio_test for k2g-evm
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
X-List-Received-Date: Wed, 20 Sep 2017 13:15:06 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
index 15fbc54..5f02601 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
@@ -1,6 +1,12 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 # This corresponds to version 02.02.01.00
 UIO_MODULE_DRV_SRCREV = "bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
 
 PV = "2.2.1.0+git${SRCPV}"
+
+DEVICE_NAME_k2g-evm = "k2g"
+
+do_install_append_k2g-evm () {
+        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
+}
-- 
1.9.1


