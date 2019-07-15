Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 02ECA520E1
	for <meta-arago@arago-project.org>;
	Mon, 15 Jul 2019 19:17:09 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FJGKEf102059
	for <meta-arago@arago-project.org>; Mon, 15 Jul 2019 14:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563218180;
	bh=g/CrC5bHJUGFTAkM707Z3QDdJYlhf8bALg2AVlN4IuE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DbgY15KNVA7DSVlVeU/MpLylvJ58eh7kMKnhG5ZiKYZU3wWri46JZMyV/BfMbXUlw
	CiZPZyU+S9PEnIzYPx8MmHVROg/KvIGSh3+gD3xHOlKZOwPcPE/WbtUaDobKh/jyxc
	6DkU7O+EYBTZvsAg5uim6NfEpfwmW2dEWJn+JKwY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FJGKEP004313
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 15 Jul 2019 14:16:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 15 Jul 2019 14:16:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 15 Jul 2019 14:16:20 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FJGHHW026541;
	Mon, 15 Jul 2019 14:16:20 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Jul 2019 14:59:37 -0400
Message-ID: <1563217177-9111-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563217177-9111-1-git-send-email-j-stiffler@ti.com>
References: <1563217177-9111-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 2/2] packagegroup: opencl: add kaldi for dra7xx
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
X-List-Received-Date: Mon, 15 Jul 2019 19:17:10 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index b33930c..ac2618e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install OpenCL/MP and related components"
 LICENSE = "MIT"
-PR = "r2"
+PR = "r3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -26,6 +26,7 @@ EXTRA_PKGS_append_k2hk = " \
 EXTRA_PKGS_append_dra7xx = " \
     linalg-examples \
     opencl-examples \
+    kaldi \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


