Return-Path: <yuanzhao@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id AA0D152995
	for <meta-arago@arago-project.org>;
	Wed,  8 Jan 2020 18:06:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008I4IEE083080
	for <meta-arago@arago-project.org>; Wed, 8 Jan 2020 12:04:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578506658;
	bh=KTdzOUB6bdGWBHTvavN4pCFXTOijyfAR1HubcT+EvJ4=;
	h=From:To:CC:Subject:Date;
	b=yfyKmFnTm6knIP8QEUuwilNi1jnWNMDQEu/xe63bYflWglTAScWD2FKmmwFHQK9cu
	1pAH6xkv3acbfumjDZLRlmyXl/qPBjlcb9JIPreKxkENncMxYuXQsabvNrbG3EZtMr
	zxyMS+8ERn8Mlk+PkEk/uvyTfVfKHaB403TZuD70=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008I4INF002069
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 8 Jan 2020 12:04:18 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 8 Jan 2020 12:04:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 8 Jan 2020 12:04:18 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008I4HeW091589;
	Wed, 8 Jan 2020 12:04:17 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Jan 2020 12:04:12 -0600
Message-ID: <20200108180412.117869-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Caleb Robey <a0232989@ti.com>
Subject: [PATCH] tidl-api: update BBAI mcbench script
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
X-List-Received-Date: Wed, 08 Jan 2020 18:06:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Caleb Robey <a0232989@ti.com>
Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 ...p-2-group-layer-use-cases-with-1-dsp.patch | 34 +++++++++++++++++++
 .../recipes-ti/tidl-api/tidl-examples_git.bb  |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
new file mode 100644
index 00000000..0c78ccf0
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
@@ -0,0 +1,34 @@
+tidl-api: replace 2 dsp + 2 group layer use cases with 1 dsp
+
+    The BBAI only has enough CMEM for 4 EVEs, 1 DSP, and 2 group
+    layers. In the case of all of our networks, the difference between
+    1 and 2 dsps is essentially nonexistent. (PLSDK-3189)
+
+Upstream-Status: Accepted
+
+Signed-off-by: Caleb Robey <a0232989@ti.com>
+Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
+---
+ examples/mcbench/scripts/all_5729.sh | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/examples/mcbench/scripts/all_5729.sh b/examples/mcbench/scripts/all_5729.sh
+index defec72..0fee8a1 100755
+--- a/examples/mcbench/scripts/all_5729.sh
++++ b/examples/mcbench/scripts/all_5729.sh
+@@ -7,8 +7,7 @@ export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
+ export TIDL_NETWORK_HEAP_SIZE_EVE=67108864
+ export TIDL_NETWORK_HEAP_SIZE_DSP=8388608
+ ./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
+-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
+-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
+-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_inceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
+-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
+-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_inceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
index c7016ad5..e5afad1c 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -6,7 +6,8 @@ LICENSE = "BSD"
 include tidl-api.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+SRC_URI += "file://0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.24.1


