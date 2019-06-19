Return-Path: <yuanzhao@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0563E5297F
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 13:57:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JDuYFR067233
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 08:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560952594;
	bh=OBEjEb5F0CRWdIc8RNZYritSQDTj/AFQc7QRYco25n8=;
	h=From:To:CC:Subject:Date;
	b=aFblFxyqx16A28TsLzz+Egslhpe0Kpi6JlJ0hijAL9bt0JhbQOlVrcnR0ovdh51zO
	xdUMlY/tiB0JhyBeJ9CtCbPNBB1gnOlQB4CV6GkL2QHeOpOsGKjixwZ5faU/6n5MeT
	Ylser2HoW3T6xapsnJ3TeSIF/PR+WUt6qRfvibLU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JDuYB7071782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 08:56:34 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 08:56:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 08:56:34 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JDuYp6010716;
	Wed, 19 Jun 2019 08:56:34 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jun 2019 08:56:02 -0500
Message-ID: <20190619135602.98492-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/ti2019.01][PATCH] ocl: Fix dsp l2 cache size update issue
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
X-List-Received-Date: Wed, 19 Jun 2019 13:57:16 -0000
Content-Type: text/plain

- Required for TIDL DSP execution

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../ocl/files/0002-OpenCL_l2_cache_size.patch      | 49 ++++++++++++++++++++++
 .../recipes-ti/ocl/opencl-monitor_git.bb           |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch

diff --git a/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch b/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch
new file mode 100644
index 00000000..7a81a137
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch
@@ -0,0 +1,49 @@
+diff --git a/monitor/src/builtins.c b/monitor/src/builtins.c
+index fbf3bf3..4edf61c 100644
+--- a/monitor/src/builtins.c
++++ b/monitor/src/builtins.c
+@@ -159,7 +159,7 @@ EXPORT int __cache_l2_none()
+ EXPORT int __cache_l2_32k()
+ {
+     int32_t scratch_delta = __cache_l2_size() - (32 << 10);
+-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
+     if (-scratch_delta > scratch_size) return 0;
+     kernel_config_l2.L2_scratch_size += scratch_delta;
+ 
+@@ -173,7 +173,7 @@ EXPORT int __cache_l2_32k()
+ EXPORT int __cache_l2_64k()
+ {
+     int32_t scratch_delta = __cache_l2_size() - (64 << 10);
+-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
+     if (-scratch_delta > scratch_size) return 0;
+     kernel_config_l2.L2_scratch_size += scratch_delta;
+ 
+@@ -187,7 +187,7 @@ EXPORT int __cache_l2_64k()
+ EXPORT int __cache_l2_128k()
+ {
+     int32_t scratch_delta = __cache_l2_size() - (128 << 10);
+-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
+     if (-scratch_delta > scratch_size) return 0;
+     kernel_config_l2.L2_scratch_size += scratch_delta;
+ 
+@@ -205,7 +205,7 @@ EXPORT int __cache_l2_512k() { return 0; }
+ EXPORT int __cache_l2_256k()
+ {
+     int32_t scratch_delta = __cache_l2_size() - (256 << 10);
+-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
+     if (-scratch_delta > scratch_size) return 0;
+     kernel_config_l2.L2_scratch_size += scratch_delta;
+ 
+@@ -219,7 +219,7 @@ EXPORT int __cache_l2_256k()
+ EXPORT int __cache_l2_512k()
+ {
+     int32_t scratch_delta = __cache_l2_size() - (512 << 10);
+-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
+     if (-scratch_delta > scratch_size) return 0;
+     kernel_config_l2.L2_scratch_size += scratch_delta;
+ 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 0ab21a1a..00aa773c 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -5,7 +5,9 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-PR = "${INC_PR}.0"
+SRC_URI += "file://0002-OpenCL_l2_cache_size.patch;patchdir=${WORKDIR}/git"
+
+PR = "${INC_PR}.1"
 
 inherit update-alternatives
 
-- 
2.14.1


