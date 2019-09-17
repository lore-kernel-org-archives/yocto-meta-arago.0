Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 9CF865299C
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2019 23:28:54 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HNRlQ2022973
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2019 18:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568762867;
	bh=3BcvgTQybn34eQ9tMuDj0t+Uo+t9cq0qm+RrPjcX69k=;
	h=From:To:CC:Subject:Date;
	b=LzABtPrsiiiLDEOjZMNvRu3Y9UuaPEmH/mK5ZNmHQDfbyWviE15Y2OJUjlSQETIlf
	BKHb7AkoXLHVlU4Sra3/zHj/UrHz5xVVTpm4RDANBaeriMBmxFb+wOT+0JO7YbxMro
	XkW8y+RlLGYknldp4jchzYlUGrmsTbNgo/5m4mp8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HNRllu123477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2019 18:27:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 17 Sep 2019 18:27:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 17 Sep 2019 18:27:46 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HNRknL067558;
	Tue, 17 Sep 2019 18:27:46 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Sep 2019 19:26:58 -0400
Message-ID: <20190917232658.941-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [PATCH] opencv: Fix morph.cl related compilation error
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
X-List-Received-Date: Tue, 17 Sep 2019 23:28:54 -0000
Content-Type: text/plain

- C6x intrinsic _min2(), _max2() cannot be applied to data types such as uchar3

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../0001-morph.cl-fix-compilation-error.patch | 35 +++++++++++++++++++
 .../recipes-support/opencv/opencv_3.1.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/opencv/opencv/0001-morph.cl-fix-compilation-error.patch

diff --git a/meta-arago-extras/recipes-support/opencv/opencv/0001-morph.cl-fix-compilation-error.patch b/meta-arago-extras/recipes-support/opencv/opencv/0001-morph.cl-fix-compilation-error.patch
new file mode 100644
index 00000000..5f279f31
--- /dev/null
+++ b/meta-arago-extras/recipes-support/opencv/opencv/0001-morph.cl-fix-compilation-error.patch
@@ -0,0 +1,35 @@
+From c3befabd0420d6665cc61931af5aea00e82977e3 Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Tue, 17 Sep 2019 19:16:00 -0400
+Subject: [PATCH] morph.cl: fix compilation error
+
+Upstream-Status: Inappropriate [other]
+
+- TI C6x intrinsic _min2(), _max2() cannot be applied to data types  such as uchar3.
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+---
+ modules/imgproc/src/opencl/morph.cl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/modules/imgproc/src/opencl/morph.cl b/modules/imgproc/src/opencl/morph.cl
+index 8e3ab2fa0..47243ca0c 100644
+--- a/modules/imgproc/src/opencl/morph.cl
++++ b/modules/imgproc/src/opencl/morph.cl
+@@ -90,11 +90,11 @@
+ #if defined INTEL_DEVICE && defined DEPTH_0
+ #define MORPH_OP(A, B) ((A) < (B) ? (A) : (B))
+ #else
+-#define MORPH_OP(A, B) _min2((A), (B))
++#define MORPH_OP(A, B) min((A), (B))
+ #endif
+ #endif
+ #ifdef OP_DILATE
+-#define MORPH_OP(A, B) _max2((A), (B))
++#define MORPH_OP(A, B) max((A), (B))
+ #endif
+ 
+ #define PROCESS(y, x) \
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
index acc9d71e..c9670fc6 100644
--- a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
     file://fixgcc60.patch \
     file://fixpkgconfig.patch \
+    file://0001-morph.cl-fix-compilation-error.patch \
     file://0001-Fix-sign-macro-redefinition-compile-time-error.patch;patchdir=../contrib \
 "
 
-- 
2.17.1


