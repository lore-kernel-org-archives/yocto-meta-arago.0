Return-Path: <yuanzhao@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 709FF52974
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2019 21:12:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3CLCduH031827
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2019 16:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555103559;
	bh=Crzdo20AiOD+wHn0Aq/yspXkukF4ABoWq3bXnQKYZx4=;
	h=From:To:CC:Subject:Date;
	b=aZtwZnt8tj2jmUU6t0u7Yy5Hdx9BOgNdKqixa5trpboAbW+VZbYGuSPbxsvnoNTA7
	VVY8tqBNZNzM6QsP7/egXWICE3o6C3Qm2kItSnB4iCgzC8TeEB/ZFIaa4MQa5nN17b
	xlderz7Oq/9Asy/jD8RmokK2kzP9Fu8I56WgLLJ4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3CLCd1s066472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2019 16:12:39 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 12 Apr 2019 16:12:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 12 Apr 2019 16:12:38 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3CLCc2Y077489;
	Fri, 12 Apr 2019 16:12:38 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2019 16:12:36 -0500
Message-ID: <20190412211236.91328-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ocl: fix OpenCL K2x compilation error
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
X-List-Received-Date: Fri, 12 Apr 2019 21:13:00 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch       | 12 ++++++++++++
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb               |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch

diff --git a/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch b/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch
new file mode 100644
index 00000000..0098d321
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch
@@ -0,0 +1,12 @@
+diff --git a/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp b/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp
+index e5da9cc..182e5e3 100644
+--- a/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp
++++ b/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp
+@@ -91,6 +91,7 @@ void* DevMemMapPolicyMPM::Map (DSPDevicePtr64 dsp_addr,  uint32_t size) const
+     else
+         ReportError(ErrorType::Fatal,
+                     ErrorKind::TranslateAddressOutsideMappedAddressRange);
++    return 0;
+ }
+ 
+ void DevMemMapPolicyMPM::Unmap(void* host_addr, uint32_t size) const
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index be4ea9e2..46db2fed 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -3,8 +3,9 @@ HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
 LICENSE = "BSD"
 
 include ocl.inc
+SRC_URI += "file://0001-OpenCL_K2x_compile.patch;patchdir=${WORKDIR}/git"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit cmake systemd
 
-- 
2.14.1


