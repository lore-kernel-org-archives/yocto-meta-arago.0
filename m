Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 85B52529BC
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 21:23:32 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCLLveM018003
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 15:21:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576185717;
	bh=9HP7ty2gXtSMHbjIMEZrp4guyeQDW1kddWjtp82vJ9w=;
	h=From:To:CC:Subject:Date;
	b=PnTC5rbjdVtE8DOzox6FdW4yoN6c2J1D+j8gdRq8EyZABQhjM2nh45DXUQ1JZQtNN
	TeqWOnKzdOLdp1+7gj0PFEANN91Ki/5NibVaKhwPCpi53WLKW98AZPJxKEFFkMMQFj
	hmUISQwtg90VJJyN3l5zljyzhzJ2aqCh1fC4sr0A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCLLv9O016417
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 15:21:57 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 15:21:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 15:21:56 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCLLu9N084992;
	Thu, 12 Dec 2019 15:21:56 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Dec 2019 16:02:53 -0500
Message-ID: <1576184573-9278-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.05][PATCH] tidl-api: fix package-qa issues
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
X-List-Received-Date: Thu, 12 Dec 2019 21:23:32 -0000
Content-Type: text/plain

tidl-api does not create versioned libraries, so provide these in the
base package and skip the QA checks.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index a8829c1..ea12fb0 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -52,5 +52,9 @@ FILES_${PN} += "\
     ${TIDL_INSTALL_DIR} \
 "
 
+# Versioned libs are not created. See do_install().
+SOLIBS = ".so*"
+FILES_SOLIBSDEV = ""
 
-INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
+INSANE_SKIP_${PN} = "arch ldflags textrel staticdev libdir"
+INSANE_SKIP_${PN}-dbg = "libdir"
-- 
2.7.4


