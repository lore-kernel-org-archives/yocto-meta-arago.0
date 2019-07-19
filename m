Return-Path: <jjhiblot@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8889952998
	for <meta-arago@arago-project.org>;
	Fri, 19 Jul 2019 14:05:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6JE4aCr013214
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2019 09:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563545076;
	bh=I68ciCmxLNCBaUGmpg/PScVeeJePIXLkMlrQ31px7po=;
	h=From:To:CC:Subject:Date;
	b=onIeqtdZCWHZkYxQiWEwubImyrjL8L9+nWKYz2UlH50i7df/kh6UPttYoiJPJowKZ
	mUU7e0lbtQy9g0NNwSghct2gpwYDVU2Y+p7d+4EAfdh3/NfSaQBakamqyV6C8/gM7r
	B1lxAH+P0RvfBXn4OyQtnlUMfPQUBrugZ3UeedFA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6JE4a2C036241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2019 09:04:36 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 19 Jul 2019 09:04:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 19 Jul 2019 09:04:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6JE4ZF1021048;
	Fri, 19 Jul 2019 09:04:35 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Fri, 19 Jul 2019 16:04:33 +0200
Message-ID: <20190719140433.3267-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud] [PATCH] kms++: update to the latest and bump version
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
X-List-Received-Date: Fri, 19 Jul 2019 14:05:27 -0000
Content-Type: text/plain

Although upstream package has no versions, there are some API changes, bump
to version 2.1

If no device is specified, this version automatically selects the first KMS
device. Previously, it could have been another kind of device (like a GPU).
This version also improves the API:
- plane manipulation is easier
- it is now possible to know if a device is KMS device

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index 2faff11b..3d94632a 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -1,14 +1,14 @@
 SUMMARY = "C++ library for kernel mode setting"
 HOMEPAGE = "https://github.com/tomba/kmsxx"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c670e18272184fc0e86e1648678b4f2a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-PV = "2.0"
+PV = "2.1"
 PR = "r0"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=git;branch=${BRANCH}"
-SRCREV = "c13047e3f7674a5a05b107ef3fd97d9ff4165639"
+SRCREV = "626edbe2fc845803ffdd25936e21202e4f123b63"
 
 DEPENDS = "drm python3-pybind11"
 
-- 
2.17.1


