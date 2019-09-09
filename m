Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9C9E7529E4
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 14:16:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89EFlS6087602
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 09:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568038547;
	bh=UAwh1YoEEgnl5PQon6tPiWG/TJ6GTa6IJcSh4blxCb0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Q8HqY32/h+ZLqzxJgtj3LglSyTLUeX4NUGZ1/8YOwIl52pIXg8wBWYRMht/8XgHld
	J5PJpbGvnlMtfNfV6eyGqQq8UiCCycXJBqN74mO5F4+zGvdOIb7FQy5AnVDD5FxFH0
	F7AEc+jDu4iLIsU5kpxpmaAwameZSLF8pP+4V8r4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89EFlhg120301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 09:15:47 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 09:15:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 09:15:47 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89EFkQ8019686;
	Mon, 9 Sep 2019 09:15:47 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190903155203.23271-1-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <80acf9bf-9434-eac2-0b41-2c53fa52dcf5@ti.com>
Date: Mon, 9 Sep 2019 10:15:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903155203.23271-1-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH 1/2] arm-compute-library: Upgrade to 19.08 release
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
X-List-Received-Date: Mon, 09 Sep 2019 14:16:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you backport this to ti2019.03?


Thanks,

Jake

On 9/3/2019 11:52 AM, Djordje Senicic wrote:
> - Upgrade to the latest release
> - Remove custom modifications, as profiling is done using armnn
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../0001-add-ti-benchmark-test-group.patch    | 61 ----------------
>   .../0002-add-ti-benchmark-test-group.patch    | 71 -------------------
>   .../0003-add-ti-benchmark-test-group.patch    | 39 ----------
>   .../0004-add-ti-benchmark-test-group.patch    | 49 -------------
>   .../0005-add-ti-benchmark-test-group.patch    | 46 ------------
>   .../0006-add-ti-benchmark-test-group.patch    | 44 ------------
>   .../0007-add-ti-benchmark-test-group.patch    | 44 ------------
>   .../0008-add-ti-benchmark-test-group.patch    | 31 --------
>   .../0009-add-ti-benchmark-test-group.patch    | 44 ------------
>   .../0010-add-ti-benchmark-test-group.patch    | 50 -------------
>   .../0011-add-ti-benchmark-test-group.patch    | 37 ----------
>   .../arm-compute-library_git.bb                | 19 ++---
>   12 files changed, 4 insertions(+), 531 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch
>   delete mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch
>
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index f00561ef..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 497a8abf760dbd9be715dfe6abf81c670fc85912 Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:16:33 -0500
> -Subject: [PATCH 01/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - .../squeezenet/SqueezeNetActivationLayerDataset.h  | 35 ++++++++++++++++++++++
> - 1 file changed, 35 insertions(+)
> -
> -diff --git a/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h b/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h
> -index 7f4bf4d..a66f473 100644
> ---- a/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h
> -+++ b/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDataset.h
> -@@ -71,6 +71,41 @@ public:
> -     SqueezeNetActivationLayerDataset(SqueezeNetActivationLayerDataset &&) = default;
> -     ~SqueezeNetActivationLayerDataset()                                   = default;
> - };
> -+class TISqueezeNetActivationLayerDataset final : public
> -+    framework::dataset::CartesianProductDataset<framework::dataset::InitializerListDataset<TensorShape>, framework::dataset::SingletonDataset<ActivationLayerInfo>>
> -+{
> -+public:
> -+    TISqueezeNetActivationLayerDataset()
> -+        : CartesianProductDataset
> -+    {
> -+        framework::dataset::make("Shape", { // relu_conv1
> -+            TensorShape(114U, 114U, 64U),
> -+            // fire2/relu_squeeze1x1, fire3/relu_squeeze1x1
> -+            TensorShape(57U, 57U, 16U),
> -+            // fire2/relu_expand1x1, fire2/relu_expand3x3, fire3/relu_expand1x1, fire3/relu_expand3x3
> -+            TensorShape(57U, 57U, 64U),
> -+            // fire4/relu_squeeze1x1, fire5/relu_squeeze1x1
> -+            TensorShape(28U, 28U, 32U),
> -+            // fire4/relu_expand1x1, fire4/relu_expand3x3, fire5/relu_expand1x1, fire5/relu_expand3x3
> -+            TensorShape(28U, 28U, 128U),
> -+            // fire6/relu_squeeze1x1, fire7/relu_squeeze1x1
> -+            TensorShape(14U, 14U, 48U),
> -+            // fire6/relu_expand1x1, fire6/relu_expand3x3, fire7/relu_expand1x1, fire7/relu_expand3x3
> -+            TensorShape(14U, 14U, 192U),
> -+            // fire8/relu_squeeze1x1, fire9/relu_squeeze1x1
> -+            TensorShape(14U, 14U, 64U),
> -+            // fire8/relu_expand1x1, fire8/relu_expand3x3, fire9/relu_expand1x1, fire9/relu_expand3x3
> -+            TensorShape(14U, 14U, 256U),
> -+            // relu_conv10
> -+            TensorShape(14U, 14U, 1000U) }),
> -+        framework::dataset::make("Info", ActivationLayerInfo(ActivationLayerInfo::ActivationFunction::RELU))
> -+    }
> -+    {
> -+    }
> -+    TISqueezeNetActivationLayerDataset(TISqueezeNetActivationLayerDataset &&) = default;
> -+    ~TISqueezeNetActivationLayerDataset()                                   = default;
> -+};
> -+
> - } // namespace datasets
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index f891f74a..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 39ebc12e4de88a7839e33755c65cb9b9f0e8535f Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:17:19 -0500
> -Subject: [PATCH 02/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - .../squeezenet/SqueezeNetConvolutionLayerDataset.h | 45 ++++++++++++++++++++++
> - 1 file changed, 45 insertions(+)
> -
> -diff --git a/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h b/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h
> -index f98d90a..cba37eb 100644
> ---- a/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h
> -+++ b/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDataset.h
> -@@ -96,6 +96,51 @@ public:
> -         add_config(TensorShape(13U, 13U, 512U), TensorShape(1U, 1U, 512U, 1000U), TensorShape(1000U), TensorShape(13U, 13U, 1000U), PadStrideInfo(1, 1, 0, 0));
> -     }
> - };
> -+
> -+class TISqueezeNetConvolutionLayerDataset final : public ConvolutionLayerDataset
> -+{
> -+public:
> -+    TISqueezeNetConvolutionLayerDataset()
> -+    {
> -+        // conv1
> -+        add_config(TensorShape(227U, 227U, 3U), TensorShape(3U, 3U, 3U, 64U), TensorShape(64U), TensorShape(114U, 114U, 64U), PadStrideInfo(2, 2, 0, 0));
> -+        // fire2/squeeze1x1
> -+        add_config(TensorShape(57U, 57U, 64U), TensorShape(1U, 1U, 64U, 16U), TensorShape(16U), TensorShape(57U, 57U, 16U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire2/expand1x1, fire3/expand1x1
> -+        add_config(TensorShape(57U, 57U, 16U), TensorShape(1U, 1U, 16U, 64U), TensorShape(64U), TensorShape(57U, 57U, 64U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire2/expand3x3, fire3/expand3x3
> -+        add_config(TensorShape(57U, 57U, 16U), TensorShape(3U, 3U, 16U, 64U), TensorShape(64U), TensorShape(57U, 57U, 64U), PadStrideInfo(1, 1, 1, 1));
> -+        // fire3/squeeze1x1
> -+        add_config(TensorShape(57U, 57U, 128U), TensorShape(1U, 1U, 128U, 16U), TensorShape(16U), TensorShape(57U, 57U, 16U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire4/squeeze1x1
> -+        add_config(TensorShape(28U, 28U, 128U), TensorShape(1U, 1U, 128U, 32U), TensorShape(32U), TensorShape(28U, 28U, 32U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire4/expand1x1, fire5/expand1x1
> -+        add_config(TensorShape(28U, 28U, 32U), TensorShape(1U, 1U, 32U, 128U), TensorShape(128U), TensorShape(28U, 28U, 128U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire4/expand3x3, fire5/expand3x3
> -+        add_config(TensorShape(28U, 28U, 32U), TensorShape(3U, 3U, 32U, 128U), TensorShape(128U), TensorShape(28U, 28U, 128U), PadStrideInfo(1, 1, 1, 1));
> -+        // fire5/squeeze1x1
> -+        add_config(TensorShape(28U, 28U, 256U), TensorShape(1U, 1U, 256U, 32U), TensorShape(32U), TensorShape(28U, 28U, 32U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire6/squeeze1x1
> -+        add_config(TensorShape(14U, 14U, 256U), TensorShape(1U, 1U, 256U, 48U), TensorShape(48U), TensorShape(14U, 14U, 48U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire6/expand1x1, fire7/expand1x1
> -+        add_config(TensorShape(14U, 14U, 48U), TensorShape(1U, 1U, 48U, 192U), TensorShape(192U), TensorShape(14U, 14U, 192U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire6/expand3x3, fire7/expand3x3
> -+        add_config(TensorShape(14U, 14U, 48U), TensorShape(3U, 3U, 48U, 192U), TensorShape(192U), TensorShape(14U, 14U, 192U), PadStrideInfo(1, 1, 1, 1));
> -+        // fire7/squeeze1x1
> -+        add_config(TensorShape(14U, 14U, 384U), TensorShape(1U, 1U, 384U, 48U), TensorShape(48U), TensorShape(14U, 14U, 48U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire8/squeeze1x1
> -+        add_config(TensorShape(14U, 14U, 384U), TensorShape(1U, 1U, 384U, 64U), TensorShape(64U), TensorShape(14U, 14U, 64U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire8/expand1x1, fire9/expand1x1
> -+        add_config(TensorShape(14U, 14U, 64U), TensorShape(1U, 1U, 64U, 256U), TensorShape(256U), TensorShape(14U, 14U, 256U), PadStrideInfo(1, 1, 0, 0));
> -+        // fire8/expand3x3, fire9/expand3x3
> -+        add_config(TensorShape(14U, 14U, 64U), TensorShape(3U, 3U, 64U, 256U), TensorShape(256U), TensorShape(14U, 14U, 256U), PadStrideInfo(1, 1, 1, 1));
> -+        // fire9/squeeze1x1
> -+        add_config(TensorShape(14U, 14U, 512U), TensorShape(1U, 1U, 512U, 64U), TensorShape(64U), TensorShape(14U, 14U, 64U), PadStrideInfo(1, 1, 0, 0));
> -+        // conv10
> -+        add_config(TensorShape(14U, 14U, 512U), TensorShape(1U, 1U, 512U, 1000U), TensorShape(1000U), TensorShape(14U, 14U, 1000U), PadStrideInfo(1, 1, 0, 0));
> -+    }
> -+};
> -+
> - } // namespace datasets
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index 4a80548e..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 8c433526117e4aa5480efdbe5718ee54e9de2ff5 Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:17:43 -0500
> -Subject: [PATCH 03/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - .../system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h | 13 +++++++++++++
> - 1 file changed, 13 insertions(+)
> -
> -diff --git a/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h b/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h
> -index 9518ce5..a168d29 100644
> ---- a/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h
> -+++ b/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h
> -@@ -50,6 +50,19 @@ public:
> -         add_config(TensorShape(27U, 27U, 256U), PoolingLayerInfo(PoolingType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
> -     }
> - };
> -+class TISqueezeNetPoolingLayerDataset final : public PoolingLayerDataset
> -+{
> -+public:
> -+    TISqueezeNetPoolingLayerDataset()
> -+    {
> -+        // pool1
> -+        add_config(TensorShape(114U, 114U, 64U), PoolingLayerInfo(PoolingType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
> -+        // pool3
> -+        add_config(TensorShape(57U, 57U, 128U), PoolingLayerInfo(PoolingType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
> -+        // pool5
> -+        add_config(TensorShape(28U, 28U, 256U), PoolingLayerInfo(PoolingType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
> -+    }
> -+};
> - } // namespace datasets
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index 9693e6c9..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From c2e6412d2aa9137b4b1b75d091ba9c8a53ede99b Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:18:05 -0500
> -Subject: [PATCH 04/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - tests/benchmark/NEON/ActivationLayer.cpp | 13 +++++++++++++
> - 1 file changed, 13 insertions(+)
> -
> -diff --git a/tests/benchmark/NEON/ActivationLayer.cpp b/tests/benchmark/NEON/ActivationLayer.cpp
> -index 1c4ea21..7b47c11 100644
> ---- a/tests/benchmark/NEON/ActivationLayer.cpp
> -+++ b/tests/benchmark/NEON/ActivationLayer.cpp
> -@@ -51,9 +51,11 @@ namespace
> - #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> - const auto data_types           = framework::dataset::make("DataType", { DataType::F16, DataType::F32 });
> - const auto data_types_mobilenet = framework::dataset::make("DataType", { DataType::F16, DataType::F32, DataType::QASYMM8 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - const auto data_types           = framework::dataset::make("DataType", { DataType::F32 });
> - const auto data_types_mobilenet = framework::dataset::make("DataType", { DataType::F32, DataType::QASYMM8 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - } // namespace
> -
> -@@ -127,6 +129,17 @@ REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2ActivationLayer, NEActivationLayerFixture,
> -                                                             framework::dataset::make("Batches", { 4, 8 })));
> - TEST_SUITE_END()
> - TEST_SUITE_END()
> -+TEST_SUITE(TIBENCHMARK_SQUEEZENET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetActivationLayer, NEActivationLayerFixture, framework::DatasetMode::ALL,
> -+                                framework::dataset::combine(framework::dataset::combine(datasets::TISqueezeNetActivationLayerDataset(), data_types_tibenchmark),
> -+                                                            framework::dataset::make("Batches", 1)));
> -+TEST_SUITE_END()
> -+TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1ActivationLayer, NEActivationLayerFixture, framework::DatasetMode::ALL,
> -+                                framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1ActivationLayerDataset(), data_types_tibenchmark),
> -+                                                            framework::dataset::make("Batches", 1)));
> -+TEST_SUITE_END()
> -+
> - } // namespace benchmark
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index f498ffa5..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 14ba479fe707af2575fac4d2780e31a10264d295 Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:18:32 -0500
> -Subject: [PATCH 05/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - tests/benchmark/NEON/ConvolutionLayer.cpp | 11 ++++++++++-
> - 1 file changed, 10 insertions(+), 1 deletion(-)
> -
> -diff --git a/tests/benchmark/NEON/ConvolutionLayer.cpp b/tests/benchmark/NEON/ConvolutionLayer.cpp
> -index ac27e7a..6cfb00d 100644
> ---- a/tests/benchmark/NEON/ConvolutionLayer.cpp
> -+++ b/tests/benchmark/NEON/ConvolutionLayer.cpp
> -@@ -52,9 +52,10 @@ namespace
> - {
> - #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> - const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32, DataType::QASYMM8 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #else /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - const auto data_types = framework::dataset::make("DataType", { DataType::F32, DataType::QASYMM8 });
> --
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - } // namespace
> -
> -@@ -197,6 +198,14 @@ REGISTER_FIXTURE_DATA_TEST_CASE(SqueezeNetWinogradLayer, NEWinogradConvolutionLa
> -
> - TEST_SUITE_END()
> - TEST_SUITE_END()
> -+
> -+TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1ConvolutionLayer, NEGEMMConvolutionLayerFixture, framework::DatasetMode::ALL,
> -+                                framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1ConvolutionLayerDataset(),
> -+                                                                                                                    framework::dataset::make("ActivationInfo", ActivationLayerInfo(ActivationLayerInfo::ActivationFunction::RELU))),
> -+                                                                                        data_types_tibenchmark),
> -+                                                            framework::dataset::make("Batches", 1)));
> -+TEST_SUITE_END()
> - } // namespace benchmark
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index 3dfc2e75..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From c0c2b79824a52dee291b275a0f0a66746a99dbf5 Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:18:50 -0500
> -Subject: [PATCH 06/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - tests/benchmark/NEON/DirectConvolutionLayer.cpp | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/tests/benchmark/NEON/DirectConvolutionLayer.cpp b/tests/benchmark/NEON/DirectConvolutionLayer.cpp
> -index f94ef6b..afdcbad 100644
> ---- a/tests/benchmark/NEON/DirectConvolutionLayer.cpp
> -+++ b/tests/benchmark/NEON/DirectConvolutionLayer.cpp
> -@@ -50,8 +50,10 @@ namespace
> - // Special data types for networks that need 5x5 direct convolution
> - #ifdef ARM_COMPUTE_ENABLE_F16
> - const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #else  /* ARM_COMPUTE_ENABLE_F16 */
> - const auto data_types = framework::dataset::make("DataType", { DataType::F32 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #endif /* ARM_COMPUTE_ENABLE_F16 */
> - } // namespace
> -
> -@@ -122,6 +124,13 @@ REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2DirectConvolutionLayer, NEDirectConvolutio
> -
> - TEST_SUITE_END()
> - TEST_SUITE_END()
> -+TEST_SUITE(TIBENCHMARK_SQUEEZENET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetDirectConvolutionLayer, NEDirectConvolutionLayerFixture, framework::DatasetMode::ALL,
> -+                                framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::TISqueezeNetConvolutionLayerDataset(),
> -+                                                                                                                    framework::dataset::make("ActivationInfo", ActivationLayerInfo(ActivationLayerInfo::ActivationFunction::RELU))),
> -+                                                                                        data_types_tibenchmark),
> -+                                                            framework::dataset::make("Batches", 1)));
> -+TEST_SUITE_END()
> - } // namespace benchmark
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index a1ed073e..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From e8c375920cd21e6e151aabaa88b68358296bbe87 Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:19:10 -0500
> -Subject: [PATCH 07/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - tests/benchmark/NEON/FullyConnectedLayer.cpp | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/tests/benchmark/NEON/FullyConnectedLayer.cpp b/tests/benchmark/NEON/FullyConnectedLayer.cpp
> -index d0fb04f..9ee852d 100644
> ---- a/tests/benchmark/NEON/FullyConnectedLayer.cpp
> -+++ b/tests/benchmark/NEON/FullyConnectedLayer.cpp
> -@@ -47,8 +47,10 @@ namespace
> - {
> - #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> - const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - const auto data_types = framework::dataset::make("DataType", { DataType::F32 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - } // namespace
> -
> -@@ -108,6 +110,13 @@ REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV4FullyConnectedLayer, NEFully
> -                                                             framework::dataset::make("Batches", { 4, 8 })));
> - TEST_SUITE_END()
> - TEST_SUITE_END()
> -+TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1FullyConnectedLayer, NEFullyConnectedLayerFixture, framework::DatasetMode::ALL,
> -+                                framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1FullyConnectedLayerDataset(),
> -+                                                                                        data_types_tibenchmark),
> -+                                                            framework::dataset::make("Batches", 1)));
> -+TEST_SUITE_END()
> -+
> - } // namespace benchmark
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index dcf0989a..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From d657c798ec32c6a0f08384f725f3b8601d035300 Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:19:26 -0500
> -Subject: [PATCH 08/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - tests/benchmark/NEON/GEMMLowp.cpp | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/tests/benchmark/NEON/GEMMLowp.cpp b/tests/benchmark/NEON/GEMMLowp.cpp
> -index 4b13f31..c2c6bdf 100644
> ---- a/tests/benchmark/NEON/GEMMLowp.cpp
> -+++ b/tests/benchmark/NEON/GEMMLowp.cpp
> -@@ -50,6 +50,11 @@ REGISTER_FIXTURE_DATA_TEST_CASE(MatrixMultiplyGEMMLowp, NEGEMMLowpFixture, frame
> - REGISTER_FIXTURE_DATA_TEST_CASE(GoogleNetGEMMLowp, NEGEMMLowpFixture, framework::DatasetMode::NIGHTLY, datasets::GoogleNetGEMMDataset());
> -
> - TEST_SUITE_END()
> -+
> -+TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1GEMMLowp, NEGEMMLowpFixture, framework::DatasetMode::ALL, datasets::GoogLeNetInceptionV1GEMMDataset());
> -+TEST_SUITE_END()
> -+
> - } // namespace benchmark
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index 8498e27c..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 5e6db070b3cc563095991eaaab5d4c1fe8f12fcf Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:19:42 -0500
> -Subject: [PATCH 09/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - tests/benchmark/NEON/NormalizationLayer.cpp | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/tests/benchmark/NEON/NormalizationLayer.cpp b/tests/benchmark/NEON/NormalizationLayer.cpp
> -index 0c9a864..3654ef5 100644
> ---- a/tests/benchmark/NEON/NormalizationLayer.cpp
> -+++ b/tests/benchmark/NEON/NormalizationLayer.cpp
> -@@ -44,8 +44,10 @@ namespace
> - {
> - #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> - const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - const auto data_types = framework::dataset::make("DataType", { DataType::F32 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - } // namespace
> - using NENormalizationLayerFixture = NormalizationLayerFixture<Tensor, NENormalizationLayer, Accessor>;
> -@@ -74,6 +76,13 @@ REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1NormalizationLayer, NENormal
> -                                                             framework::dataset::make("Batches", { 4, 8 })));
> - TEST_SUITE_END()
> - TEST_SUITE_END()
> -+TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1NormalizationLayer, NENormalizationLayerFixture, framework::DatasetMode::ALL,
> -+                                framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1NormalizationLayerDataset(),
> -+                                                                                        data_types_tibenchmark),
> -+                                                            framework::dataset::make("Batches", 1)));
> -+TEST_SUITE_END()
> -+
> - } // namespace benchmark
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index 4c562e79..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 76a4ca1417987c6542dd76b625d001ae8f30657e Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:19:58 -0500
> -Subject: [PATCH 10/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - tests/benchmark/NEON/PoolingLayer.cpp | 13 +++++++++++++
> - 1 file changed, 13 insertions(+)
> -
> -diff --git a/tests/benchmark/NEON/PoolingLayer.cpp b/tests/benchmark/NEON/PoolingLayer.cpp
> -index 8b7ee84..de93006 100644
> ---- a/tests/benchmark/NEON/PoolingLayer.cpp
> -+++ b/tests/benchmark/NEON/PoolingLayer.cpp
> -@@ -48,10 +48,13 @@ namespace benchmark
> - namespace
> - {
> - const auto data_layouts = framework::dataset::make("DataLayout", { DataLayout::NCHW, DataLayout::NHWC });
> -+const auto data_layouts_tibenchmark = framework::dataset::make("DataLayout", { DataLayout::NCHW});
> - #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> - const auto data_types = framework::dataset::make("DataType", { DataType::F16, DataType::F32, DataType::QASYMM8 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - const auto data_types = framework::dataset::make("DataType", { DataType::F32, DataType::QASYMM8 });
> -+const auto data_types_tibenchmark = framework::dataset::make("DataType", { DataType::F32 });
> - #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> - } // namespace
> -
> -@@ -107,6 +110,16 @@ REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2PoolingLayer, NEPoolingLayerFixture, frame
> -                                 framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::YOLOV2PoolingLayerDataset(), data_types), data_layouts), framework::dataset::make("Batches", { 4, 8 })));
> - TEST_SUITE_END()
> - TEST_SUITE_END()
> -+
> -+TEST_SUITE(TIBENCHMARK_SQUEEZENET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetPoolingLayer, NEPoolingLayerFixture, framework::DatasetMode::ALL,
> -+                                framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::TISqueezeNetPoolingLayerDataset(), data_types_tibenchmark), data_layouts_tibenchmark), framework::dataset::make("Batches", 1)));
> -+TEST_SUITE_END()
> -+TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> -+REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1PoolingLayer, NEPoolingLayerFixture, framework::DatasetMode::ALL,
> -+                                framework::dataset::combine(framework::dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1PoolingLayerDataset(), data_types_tibenchmark), data_layouts_tibenchmark), framework::dataset::make("Batches",
> -+                                                            1)));
> -+TEST_SUITE_END()
> - } // namespace benchmark
> - } // namespace test
> - } // namespace arm_compute
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch
> deleted file mode 100644
> index fd3a9d13..00000000
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 012d21f475e1a004c2a7f688835a1b5416c3b8b6 Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Tue, 27 Nov 2018 17:20:10 -0500
> -Subject: [PATCH 11/11] add TI benchmark test group
> -
> -Upstream-Status: Inappropriate [TI only test code]
> -
> -Signed-off-by: Qin Su <qsu@ti.com>
> ----
> - tests/framework/printers/PrettyPrinter.cpp | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tests/framework/printers/PrettyPrinter.cpp b/tests/framework/printers/PrettyPrinter.cpp
> -index 3181951..2222286 100644
> ---- a/tests/framework/printers/PrettyPrinter.cpp
> -+++ b/tests/framework/printers/PrettyPrinter.cpp
> -@@ -83,7 +83,7 @@ void PrettyPrinter::print_run_footer()
> -
> - void PrettyPrinter::print_test_header(const TestInfo &info)
> - {
> --    *_stream << begin_color("2") << "Running [" << info.id << "] '" << info.name << "'" << end_color() << "\n";
> -+    *_stream << begin_color("2") << "Running [" << info.id << "] '" << info.name << "'" << end_color() << "	";
> - }
> -
> - void PrettyPrinter::print_test_footer()
> -@@ -125,7 +125,7 @@ void PrettyPrinter::print_measurements(const Profiler::MeasurementsMap &measurem
> -         InstrumentsStats stats(instrument.second);
> -
> -         *_stream << "    ";
> --        *_stream << "AVG=" << stats.mean() << " " << stats.max().unit();
> -+        *_stream << "AVG=	" << stats.mean() << "	" << stats.max().unit();
> -         if(instrument.second.size() > 1)
> -         {
> -             *_stream << ", STDDEV=" << arithmetic_to_string(stats.relative_standard_deviation(), 2) << " %";
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> index a33a2bc1..07e91e00 100644
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> @@ -7,25 +7,14 @@ COMPATIBLE_MACHINE = "armv7a|aarch64"
>   
>   SRC_URI = " \
>       git://review.mlplatform.org/ml/ComputeLibrary;protocol=https;branch=${BRANCH} \
> -    file://0001-add-ti-benchmark-test-group.patch \
> -    file://0002-add-ti-benchmark-test-group.patch \
> -    file://0003-add-ti-benchmark-test-group.patch \
> -    file://0004-add-ti-benchmark-test-group.patch \
> -    file://0005-add-ti-benchmark-test-group.patch \
> -    file://0006-add-ti-benchmark-test-group.patch \
> -    file://0007-add-ti-benchmark-test-group.patch \
> -    file://0008-add-ti-benchmark-test-group.patch \
> -    file://0009-add-ti-benchmark-test-group.patch \
> -    file://0010-add-ti-benchmark-test-group.patch \
> -    file://0011-add-ti-benchmark-test-group.patch \
>   "
> +
>   PR = "r0"
> -PV  = "19.05"
> +PV  = "19.08"
>   PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>   
> -BRANCH = "branches/arm_compute_19_05"
> -SRCREV = "bd17a169153ee181100f3b31984968b66618ef3c"
> -
> +BRANCH = "branches/arm_compute_19_08"
> +SRCREV = "35c3eb011d8e2813d83c6a6cbe28a446534e4a14"
>   
>   S = "${WORKDIR}/git"
>   

