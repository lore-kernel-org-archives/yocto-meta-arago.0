Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0E0705299F
	for <meta-arago@arago-project.org>;
	Mon, 14 Jan 2019 22:41:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0EMfYvw065481
	for <meta-arago@arago-project.org>; Mon, 14 Jan 2019 16:41:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1547505694;
	bh=aV3eNvV3IK0QiFDTQteLYv4LXrtHE3itkYaJamYqHus=;
	h=From:To:CC:Subject:Date;
	b=T93Hkc5B6B08Az1L4/S3HUm9QfJHJZ1qPhy4q9LpyHjtDi5G2y7vn3mQpjsiBPZhy
	y5/+N6hjT9up/OVKqrVv8MBchESLhmmpYFGibhtzFgT9bFTogBnQWFVYbKYNZ3IUBG
	nDLapcq2hz5ZJ6CIL1Z1Tu4qCTnhfACHe78ta/6A=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0EMfYNS112516
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 14 Jan 2019 16:41:34 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 14 Jan 2019 16:41:34 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 14 Jan 2019 16:41:34 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0EMfYOo016623;
	Mon, 14 Jan 2019 16:41:34 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Jan 2019 16:41:29 -0600
Message-ID: <20190114224129.125351-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: update version to 01.01.17.02
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
X-List-Received-Date: Mon, 14 Jan 2019 22:41:48 -0000
Content-Type: text/plain

- minor fixes for OpenCL g++-arm-8 compiling issues

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 96d1836f..be32b0bc 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,6 +1,6 @@
 # patch version at the end needs to be in double digits
-PV = "1.1.17.01"
-INC_PR = "r1"
+PV = "1.1.17.02"
+INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
 
@@ -10,7 +10,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "61d9dbae3ee40f8023ec624601c2a0cc9e80220f"
+OCL_SRCREV = "fef8ff7679dacfac7b208531be07550fa7e3673e"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
-- 
2.14.1


