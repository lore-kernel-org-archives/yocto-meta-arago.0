Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 86CC1529AE
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 12:05:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PC5GjY081849
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 07:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532520316;
	bh=i2oLUQsapH+CTU19SCK4EN9F2ouQECKboftXh9XqAzM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q4K5WuFEXlM84VkeCkHSFwwq0Fd1z5K0gD/THEl8xmPIhd3j/d+p2kggLIt7aFzHQ
	YceGut0ZY4MBNr2vTiFsKGxI0W/bTKqrPmCUT34zjRfvD1ZBrgwG3ObnXsZkDXs/PN
	mHOooWl6pyiL1ZcPkZzL7Hu2UPCH5lygieR+Ynjg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PC5Gf2020787
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 07:05:16 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 07:05:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 25 Jul 2018 07:05:15 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PC59Gu024647;
	Wed, 25 Jul 2018 07:05:15 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Jul 2018 07:53:08 -0400
Message-ID: <1532519588-17585-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
References: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH 3/3] packagegroup-arago-tisdk-opencl: add tidl-utils
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
X-List-Received-Date: Wed, 25 Jul 2018 12:05:24 -0000
Content-Type: text/plain

Cc: Djordje Senicic <x0157990@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
index 782affe..b1b74a9 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
@@ -1,6 +1,6 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
-TIDL_PKGS = "tidl-examples-dev tidl-viewer"
+TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils"
 
 EXTRA_PKGS_append_am57xx-evm = " ${TIDL_PKGS}"
 EXTRA_PKGS_append_am57xx-hs-evm = " ${TIDL_PKGS}"
-- 
2.7.4


