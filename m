Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 050D252976
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2019 17:14:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GHE21m070749
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 12:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563297242;
	bh=9BFU9Mehe0CGWT6LonfwsXzY1Yd/Bs32Ci7fzJpvL0Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RMSYtrQDxmgX2rzOuYXw/b3BZfpCLAhCi5QLL6f55q7WuXeDM1XV09yWJQFKKk905
	78J2YB5flMJaSAOcTNHT+twyHjIHa57Zud8hNSjGmAfdCfkd0BvF3OFKrR31Au/1lA
	tyBJY01YMQCGKiHsLKQ284S7t2cA3PmLBw9QtJ9I=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GHE2EQ088939
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 12:14:02 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Jul 2019 12:14:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Jul 2019 12:14:01 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GHDx9o065387;
	Tue, 16 Jul 2019 12:14:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Jul 2019 12:57:17 -0400
Message-ID: <1563296237-23799-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563296237-23799-1-git-send-email-j-stiffler@ti.com>
References: <1563296237-23799-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 3/3] packagegroup: opencl: add ti-fftw for k2hk and dra7xx families
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
X-List-Received-Date: Tue, 16 Jul 2019 17:14:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index ac2618e..dfd8555 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install OpenCL/MP and related components"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -21,12 +21,14 @@ EXTRA_PKGS = " \
 
 EXTRA_PKGS_append_k2hk = " \
     linalg-examples \
+    ti-fftw-examples \
 "
 
 EXTRA_PKGS_append_dra7xx = " \
     linalg-examples \
     opencl-examples \
     kaldi \
+    ti-fftw-examples \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


