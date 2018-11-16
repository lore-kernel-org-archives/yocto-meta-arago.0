Return-Path: <qsu@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 641CD52092
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2018 19:42:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAGJgeZj006176
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 13:42:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542397360;
	bh=FnfKniUEDYFmSXupf5XAhGZ2x4Ev4Nqpf8uRMuI6if8=;
	h=From:To:Subject:Date;
	b=cme0q4/bQHumcM4qQp2/qpVYGoI/pbEax5t8wvkVttMTsC8X89ID2NpRGLmQ48uoW
	jU+kk8O0FA+uJZMZVU4p73yTVz+uNtgTX7WjI9DmO7ydhGU78tEuJ7TO6UQJ43O0L6
	7U2i46ZDTh9vwC4LH4Gd8IhjhMrKwYeUDJvqYs1U=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAGJgeVb041998
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 13:42:40 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 16 Nov 2018 13:42:39 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 16 Nov 2018 13:42:40 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAGJgdao002711
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 13:42:39 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Nov 2018 14:42:22 -0500
Message-ID: <1542397342-28389-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] arm-compute-library: bump SRCREV and add benchmark test group.
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
X-List-Received-Date: Fri, 16 Nov 2018 19:42:51 -0000
Content-Type: text/plain

updated to the latest version of 18.08
updated to generate versioned library
added benchmark preset group for squeezenet and inceptionnet

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../0001-add-ti-benchmark-test-group.patch         | 62 +++++++++++++++++++
 .../0002-add-ti-benchmark-test-group.patch         | 72 ++++++++++++++++++++++
 .../0003-add-ti-benchmark-test-group.patch         | 40 ++++++++++++
 .../0004-add-ti-benchmark-test-group.patch         | 47 ++++++++++++++
 .../0005-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
 .../0006-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
 .../0007-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
 .../0008-add-ti-benchmark-test-group.patch         | 29 +++++++++
 .../0009-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
 .../0010-add-ti-benchmark-test-group.patch         | 48 +++++++++++++++
 .../0011-add-ti-benchmark-test-group.patch         | 35 +++++++++++
 .../arm-compute-library/arm-compute-library_git.bb | 32 ++++++----
 12 files changed, 524 insertions(+), 11 deletions(-)
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch
 create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch

diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..6905158
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch
@@ -0,0 +1,62 @@
+From f02849bb2c99ae15a1f1a1f0df52010f2083120b Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:25:50 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ .../squeezenet/SqueezeNetActivationLayerDataset.h  | 35 ++++++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+ mode change 100644 => 100755 tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h
+
+diff --git a/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h b/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h
+old mode 100644
+new mode 100755
+index 7f4bf4d..a66f473
+--- a/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h
++++ b/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h
+@@ -71,6 +71,41 @@ public:
+     SqueezeNetActivationLayerDataset(SqueezeNetActivationLayerDataset &&) = default;
+     ~SqueezeNetActivationLayerDataset()                                   = default;
+ };
++class TISqueezeNetActivationLayerDataset final : public
++    framework::dataset::CartesianProductDataset<framework::dataset::InitializerListDataset<TensorShape>, framework::dataset::SingletonDataset<ActivationLayerInfo>>
++{
++public:
++    TISqueezeNetActivationLayerDataset()
++        : CartesianProductDataset
++    {
++        framework::dataset::make("Shape", { // relu_conv1
++            TensorShape(114U, 114U, 64U),
++            // fire2/relu_squeeze1x1, fire3/relu_squeeze1x1
++            TensorShape(57U, 57U, 16U),
++            // fire2/relu_expand1x1, fire2/relu_expand3x3, fire3/relu_expand1x1, fire3/relu_expand3x3
++            TensorShape(57U, 57U, 64U),
++            // fire4/relu_squeeze1x1, fire5/relu_squeeze1x1
++            TensorShape(28U, 28U, 32U),
++            // fire4/relu_expand1x1, fire4/relu_expand3x3, fire5/relu_expand1x1, fire5/relu_expand3x3
++            TensorShape(28U, 28U, 128U),
++            // fire6/relu_squeeze1x1, fire7/relu_squeeze1x1
++            TensorShape(14U, 14U, 48U),
++            // fire6/relu_expand1x1, fire6/relu_expand3x3, fire7/relu_expand1x1, fire7/relu_expand3x3
++            TensorShape(14U, 14U, 192U),
++            // fire8/relu_squeeze1x1, fire9/relu_squeeze1x1
++            TensorShape(14U, 14U, 64U),
++            // fire8/relu_expand1x1, fire8/relu_expand3x3, fire9/relu_expand1x1, fire9/relu_expand3x3
++            TensorShape(14U, 14U, 256U),
++            // relu_conv10
++            TensorShape(14U, 14U, 1000U) }),
++        framework::dataset::make("Info", ActivationLayerInfo(ActivationLayerInfo::ActivationFunction::RELU))
++    }
++    {
++    }
++    TISqueezeNetActivationLayerDataset(TISqueezeNetActivationLayerDataset &&) = default;
++    ~TISqueezeNetActivationLayerDataset()                                   = default;
++};
++
+ } // namespace datasets
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..f10ae47
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch
@@ -0,0 +1,72 @@
+From 29995a6ada03fa3049e4ba06fd5e3bbc24624dfb Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:28:01 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ .../squeezenet/SqueezeNetConvolutionLayerDataset.h | 45 ++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+ mode change 100644 => 100755 tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h
+
+diff --git a/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h b/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h
+old mode 100644
+new mode 100755
+index f98d90a..cba37eb
+--- a/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h
++++ b/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h
+@@ -96,6 +96,51 @@ public:
+         add_config(TensorShape(13U, 13U, 512U), TensorShape(1U, 1U, 512U, 1000U), TensorShape(1000U), TensorShape(13U, 13U, 1000U), PadStrideInfo(1, 1, 0, 0));
+     }
+ };
++
++class TISqueezeNetConvolutionLayerDataset final : public ConvolutionLayerDataset
++{
++public:
++    TISqueezeNetConvolutionLayerDataset()
++    {
++        // conv1
++        add_config(TensorShape(227U, 227U, 3U), TensorShape(3U, 3U, 3U, 64U), TensorShape(64U), TensorShape(114U, 114U, 64U), PadStrideInfo(2, 2, 0, 0));
++        // fire2/squeeze1x1
++        add_config(TensorShape(57U, 57U, 64U), TensorShape(1U, 1U, 64U, 16U), TensorShape(16U), TensorShape(57U, 57U, 16U), PadStrideInfo(1, 1, 0, 0));
++        // fire2/expand1x1, fire3/expand1x1
++        add_config(TensorShape(57U, 57U, 16U), TensorShape(1U, 1U, 16U, 64U), TensorShape(64U), TensorShape(57U, 57U, 64U), PadStrideInfo(1, 1, 0, 0));
++        // fire2/expand3x3, fire3/expand3x3
++        add_config(TensorShape(57U, 57U, 16U), TensorShape(3U, 3U, 16U, 64U), TensorShape(64U), TensorShape(57U, 57U, 64U), PadStrideInfo(1, 1, 1, 1));
++        // fire3/squeeze1x1
++        add_config(TensorShape(57U, 57U, 128U), TensorShape(1U, 1U, 128U, 16U), TensorShape(16U), TensorShape(57U, 57U, 16U), PadStrideInfo(1, 1, 0, 0));
++        // fire4/squeeze1x1
++        add_config(TensorShape(28U, 28U, 128U), TensorShape(1U, 1U, 128U, 32U), TensorShape(32U), TensorShape(28U, 28U, 32U), PadStrideInfo(1, 1, 0, 0));
++        // fire4/expand1x1, fire5/expand1x1
++        add_config(TensorShape(28U, 28U, 32U), TensorShape(1U, 1U, 32U, 128U), TensorShape(128U), TensorShape(28U, 28U, 128U), PadStrideInfo(1, 1, 0, 0));
++        // fire4/expand3x3, fire5/expand3x3
++        add_config(TensorShape(28U, 28U, 32U), TensorShape(3U, 3U, 32U, 128U), TensorShape(128U), TensorShape(28U, 28U, 128U), PadStrideInfo(1, 1, 1, 1));
++        // fire5/squeeze1x1
++        add_config(TensorShape(28U, 28U, 256U), TensorShape(1U, 1U, 256U, 32U), TensorShape(32U), TensorShape(28U, 28U, 32U), PadStrideInfo(1, 1, 0, 0));
++        // fire6/squeeze1x1
++        add_config(TensorShape(14U, 14U, 256U), TensorShape(1U, 1U, 256U, 48U), TensorShape(48U), TensorShape(14U, 14U, 48U), PadStrideInfo(1, 1, 0, 0));
++        // fire6/expand1x1, fire7/expand1x1
++        add_config(TensorShape(14U, 14U, 48U), TensorShape(1U, 1U, 48U, 192U), TensorShape(192U), TensorShape(14U, 14U, 192U), PadStrideInfo(1, 1, 0, 0));
++        // fire6/expand3x3, fire7/expand3x3
++        add_config(TensorShape(14U, 14U, 48U), TensorShape(3U, 3U, 48U, 192U), TensorShape(192U), TensorShape(14U, 14U, 192U), PadStrideInfo(1, 1, 1, 1));
++        // fire7/squeeze1x1
++        add_config(TensorShape(14U, 14U, 384U), TensorShape(1U, 1U, 384U, 48U), TensorShape(48U), TensorShape(14U, 14U, 48U), PadStrideInfo(1, 1, 0, 0));
++        // fire8/squeeze1x1
++        add_config(TensorShape(14U, 14U, 384U), TensorShape(1U, 1U, 384U, 64U), TensorShape(64U), TensorShape(14U, 14U, 64U), PadStrideInfo(1, 1, 0, 0));
++        // fire8/expand1x1, fire9/expand1x1
++        add_config(TensorShape(14U, 14U, 64U), TensorShape(1U, 1U, 64U, 256U), TensorShape(256U), TensorShape(14U, 14U, 256U), PadStrideInfo(1, 1, 0, 0));
++        // fire8/expand3x3, fire9/expand3x3
++        add_config(TensorShape(14U, 14U, 64U), TensorShape(3U, 3U, 64U, 256U), TensorShape(256U), TensorShape(14U, 14U, 256U), PadStrideInfo(1, 1, 1, 1));
++        // fire9/squeeze1x1
++        add_config(TensorShape(14U, 14U, 512U), TensorShape(1U, 1U, 512U, 64U), TensorShape(64U), TensorShape(14U, 14U, 64U), PadStrideInfo(1, 1, 0, 0));
++        // conv10
++        add_config(TensorShape(14U, 14U, 512U), TensorShape(1U, 1U, 512U, 1000U), TensorShape(1000U), TensorShape(14U, 14U, 1000U), PadStrideInfo(1, 1, 0, 0));
++    }
++};
++
+ } // namespace datasets
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..09d696b
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch
@@ -0,0 +1,40 @@
+From b5cd4e25e6bf75e7c1c01b049cb4f3c8312cf3c4 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:28:26 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ .../system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+ mode change 100644 => 100755 tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h
+
+diff --git a/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h b/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h
+old mode 100644
+new mode 100755
+index 9518ce5..a168d29
+--- a/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h
++++ b/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h
+@@ -50,6 +50,19 @@ public:
+         add_config(TensorShape(27U, 27U, 256U), PoolingLayerInfo(PoolingType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
+     }
+ };
++class TISqueezeNetPoolingLayerDataset final : public PoolingLayerDataset
++{
++public:
++    TISqueezeNetPoolingLayerDataset()
++    {
++        // pool1
++        add_config(TensorShape(114U, 114U, 64U), PoolingLayerInfo(PoolingType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
++        // pool3
++        add_config(TensorShape(57U, 57U, 128U), PoolingLayerInfo(PoolingType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
++        // pool5
++        add_config(TensorShape(28U, 28U, 256U), PoolingLayerInfo(PoolingType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
++    }
++};
+ } // namespace datasets
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..b6fdfda
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch
@@ -0,0 +1,47 @@
+From b1eaba9516d4b303de399f81a31c629673e10715 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:33:47 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/benchmark/NEON/ActivationLayer.cpp | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/tests/benchmark/NEON/ActivationLayer.cpp b/tests/benchmark/NEON/ActivationLayer.cpp
+index 1c4ea21..7b47c11 100644
+--- a/tests/benchmark/NEON/ActivationLayer.cpp
++++ b/tests/benchmark/NEON/ActivationLayer.cpp
+@@ -51,9 +51,11 @@ namespace
+ #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
+ const auto data_types           = framework::dataset::make("DataType", { DataType::F16, DataType::F32 });
+ const auto data_types_mobilenet = framework::dataset::make("DataType", { DataType::F16, DataType::F32, DataType::QASYMM8 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ const auto data_types           = framework::dataset::make("DataType", { DataType::F32 });
+ const auto data_types_mobilenet = framework::dataset::make("DataType", { DataType::F32, DataType::QASYMM8 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ } // namespace
+ 
+@@ -127,6 +129,17 @@ REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2ActivationLayer, NEActivationLayerFixture,
+                                                             framework::dataset::make("Batches", { 4, 8 })));
+ TEST_SUITE_END()
+ TEST_SUITE_END()
++TEST_SUITE(TIBENCHMARK_SQUEEZENET)
++REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetActivationLayer, NEActivationLayerFixture, framework::DatasetMode::ALL,
++                                framework::dataset::combine(framework::dataset::combine(datasets::TISqueezeNetActivationLayerDataset(), data_types_tibenchmark),
++                                                            framework::dataset::make("Batches", 1)));
++TEST_SUITE_END()
++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1ActivationLayer, NEActivationLayerFixture, framework::DatasetMode::ALL,
++                                framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1ActivationLayerDataset(), data_types_tibenchmark),
++                                                            framework::dataset::make("Batches", 1)));
++TEST_SUITE_END()
++
+ } // namespace benchmark
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..a3ba90a
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch
@@ -0,0 +1,44 @@
+From e55693928008b7427e0517a64a59fde6a5b8dfcc Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:34:36 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/benchmark/NEON/ConvolutionLayer.cpp | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/tests/benchmark/NEON/ConvolutionLayer.cpp b/tests/benchmark/NEON/ConvolutionLayer.cpp
+index ac27e7a..6cfb00d 100644
+--- a/tests/benchmark/NEON/ConvolutionLayer.cpp
++++ b/tests/benchmark/NEON/ConvolutionLayer.cpp
+@@ -52,9 +52,10 @@ namespace
+ {
+ #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
+ const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32, DataType::QASYMM8 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #else /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ const auto data_types = framework::dataset::make("DataType", { DataType::F32, DataType::QASYMM8 });
+-
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ } // namespace
+ 
+@@ -197,6 +198,14 @@ REGISTER_FIXTURE_DATA_TEST_CASE(SqueezeNetWinogradLayer, NEWinogradConvolutionLa
+ 
+ TEST_SUITE_END()
+ TEST_SUITE_END()
++
++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1ConvolutionLayer, NEGEMMConvolutionLayerFixture, framework::DatasetMode::ALL,
++                                framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1ConvolutionLayerDataset(),
++                                                                                                                    framework::dataset::make("ActivationInfo", ActivationLayerInfo(ActivationLayerInfo::ActivationFunction::RELU))),
++                                                                                        data_types_tibenchmark),
++                                                            framework::dataset::make("Batches", 1)));
++TEST_SUITE_END()
+ } // namespace benchmark
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..9794d45
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch
@@ -0,0 +1,42 @@
+From 4ba5395a1e340bdc2334366036d8fcefdea7b963 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:35:28 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/benchmark/NEON/DirectConvolutionLayer.cpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/tests/benchmark/NEON/DirectConvolutionLayer.cpp b/tests/benchmark/NEON/DirectConvolutionLayer.cpp
+index f94ef6b..afdcbad 100644
+--- a/tests/benchmark/NEON/DirectConvolutionLayer.cpp
++++ b/tests/benchmark/NEON/DirectConvolutionLayer.cpp
+@@ -50,8 +50,10 @@ namespace
+ // Special data types for networks that need 5x5 direct convolution
+ #ifdef ARM_COMPUTE_ENABLE_F16
+ const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #else  /* ARM_COMPUTE_ENABLE_F16 */
+ const auto data_types = framework::dataset::make("DataType", { DataType::F32 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #endif /* ARM_COMPUTE_ENABLE_F16 */
+ } // namespace
+ 
+@@ -122,6 +124,13 @@ REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2DirectConvolutionLayer, NEDirectConvolutio
+ 
+ TEST_SUITE_END()
+ TEST_SUITE_END()
++TEST_SUITE(TIBENCHMARK_SQUEEZENET)
++REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetDirectConvolutionLayer, NEDirectConvolutionLayerFixture, framework::DatasetMode::ALL,
++                                framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::TISqueezeNetConvolutionLayerDataset(),
++                                                                                                                    framework::dataset::make("ActivationInfo", ActivationLayerInfo(ActivationLayerInfo::ActivationFunction::RELU))),
++                                                                                        data_types_tibenchmark),
++                                                            framework::dataset::make("Batches", 1)));
++TEST_SUITE_END()
+ } // namespace benchmark
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..3398991
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch
@@ -0,0 +1,42 @@
+From 6eedcbe989861d05cf684d75464b2fbd80db1be5 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:36:08 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/benchmark/NEON/FullyConnectedLayer.cpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/tests/benchmark/NEON/FullyConnectedLayer.cpp b/tests/benchmark/NEON/FullyConnectedLayer.cpp
+index d0fb04f..9ee852d 100644
+--- a/tests/benchmark/NEON/FullyConnectedLayer.cpp
++++ b/tests/benchmark/NEON/FullyConnectedLayer.cpp
+@@ -47,8 +47,10 @@ namespace
+ {
+ #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
+ const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ const auto data_types = framework::dataset::make("DataType", { DataType::F32 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ } // namespace
+ 
+@@ -108,6 +110,13 @@ REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV4FullyConnectedLayer, NEFully
+                                                             framework::dataset::make("Batches", { 4, 8 })));
+ TEST_SUITE_END()
+ TEST_SUITE_END()
++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1FullyConnectedLayer, NEFullyConnectedLayerFixture, framework::DatasetMode::ALL,
++                                framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1FullyConnectedLayerDataset(),
++                                                                                        data_types_tibenchmark),
++                                                            framework::dataset::make("Batches", 1)));
++TEST_SUITE_END()
++
+ } // namespace benchmark
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..83bf2d4
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch
@@ -0,0 +1,29 @@
+From 1e889f937a8a7536ea97a6349d59a20a3a230d75 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:36:57 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/benchmark/NEON/GEMMLowp.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/benchmark/NEON/GEMMLowp.cpp b/tests/benchmark/NEON/GEMMLowp.cpp
+index 4b13f31..c2c6bdf 100644
+--- a/tests/benchmark/NEON/GEMMLowp.cpp
++++ b/tests/benchmark/NEON/GEMMLowp.cpp
+@@ -50,6 +50,11 @@ REGISTER_FIXTURE_DATA_TEST_CASE(MatrixMultiplyGEMMLowp, NEGEMMLowpFixture, frame
+ REGISTER_FIXTURE_DATA_TEST_CASE(GoogleNetGEMMLowp, NEGEMMLowpFixture, framework::DatasetMode::NIGHTLY, datasets::GoogleNetGEMMDataset());
+ 
+ TEST_SUITE_END()
++
++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1GEMMLowp, NEGEMMLowpFixture, framework::DatasetMode::ALL, datasets::GoogLeNetInceptionV1GEMMDataset());
++TEST_SUITE_END()
++
+ } // namespace benchmark
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..60d34d0
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch
@@ -0,0 +1,42 @@
+From c34011248a4fb2aaafedda6d4ef4dd2517fa609d Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:37:59 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/benchmark/NEON/NormalizationLayer.cpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/tests/benchmark/NEON/NormalizationLayer.cpp b/tests/benchmark/NEON/NormalizationLayer.cpp
+index 0c9a864..3654ef5 100644
+--- a/tests/benchmark/NEON/NormalizationLayer.cpp
++++ b/tests/benchmark/NEON/NormalizationLayer.cpp
+@@ -44,8 +44,10 @@ namespace
+ {
+ #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
+ const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ const auto data_types = framework::dataset::make("DataType", { DataType::F32 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ } // namespace
+ using NENormalizationLayerFixture = NormalizationLayerFixture<Tensor, NENormalizationLayer, Accessor>;
+@@ -74,6 +76,13 @@ REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1NormalizationLayer, NENormal
+                                                             framework::dataset::make("Batches", { 4, 8 })));
+ TEST_SUITE_END()
+ TEST_SUITE_END()
++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1NormalizationLayer, NENormalizationLayerFixture, framework::DatasetMode::ALL,
++                                framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1NormalizationLayerDataset(),
++                                                                                        data_types_tibenchmark),
++                                                            framework::dataset::make("Batches", 1)));
++TEST_SUITE_END()
++
+ } // namespace benchmark
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..1032274
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch
@@ -0,0 +1,48 @@
+From 1618af970829c0ff2b4462376387d14eaccc78e4 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Tue, 23 Oct 2018 10:38:29 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/benchmark/NEON/PoolingLayer.cpp | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/tests/benchmark/NEON/PoolingLayer.cpp b/tests/benchmark/NEON/PoolingLayer.cpp
+index 8b7ee84..de93006 100644
+--- a/tests/benchmark/NEON/PoolingLayer.cpp
++++ b/tests/benchmark/NEON/PoolingLayer.cpp
+@@ -48,10 +48,13 @@ namespace benchmark
+ namespace
+ {
+ const auto data_layouts = framework::dataset::make("DataLayout", { DataLayout::NCHW, DataLayout::NHWC });
++const auto data_layouts_tibenchmark = framework::dataset::make("DataLayout", { DataLayout::NCHW});
+ #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
+ const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32, DataType::QASYMM8 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ const auto data_types = framework::dataset::make("DataType", { DataType::F32, DataType::QASYMM8 });
++const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
+ #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
+ } // namespace
+ 
+@@ -107,6 +110,16 @@ REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2PoolingLayer, NEPoolingLayerFixture, frame
+                                 framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::YOLOV2PoolingLayerDataset(), data_types), data_layouts), framework::dataset::make("Batches", { 4, 8 })));
+ TEST_SUITE_END()
+ TEST_SUITE_END()
++
++TEST_SUITE(TIBENCHMARK_SQUEEZENET)
++REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetPoolingLayer, NEPoolingLayerFixture, framework::DatasetMode::ALL,
++                                framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::TISqueezeNetPoolingLayerDataset(), data_types_tibenchmark), data_layouts_tibenchmark), framework::dataset::make("Batches", 1)));
++TEST_SUITE_END()
++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1PoolingLayer, NEPoolingLayerFixture, framework::DatasetMode::ALL,
++                                framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1PoolingLayerDataset(), data_types_tibenchmark), data_layouts_tibenchmark), framework::dataset::make("Batches",
++                                                            1)));
++TEST_SUITE_END()
+ } // namespace benchmark
+ } // namespace test
+ } // namespace arm_compute
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch
new file mode 100755
index 0000000..f527351
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch
@@ -0,0 +1,35 @@
+From 01161226c58ff48728dad53ed8fa04a0c534bfa5 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Wed, 24 Oct 2018 16:10:11 -0400
+Subject: [PATCH] add ti benchmark test group
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/framework/printers/PrettyPrinter.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/framework/printers/PrettyPrinter.cpp b/tests/framework/printers/PrettyPrinter.cpp
+index 3181951..2222286 100644
+--- a/tests/framework/printers/PrettyPrinter.cpp
++++ b/tests/framework/printers/PrettyPrinter.cpp
+@@ -83,7 +83,7 @@ void PrettyPrinter::print_run_footer()
+ 
+ void PrettyPrinter::print_test_header(const TestInfo &info)
+ {
+-    *_stream << begin_color("2") << "Running [" << info.id << "] '" << info.name << "'" << end_color() << "\n";
++    *_stream << begin_color("2") << "Running [" << info.id << "] '" << info.name << "'" << end_color() << "	";
+ }
+ 
+ void PrettyPrinter::print_test_footer()
+@@ -125,7 +125,7 @@ void PrettyPrinter::print_measurements(const Profiler::MeasurementsMap &measurem
+         InstrumentsStats stats(instrument.second);
+ 
+         *_stream << "    ";
+-        *_stream << "AVG=" << stats.mean() << " " << stats.max().unit();
++        *_stream << "AVG=	" << stats.mean() << "	" << stats.max().unit();
+         if(instrument.second.size() > 1)
+         {
+             *_stream << ", STDDEV=" << arithmetic_to_string(stats.relative_standard_deviation(), 2) << " %";
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
index 8a65ade..fc038f9 100644
--- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
@@ -1,18 +1,30 @@
 SUMMARY = "The ARM Computer Vision and Machine Learning library"
 DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c93841b20cd522af621cabaea3aef8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
 
-COMPATIBLE_MACHINE = "armv7a"
+COMPATIBLE_MACHINE = "armv7a|aarch64"
 
 SRC_URI = " \
     git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
+    file://0001-add-ti-benchmark-test-group.patch \
+    file://0002-add-ti-benchmark-test-group.patch \
+    file://0003-add-ti-benchmark-test-group.patch \
+    file://0004-add-ti-benchmark-test-group.patch \
+    file://0005-add-ti-benchmark-test-group.patch \
+    file://0006-add-ti-benchmark-test-group.patch \
+    file://0007-add-ti-benchmark-test-group.patch \
+    file://0008-add-ti-benchmark-test-group.patch \
+    file://0009-add-ti-benchmark-test-group.patch \
+    file://0010-add-ti-benchmark-test-group.patch \
+    file://0011-add-ti-benchmark-test-group.patch \
 "
 
-PV  = "18.05"
+PV  = "18.08"
+PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
 BRANCH = "master"
-SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
+SRCREV = "52ba29e936b8e711e8acdfe819e36f884d4f3fe1"
 
 S = "${WORKDIR}/git"
 
@@ -22,7 +34,8 @@ do_compile_prepend() {
 
 inherit scons
 
-EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0"
+EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0 set_soname=1"
+EXTRA_OESCONS_aarch64 = "arch=arm64-v8a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0 set_soname=1"
 
 LIBS += "-larmpl_lp64_mp"
 
@@ -30,7 +43,7 @@ do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 
     install -m 0755 -d ${D}${libdir}
-    for lib in ${S}/build/*.so
+    for lib in ${WORKDIR}/git/build/*.so*
     do
         install -m 0755 $lib ${D}${libdir}
     done
@@ -45,14 +58,11 @@ do_install() {
     cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
 }
 
-SOLIBS = ".so"
-FILES_SOLIBSDEV = ""
-INSANE_SKIP_${PN} = "ldflags"
+INSANE_SKIP_${PN} = "ldflags dev-so"
 INSANE_SKIP_${PN}-dev = "dev-elf ldflags"
 
-PACKAGES =+ "${PN}-source"
 FILES_${PN} += "${bindir}/*"
-FILES_${PN} += "${libdir}/*.so"
+FILES_${PN} += "${libdir}/*.so*"
 FILES_${PN}-source = "${datadir}/${BPN}"
 INSANE_SKIP_${PN}-source = "ldflags libdir staticdev"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.9.1


