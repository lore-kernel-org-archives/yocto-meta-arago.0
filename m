Return-Path: <qsu@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C14C0529AC
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 21:36:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4LaknD087547
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:36:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543959406;
	bh=7SIehXWDjGvHu3YndHztgrsF2yRGTCyUGL4RCV3w0Ww=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=wf//GXjoDHqYX6WPdBnn62608VhgwzpLt+W3o25dkREGVi/2Owqkky5hKpOFtPBvx
	NoDzesApfwR8IH6jFULGkvyGjvFU84coxCwWLQEdurfSFFG6h9nG4t2Fnw7IleO0c6
	T0/wzV6zTBVFyYkeJhNFCUTqe9e428CPSf+7N19Y=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4Lakuv079686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:36:46 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 15:36:46 -0600
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
	DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
	15.01.1591.008; Tue, 4 Dec 2018 15:36:46 -0600
From: "Su, Qin" <qsu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v4] arm-compute-library: bump SRCREV and add
	TI benchmark test group.
Thread-Index: AQHUjBlQx6opXuT580GbG1zubkZfLaVvGoZQ
Date: Tue, 4 Dec 2018 21:36:46 +0000
Message-ID: <2715fb6ffa2b40e4a84b4ed2b34583c7@ti.com>
References: <1543959051-13867-1-git-send-email-qsu@ti.com>
	<20181204213544.GA13586@beryl>
In-Reply-To: <20181204213544.GA13586@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.194]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v4] arm-compute-library: bump SRCREV and add TI benchmark test group.
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
X-List-Received-Date: Tue, 04 Dec 2018 21:36:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am really sorry, I saw it, I am doing v5 now.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, December 04, 2018 4:36 PM
To: Su, Qin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH v4] arm-compute-library: bump SRCREV and a=
dd TI benchmark test group.

The recipe itseld is missing.


On Tue, Dec 04, 2018 at 04:30:51PM -0500, Qin Su wrote:
> Updated to the latest version of 18.08.
> Updated LIC_FILES_CHKSUM as Copyright time changed in LICENSE from 2017 t=
o 2017-2018.
> Updated to generate versioned library.
> Added benchmark preset group for squeezenet and inceptionnet.
> Cleaned up install built source package needed by ARMNN.
> Fixed symlinks lost issue in do_install().
>=20
> Signed-off-by: Qin Su <qsu@ti.com>
> ---
> Changes in PACTH v4:
> 1. Fixed the issue -"ERROR:QA Issue: armnn rdepends on arm-compute-librar=
y-dev" in building armnn.

Why/how? Better say - use "cp" instead of "install" to preserve symlinks...


> Changes in PATCH v3:
> 1. Fixed patch files permission issue
> 2. Cleaned up install source package required by armnn
>=20
> Changes in PATCH v2:
> 1. Added Upstream-Status in the commit log in patch files 2. Added=20
> description of license change in commit log 3. Removed unnecessary=20
> modification
> ---
>  .../0001-add-ti-benchmark-test-group.patch         | 61 ++++++++++++++++=
+++
>  .../0002-add-ti-benchmark-test-group.patch         | 71 ++++++++++++++++=
++++++
>  .../0003-add-ti-benchmark-test-group.patch         | 39 ++++++++++++
>  .../0004-add-ti-benchmark-test-group.patch         | 49 +++++++++++++++
>  .../0005-add-ti-benchmark-test-group.patch         | 46 ++++++++++++++
>  .../0006-add-ti-benchmark-test-group.patch         | 44 ++++++++++++++
>  .../0007-add-ti-benchmark-test-group.patch         | 44 ++++++++++++++
>  .../0008-add-ti-benchmark-test-group.patch         | 31 ++++++++++
>  .../0009-add-ti-benchmark-test-group.patch         | 44 ++++++++++++++
>  .../0010-add-ti-benchmark-test-group.patch         | 50 +++++++++++++++
>  .../0011-add-ti-benchmark-test-group.patch         | 37 +++++++++++
>  11 files changed, 516 insertions(+)
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0001-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0002-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0003-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0004-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0005-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0006-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0007-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0008-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0009-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0010-add-ti-benchmark-test-group.patch
>  create mode 100644=20
> meta-arago-extras/recipes-support/arm-compute-library/arm-compute-libr
> ary/0011-add-ti-benchmark-test-group.patch
>=20
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0001-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0001-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..f00561e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0001-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,61 @@
> +From 497a8abf760dbd9be715dfe6abf81c670fc85912 Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:16:33 -0500
> +Subject: [PATCH 01/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + .../squeezenet/SqueezeNetActivationLayerDataset.h  | 35=20
> +++++++++++++++++++++++
> + 1 file changed, 35 insertions(+)
> +
> +diff --git=20
> +a/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDat
> +aset.h=20
> +b/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDat
> +aset.h
> +index 7f4bf4d..a66f473 100644
> +---=20
> +a/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLayerDat
> +aset.h
> ++++ b/tests/datasets/system_tests/squeezenet/SqueezeNetActivationLaye
> ++++ rDataset.h
> +@@ -71,6 +71,41 @@ public:
> +     SqueezeNetActivationLayerDataset(SqueezeNetActivationLayerDataset &=
&) =3D default;
> +     ~SqueezeNetActivationLayerDataset()                                =
   =3D default;
> + };
> ++class TISqueezeNetActivationLayerDataset final : public
> ++   =20
> ++framework::dataset::CartesianProductDataset<framework::dataset::Init
> ++ializerListDataset<TensorShape>,=20
> ++framework::dataset::SingletonDataset<ActivationLayerInfo>>
> ++{
> ++public:
> ++    TISqueezeNetActivationLayerDataset()
> ++        : CartesianProductDataset
> ++    {
> ++        framework::dataset::make("Shape", { // relu_conv1
> ++            TensorShape(114U, 114U, 64U),
> ++            // fire2/relu_squeeze1x1, fire3/relu_squeeze1x1
> ++            TensorShape(57U, 57U, 16U),
> ++            // fire2/relu_expand1x1, fire2/relu_expand3x3, fire3/relu_e=
xpand1x1, fire3/relu_expand3x3
> ++            TensorShape(57U, 57U, 64U),
> ++            // fire4/relu_squeeze1x1, fire5/relu_squeeze1x1
> ++            TensorShape(28U, 28U, 32U),
> ++            // fire4/relu_expand1x1, fire4/relu_expand3x3, fire5/relu_e=
xpand1x1, fire5/relu_expand3x3
> ++            TensorShape(28U, 28U, 128U),
> ++            // fire6/relu_squeeze1x1, fire7/relu_squeeze1x1
> ++            TensorShape(14U, 14U, 48U),
> ++            // fire6/relu_expand1x1, fire6/relu_expand3x3, fire7/relu_e=
xpand1x1, fire7/relu_expand3x3
> ++            TensorShape(14U, 14U, 192U),
> ++            // fire8/relu_squeeze1x1, fire9/relu_squeeze1x1
> ++            TensorShape(14U, 14U, 64U),
> ++            // fire8/relu_expand1x1, fire8/relu_expand3x3, fire9/relu_e=
xpand1x1, fire9/relu_expand3x3
> ++            TensorShape(14U, 14U, 256U),
> ++            // relu_conv10
> ++            TensorShape(14U, 14U, 1000U) }),
> ++        framework::dataset::make("Info", ActivationLayerInfo(Activation=
LayerInfo::ActivationFunction::RELU))
> ++    }
> ++    {
> ++    }
> ++    TISqueezeNetActivationLayerDataset(TISqueezeNetActivationLayerDatas=
et &&) =3D default;
> ++    ~TISqueezeNetActivationLayerDataset()                              =
     =3D default;
> ++};
> ++
> + } // namespace datasets
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0002-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0002-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..f891f74
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0002-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,71 @@
> +From 39ebc12e4de88a7839e33755c65cb9b9f0e8535f Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:17:19 -0500
> +Subject: [PATCH 02/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + .../squeezenet/SqueezeNetConvolutionLayerDataset.h | 45=20
> +++++++++++++++++++++++
> + 1 file changed, 45 insertions(+)
> +
> +diff --git=20
> +a/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDa
> +taset.h=20
> +b/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDa
> +taset.h
> +index f98d90a..cba37eb 100644
> +---=20
> +a/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLayerDa
> +taset.h
> ++++ b/tests/datasets/system_tests/squeezenet/SqueezeNetConvolutionLay
> ++++ erDataset.h
> +@@ -96,6 +96,51 @@ public:
> +         add_config(TensorShape(13U, 13U, 512U), TensorShape(1U, 1U, 512=
U, 1000U), TensorShape(1000U), TensorShape(13U, 13U, 1000U), PadStrideInfo(=
1, 1, 0, 0));
> +     }
> + };
> ++
> ++class TISqueezeNetConvolutionLayerDataset final : public=20
> ++ConvolutionLayerDataset {
> ++public:
> ++    TISqueezeNetConvolutionLayerDataset()
> ++    {
> ++        // conv1
> ++        add_config(TensorShape(227U, 227U, 3U), TensorShape(3U, 3U, 3U,=
 64U), TensorShape(64U), TensorShape(114U, 114U, 64U), PadStrideInfo(2, 2, =
0, 0));
> ++        // fire2/squeeze1x1
> ++        add_config(TensorShape(57U, 57U, 64U), TensorShape(1U, 1U, 64U,=
 16U), TensorShape(16U), TensorShape(57U, 57U, 16U), PadStrideInfo(1, 1, 0,=
 0));
> ++        // fire2/expand1x1, fire3/expand1x1
> ++        add_config(TensorShape(57U, 57U, 16U), TensorShape(1U, 1U, 16U,=
 64U), TensorShape(64U), TensorShape(57U, 57U, 64U), PadStrideInfo(1, 1, 0,=
 0));
> ++        // fire2/expand3x3, fire3/expand3x3
> ++        add_config(TensorShape(57U, 57U, 16U), TensorShape(3U, 3U, 16U,=
 64U), TensorShape(64U), TensorShape(57U, 57U, 64U), PadStrideInfo(1, 1, 1,=
 1));
> ++        // fire3/squeeze1x1
> ++        add_config(TensorShape(57U, 57U, 128U), TensorShape(1U, 1U, 128=
U, 16U), TensorShape(16U), TensorShape(57U, 57U, 16U), PadStrideInfo(1, 1, =
0, 0));
> ++        // fire4/squeeze1x1
> ++        add_config(TensorShape(28U, 28U, 128U), TensorShape(1U, 1U, 128=
U, 32U), TensorShape(32U), TensorShape(28U, 28U, 32U), PadStrideInfo(1, 1, =
0, 0));
> ++        // fire4/expand1x1, fire5/expand1x1
> ++        add_config(TensorShape(28U, 28U, 32U), TensorShape(1U, 1U, 32U,=
 128U), TensorShape(128U), TensorShape(28U, 28U, 128U), PadStrideInfo(1, 1,=
 0, 0));
> ++        // fire4/expand3x3, fire5/expand3x3
> ++        add_config(TensorShape(28U, 28U, 32U), TensorShape(3U, 3U, 32U,=
 128U), TensorShape(128U), TensorShape(28U, 28U, 128U), PadStrideInfo(1, 1,=
 1, 1));
> ++        // fire5/squeeze1x1
> ++        add_config(TensorShape(28U, 28U, 256U), TensorShape(1U, 1U, 256=
U, 32U), TensorShape(32U), TensorShape(28U, 28U, 32U), PadStrideInfo(1, 1, =
0, 0));
> ++        // fire6/squeeze1x1
> ++        add_config(TensorShape(14U, 14U, 256U), TensorShape(1U, 1U, 256=
U, 48U), TensorShape(48U), TensorShape(14U, 14U, 48U), PadStrideInfo(1, 1, =
0, 0));
> ++        // fire6/expand1x1, fire7/expand1x1
> ++        add_config(TensorShape(14U, 14U, 48U), TensorShape(1U, 1U, 48U,=
 192U), TensorShape(192U), TensorShape(14U, 14U, 192U), PadStrideInfo(1, 1,=
 0, 0));
> ++        // fire6/expand3x3, fire7/expand3x3
> ++        add_config(TensorShape(14U, 14U, 48U), TensorShape(3U, 3U, 48U,=
 192U), TensorShape(192U), TensorShape(14U, 14U, 192U), PadStrideInfo(1, 1,=
 1, 1));
> ++        // fire7/squeeze1x1
> ++        add_config(TensorShape(14U, 14U, 384U), TensorShape(1U, 1U, 384=
U, 48U), TensorShape(48U), TensorShape(14U, 14U, 48U), PadStrideInfo(1, 1, =
0, 0));
> ++        // fire8/squeeze1x1
> ++        add_config(TensorShape(14U, 14U, 384U), TensorShape(1U, 1U, 384=
U, 64U), TensorShape(64U), TensorShape(14U, 14U, 64U), PadStrideInfo(1, 1, =
0, 0));
> ++        // fire8/expand1x1, fire9/expand1x1
> ++        add_config(TensorShape(14U, 14U, 64U), TensorShape(1U, 1U, 64U,=
 256U), TensorShape(256U), TensorShape(14U, 14U, 256U), PadStrideInfo(1, 1,=
 0, 0));
> ++        // fire8/expand3x3, fire9/expand3x3
> ++        add_config(TensorShape(14U, 14U, 64U), TensorShape(3U, 3U, 64U,=
 256U), TensorShape(256U), TensorShape(14U, 14U, 256U), PadStrideInfo(1, 1,=
 1, 1));
> ++        // fire9/squeeze1x1
> ++        add_config(TensorShape(14U, 14U, 512U), TensorShape(1U, 1U, 512=
U, 64U), TensorShape(64U), TensorShape(14U, 14U, 64U), PadStrideInfo(1, 1, =
0, 0));
> ++        // conv10
> ++        add_config(TensorShape(14U, 14U, 512U), TensorShape(1U, 1U, 512=
U, 1000U), TensorShape(1000U), TensorShape(14U, 14U, 1000U), PadStrideInfo(=
1, 1, 0, 0));
> ++    }
> ++};
> ++
> + } // namespace datasets
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0003-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0003-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..4a80548
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0003-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,39 @@
> +From 8c433526117e4aa5480efdbe5718ee54e9de2ff5 Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:17:43 -0500
> +Subject: [PATCH 03/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + .../system_tests/squeezenet/SqueezeNetPoolingLayerDataset.h | 13=20
> ++++++++++++++
> + 1 file changed, 13 insertions(+)
> +
> +diff --git=20
> +a/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDatase
> +t.h=20
> +b/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDatase
> +t.h
> +index 9518ce5..a168d29 100644
> +---=20
> +a/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDatase
> +t.h
> ++++ b/tests/datasets/system_tests/squeezenet/SqueezeNetPoolingLayerDa
> ++++ taset.h
> +@@ -50,6 +50,19 @@ public:
> +         add_config(TensorShape(27U, 27U, 256U), PoolingLayerInfo(Poolin=
gType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
> +     }
> + };
> ++class TISqueezeNetPoolingLayerDataset final : public=20
> ++PoolingLayerDataset {
> ++public:
> ++    TISqueezeNetPoolingLayerDataset()
> ++    {
> ++        // pool1
> ++        add_config(TensorShape(114U, 114U, 64U), PoolingLayerInfo(Pooli=
ngType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
> ++        // pool3
> ++        add_config(TensorShape(57U, 57U, 128U), PoolingLayerInfo(Poolin=
gType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
> ++        // pool5
> ++        add_config(TensorShape(28U, 28U, 256U), PoolingLayerInfo(Poolin=
gType::MAX, 3, PadStrideInfo(2, 2, 0, 0, DimensionRoundingType::CEIL)));
> ++    }
> ++};
> + } // namespace datasets
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0004-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0004-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..9693e6c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0004-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,49 @@
> +From c2e6412d2aa9137b4b1b75d091ba9c8a53ede99b Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:18:05 -0500
> +Subject: [PATCH 04/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + tests/benchmark/NEON/ActivationLayer.cpp | 13 +++++++++++++
> + 1 file changed, 13 insertions(+)
> +
> +diff --git a/tests/benchmark/NEON/ActivationLayer.cpp=20
> +b/tests/benchmark/NEON/ActivationLayer.cpp
> +index 1c4ea21..7b47c11 100644
> +--- a/tests/benchmark/NEON/ActivationLayer.cpp
> ++++ b/tests/benchmark/NEON/ActivationLayer.cpp
> +@@ -51,9 +51,11 @@ namespace
> + #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> + const auto data_types           =3D framework::dataset::make("DataType"=
, { DataType::F16, DataType::F32 });
> + const auto data_types_mobilenet =3D=20
> +framework::dataset::make("DataType", { DataType::F16, DataType::F32,=20
> +DataType::QASYMM8 });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */
> + const auto data_types           =3D framework::dataset::make("DataType"=
, { DataType::F32 });
> + const auto data_types_mobilenet =3D=20
> + framework::dataset::make("DataType", { DataType::F32,=20
> + DataType::QASYMM8 });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */ } // namespace
> +=20
> +@@ -127,6 +129,17 @@ REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2ActivationLay=
er, NEActivationLayerFixture,
> +                                                            =20
> +framework::dataset::make("Batches", { 4, 8 })));
> + TEST_SUITE_END()
> + TEST_SUITE_END()
> ++TEST_SUITE(TIBENCHMARK_SQUEEZENET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetActivationLayer, NEActivati=
onLayerFixture, framework::DatasetMode::ALL,
> ++                                framework::dataset::combine(framework::=
dataset::combine(datasets::TISqueezeNetActivationLayerDataset(), data_types=
_tibenchmark),
> ++                                                           =20
> ++framework::dataset::make("Batches", 1)));
> ++TEST_SUITE_END()
> ++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1ActivationLayer, NE=
ActivationLayerFixture, framework::DatasetMode::ALL,
> ++                                framework::dataset::combine(framework::=
dataset::combine(datasets::GoogLeNetInceptionV1ActivationLayerDataset(), da=
ta_types_tibenchmark),
> ++                                                           =20
> ++framework::dataset::make("Batches", 1)));
> ++TEST_SUITE_END()
> ++
> + } // namespace benchmark
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0005-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0005-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..f498ffa
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0005-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,46 @@
> +From 14ba479fe707af2575fac4d2780e31a10264d295 Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:18:32 -0500
> +Subject: [PATCH 05/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + tests/benchmark/NEON/ConvolutionLayer.cpp | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/benchmark/NEON/ConvolutionLayer.cpp=20
> +b/tests/benchmark/NEON/ConvolutionLayer.cpp
> +index ac27e7a..6cfb00d 100644
> +--- a/tests/benchmark/NEON/ConvolutionLayer.cpp
> ++++ b/tests/benchmark/NEON/ConvolutionLayer.cpp
> +@@ -52,9 +52,10 @@ namespace
> + {
> + #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> + const auto data_types =3D framework::dataset::make("DataType", {=20
> +DataType::F16, DataType::F32, DataType::QASYMM8 });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #else /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */  const auto=20
> +data_types =3D framework::dataset::make("DataType", { DataType::F32,=20
> +DataType::QASYMM8 });
> +-
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */ } // namespace
> +=20
> +@@ -197,6 +198,14 @@=20
> +REGISTER_FIXTURE_DATA_TEST_CASE(SqueezeNetWinogradLayer,=20
> +NEWinogradConvolutionLa
> +=20
> + TEST_SUITE_END()
> + TEST_SUITE_END()
> ++
> ++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1ConvolutionLayer, N=
EGEMMConvolutionLayerFixture, framework::DatasetMode::ALL,
> ++                                framework::dataset::combine(framework::=
dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1=
ConvolutionLayerDataset(),
> ++                                                                       =
                                             framework::dataset::make("Acti=
vationInfo", ActivationLayerInfo(ActivationLayerInfo::ActivationFunction::R=
ELU))),
> ++                                                                       =
                 data_types_tibenchmark),
> ++                                                           =20
> ++framework::dataset::make("Batches", 1)));
> ++TEST_SUITE_END()
> + } // namespace benchmark
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0006-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0006-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..3dfc2e7
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0006-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,44 @@
> +From c0c2b79824a52dee291b275a0f0a66746a99dbf5 Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:18:50 -0500
> +Subject: [PATCH 06/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + tests/benchmark/NEON/DirectConvolutionLayer.cpp | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/tests/benchmark/NEON/DirectConvolutionLayer.cpp=20
> +b/tests/benchmark/NEON/DirectConvolutionLayer.cpp
> +index f94ef6b..afdcbad 100644
> +--- a/tests/benchmark/NEON/DirectConvolutionLayer.cpp
> ++++ b/tests/benchmark/NEON/DirectConvolutionLayer.cpp
> +@@ -50,8 +50,10 @@ namespace
> + // Special data types for networks that need 5x5 direct convolution =20
> +#ifdef ARM_COMPUTE_ENABLE_F16  const auto data_types =3D=20
> +framework::dataset::make("DataType", { DataType::F16, DataType::F32=20
> +});
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #else  /* ARM_COMPUTE_ENABLE_F16 */
> + const auto data_types =3D framework::dataset::make("DataType", {=20
> + DataType::F32 });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #endif /* ARM_COMPUTE_ENABLE_F16 */
> + } // namespace
> +=20
> +@@ -122,6 +124,13 @@=20
> +REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2DirectConvolutionLayer,=20
> +NEDirectConvolutio
> +=20
> + TEST_SUITE_END()
> + TEST_SUITE_END()
> ++TEST_SUITE(TIBENCHMARK_SQUEEZENET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetDirectConvolutionLayer, NED=
irectConvolutionLayerFixture, framework::DatasetMode::ALL,
> ++                                framework::dataset::combine(framework::=
dataset::combine(framework::dataset::combine(datasets::TISqueezeNetConvolut=
ionLayerDataset(),
> ++                                                                       =
                                             framework::dataset::make("Acti=
vationInfo", ActivationLayerInfo(ActivationLayerInfo::ActivationFunction::R=
ELU))),
> ++                                                                       =
                 data_types_tibenchmark),
> ++                                                           =20
> ++framework::dataset::make("Batches", 1)));
> ++TEST_SUITE_END()
> + } // namespace benchmark
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0007-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0007-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..a1ed073
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0007-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,44 @@
> +From e8c375920cd21e6e151aabaa88b68358296bbe87 Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:19:10 -0500
> +Subject: [PATCH 07/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + tests/benchmark/NEON/FullyConnectedLayer.cpp | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/tests/benchmark/NEON/FullyConnectedLayer.cpp=20
> +b/tests/benchmark/NEON/FullyConnectedLayer.cpp
> +index d0fb04f..9ee852d 100644
> +--- a/tests/benchmark/NEON/FullyConnectedLayer.cpp
> ++++ b/tests/benchmark/NEON/FullyConnectedLayer.cpp
> +@@ -47,8 +47,10 @@ namespace
> + {
> + #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> + const auto data_types =3D framework::dataset::make("DataType", {=20
> +DataType::F16, DataType::F32 });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */ const auto=20
> + data_types =3D framework::dataset::make("DataType", { DataType::F32=20
> + });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */ } // namespace
> +=20
> +@@ -108,6 +110,13 @@ REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV=
4FullyConnectedLayer, NEFully
> +                                                            =20
> +framework::dataset::make("Batches", { 4, 8 })));
> + TEST_SUITE_END()
> + TEST_SUITE_END()
> ++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1FullyConnectedLayer=
, NEFullyConnectedLayerFixture, framework::DatasetMode::ALL,
> ++                                framework::dataset::combine(framework::=
dataset::combine(datasets::GoogLeNetInceptionV1FullyConnectedLayerDataset()=
,
> ++                                                                       =
                 data_types_tibenchmark),
> ++                                                           =20
> ++framework::dataset::make("Batches", 1)));
> ++TEST_SUITE_END()
> ++
> + } // namespace benchmark
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0008-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0008-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..dcf0989
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0008-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,31 @@
> +From d657c798ec32c6a0f08384f725f3b8601d035300 Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:19:26 -0500
> +Subject: [PATCH 08/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + tests/benchmark/NEON/GEMMLowp.cpp | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/tests/benchmark/NEON/GEMMLowp.cpp=20
> +b/tests/benchmark/NEON/GEMMLowp.cpp
> +index 4b13f31..c2c6bdf 100644
> +--- a/tests/benchmark/NEON/GEMMLowp.cpp
> ++++ b/tests/benchmark/NEON/GEMMLowp.cpp
> +@@ -50,6 +50,11 @@=20
> +REGISTER_FIXTURE_DATA_TEST_CASE(MatrixMultiplyGEMMLowp,=20
> +NEGEMMLowpFixture, frame =20
> +REGISTER_FIXTURE_DATA_TEST_CASE(GoogleNetGEMMLowp, NEGEMMLowpFixture,=20
> +framework::DatasetMode::NIGHTLY, datasets::GoogleNetGEMMDataset());
> +=20
> + TEST_SUITE_END()
> ++
> ++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1GEMMLowp,=20
> ++NEGEMMLowpFixture, framework::DatasetMode::ALL,=20
> ++datasets::GoogLeNetInceptionV1GEMMDataset());
> ++TEST_SUITE_END()
> ++
> + } // namespace benchmark
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0009-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0009-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..8498e27
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0009-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,44 @@
> +From 5e6db070b3cc563095991eaaab5d4c1fe8f12fcf Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:19:42 -0500
> +Subject: [PATCH 09/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + tests/benchmark/NEON/NormalizationLayer.cpp | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/tests/benchmark/NEON/NormalizationLayer.cpp=20
> +b/tests/benchmark/NEON/NormalizationLayer.cpp
> +index 0c9a864..3654ef5 100644
> +--- a/tests/benchmark/NEON/NormalizationLayer.cpp
> ++++ b/tests/benchmark/NEON/NormalizationLayer.cpp
> +@@ -44,8 +44,10 @@ namespace
> + {
> + #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> + const auto data_types =3D framework::dataset::make("DataType", {=20
> +DataType::F16, DataType::F32 });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */ const auto=20
> + data_types =3D framework::dataset::make("DataType", { DataType::F32=20
> + });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */  } // namespace =20
> +using NENormalizationLayerFixture =3D NormalizationLayerFixture<Tensor,=
=20
> +NENormalizationLayer, Accessor>; @@ -74,6 +76,13 @@ REGISTER_FIXTURE_DAT=
A_TEST_CASE(GoogLeNetInceptionV1NormalizationLayer, NENormal
> +                                                            =20
> +framework::dataset::make("Batches", { 4, 8 })));
> + TEST_SUITE_END()
> + TEST_SUITE_END()
> ++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1NormalizationLayer,=
 NENormalizationLayerFixture, framework::DatasetMode::ALL,
> ++                                framework::dataset::combine(framework::=
dataset::combine(datasets::GoogLeNetInceptionV1NormalizationLayerDataset(),
> ++                                                                       =
                 data_types_tibenchmark),
> ++                                                           =20
> ++framework::dataset::make("Batches", 1)));
> ++TEST_SUITE_END()
> ++
> + } // namespace benchmark
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0010-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0010-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..4c562e7
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0010-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,50 @@
> +From 76a4ca1417987c6542dd76b625d001ae8f30657e Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:19:58 -0500
> +Subject: [PATCH 10/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + tests/benchmark/NEON/PoolingLayer.cpp | 13 +++++++++++++
> + 1 file changed, 13 insertions(+)
> +
> +diff --git a/tests/benchmark/NEON/PoolingLayer.cpp=20
> +b/tests/benchmark/NEON/PoolingLayer.cpp
> +index 8b7ee84..de93006 100644
> +--- a/tests/benchmark/NEON/PoolingLayer.cpp
> ++++ b/tests/benchmark/NEON/PoolingLayer.cpp
> +@@ -48,10 +48,13 @@ namespace benchmark  namespace  {  const auto=20
> +data_layouts =3D framework::dataset::make("DataLayout", {=20
> +DataLayout::NCHW, DataLayout::NHWC });
> ++const auto data_layouts_tibenchmark =3D=20
> ++framework::dataset::make("DataLayout", { DataLayout::NCHW});
> + #ifdef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
> + const auto data_types =3D framework::dataset::make("DataType", {=20
> + DataType::F16, DataType::F32, DataType::QASYMM8 });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #else  /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */ const auto=20
> + data_types =3D framework::dataset::make("DataType", { DataType::F32,=20
> + DataType::QASYMM8 });
> ++const auto data_types_tibenchmark =3D=20
> ++framework::dataset::make("DataType", { DataType::F32 });
> + #endif /* __ARM_FEATURE_FP16_VECTOR_ARITHMETIC */ } // namespace
> +=20
> +@@ -107,6 +110,16 @@ REGISTER_FIXTURE_DATA_TEST_CASE(YOLOV2PoolingLayer,=
 NEPoolingLayerFixture, frame
> +                                =20
> +framework::dataset::combine(framework::dataset::combine(framework::da
> +taset::combine(datasets::YOLOV2PoolingLayerDataset(), data_types),=20
> +data_layouts), framework::dataset::make("Batches", { 4, 8 })));
> + TEST_SUITE_END()
> + TEST_SUITE_END()
> ++
> ++TEST_SUITE(TIBENCHMARK_SQUEEZENET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(TISqueezeNetPoolingLayer, NEPoolingLaye=
rFixture, framework::DatasetMode::ALL,
> ++                               =20
> ++framework::dataset::combine(framework::dataset::combine(framework::d
> ++ataset::combine(datasets::TISqueezeNetPoolingLayerDataset(),=20
> ++data_types_tibenchmark), data_layouts_tibenchmark),=20
> ++framework::dataset::make("Batches", 1)));
> ++TEST_SUITE_END()
> ++TEST_SUITE(TIBENCHMARK_INCEPTIONNET)
> ++REGISTER_FIXTURE_DATA_TEST_CASE(GoogLeNetInceptionV1PoolingLayer, NEPoo=
lingLayerFixture, framework::DatasetMode::ALL,
> ++                                framework::dataset::combine(framework::=
dataset::combine(framework::dataset::combine(datasets::GoogLeNetInceptionV1=
PoolingLayerDataset(), data_types_tibenchmark), data_layouts_tibenchmark), =
framework::dataset::make("Batches",
> ++                                                            1)));
> ++TEST_SUITE_END()
> + } // namespace benchmark
> + } // namespace test
> + } // namespace arm_compute
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0011-add-ti-benchmark-test-group.patch=20
> b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-li
> brary/0011-add-ti-benchmark-test-group.patch
> new file mode 100644
> index 0000000..fd3a9d1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-comput
> +++ e-library/0011-add-ti-benchmark-test-group.patch
> @@ -0,0 +1,37 @@
> +From 012d21f475e1a004c2a7f688835a1b5416c3b8b6 Mon Sep 17 00:00:00=20
> +2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 27 Nov 2018 17:20:10 -0500
> +Subject: [PATCH 11/11] add TI benchmark test group
> +
> +Upstream-Status: Inappropriate [TI only test code]
> +
> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + tests/framework/printers/PrettyPrinter.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/framework/printers/PrettyPrinter.cpp=20
> +b/tests/framework/printers/PrettyPrinter.cpp
> +index 3181951..2222286 100644
> +--- a/tests/framework/printers/PrettyPrinter.cpp
> ++++ b/tests/framework/printers/PrettyPrinter.cpp
> +@@ -83,7 +83,7 @@ void PrettyPrinter::print_run_footer()
> +=20
> + void PrettyPrinter::print_test_header(const TestInfo &info)  {
> +-    *_stream << begin_color("2") << "Running [" << info.id << "] '" << =
info.name << "'" << end_color() << "\n";
> ++    *_stream << begin_color("2") << "Running [" << info.id << "] '" << =
info.name << "'" << end_color() << "	";
> + }
> +=20
> + void PrettyPrinter::print_test_footer()
> +@@ -125,7 +125,7 @@ void PrettyPrinter::print_measurements(const Profile=
r::MeasurementsMap &measurem
> +         InstrumentsStats stats(instrument.second);
> +=20
> +         *_stream << "    ";
> +-        *_stream << "AVG=3D" << stats.mean() << " " << stats.max().unit=
();
> ++        *_stream << "AVG=3D	" << stats.mean() << "	" << stats.max().uni=
t();
> +         if(instrument.second.size() > 1)
> +         {
> +             *_stream << ", STDDEV=3D" <<=20
> +arithmetic_to_string(stats.relative_standard_deviation(), 2) << " %";
> +--
> +1.9.1
> +
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

