Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4250F52978
	for <meta-arago@arago-project.org>;
	Tue, 12 Sep 2017 14:27:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8CEQwoN018009
	for <meta-arago@arago-project.org>; Tue, 12 Sep 2017 09:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505226418;
	bh=vk6hYWga+LqBHRfRjmzuSVg06yvGpHbJZLtQrmGFKy8=;
	h=From:To:CC:Subject:Date;
	b=qvqlfAINdsBZJptn1FPY1GpuPdTeTkZEtLGoBKQvQkdwl0IG/rMIF1ZZBZLbmR7f5
	jELydDGiqy7czcoEbsl2orSBDtESZi/iR9qL9p7nunFPdzlMB5Z8kvtCLPTSEnSXAu
	V0TtgHhzXQ+DloSB2ACGJi1LlDiDZA/+UIFwq14Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8CEQrqB016215
	for <meta-arago@arago-project.org>; Tue, 12 Sep 2017 09:26:53 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 12 Sep 2017 09:26:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 12 Sep 2017 09:26:53 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8CEQqJ1005301;
	Tue, 12 Sep 2017 09:26:52 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Sep 2017 10:20:46 -0400
Message-ID: <1505226046-16013-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] packagegroup-arago-base-tisdk-server-extra: remove demo-image-proc
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
X-List-Received-Date: Tue, 12 Sep 2017 14:27:09 -0000
Content-Type: text/plain

* This demo is out of date and it has been superseded by OpenCL-based
  demos.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index aec9e5a..c07cc59 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -97,7 +97,6 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     mpm-transport \
     multiprocmgr \
     rm-lld \
-    demo-image-proc \
     pa-lld \
     qmss-lld \
     hplib-mod \
-- 
2.7.4


