Return-Path: <yuanzhao@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BD3875297E
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 21:20:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KLK3hE005435
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 16:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561065603;
	bh=fyPoTbNe2j3X7duxHhWY6ALB/ZykySzclWdf+1vWq58=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=y+F+ykG8xVhp+Ej1ZEt1lZhLzzlB66NfzHk3LCd9FExfREJsIprbaHGGXMldRj6b0
	4kEfNQd4imjfF+avizBh5QLQ4ToHkFpkuX5Zj2cCmH/57oUrq78XIcAu/paTMsnEuW
	b1+kIK+/T5aCwMfn+oBWJDV5JqAbIocwzo3W/s20=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KLK32L045933
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 16:20:03 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 16:20:03 -0500
Received: from DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0]) by
	DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0%18]) with mapi id
	15.01.1713.004; Thu, 20 Jun 2019 16:20:03 -0500
From: "Zhao, Yuan" <yuanzhao@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud/ti2019.01][PATCH] tidl-api: fix g++ 8.3.0
	compilation error
Thread-Index: AQHVJ5Urw4fwdTjAKEqHJwXNcZMbwKalXAIA//+wmJA=
Date: Thu, 20 Jun 2019 21:20:03 +0000
Message-ID: <8ecb7158b3cb4f46875fa0c3357300bf@ti.com>
References: <20190620182230.96572-1-yuanzhao@ti.com>
	<20190620210358.GC4849@beryl>
In-Reply-To: <20190620210358.GC4849@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.51.113]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/ti2019.01][PATCH] tidl-api: fix g++ 8.3.0 compilation error
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
X-List-Received-Date: Thu, 20 Jun 2019 21:20:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Fixed.  Patch v2 submitted.  Thanks!  - Yuan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, June 20, 2019 4:04 PM
To: Zhao, Yuan
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [thud/ti2019.01][PATCH] tidl-api: fix g++ 8.3.0 c=
ompilation error

On Thu, Jun 20, 2019 at 01:22:30PM -0500, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  .../0002-tidl-api_gcc_8.3.0_compilation.patch      | 52 ++++++++++++++++=
++++++
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  3 +-
>  .../recipes-ti/tidl-api/tidl-api_git.bb            |  2 +-
>  3 files changed, 55 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl=
-api_gcc_8.3.0_compilation.patch
>=20
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gc=
c_8.3.0_compilation.patch b/meta-arago-extras/recipes-ti/tidl-api/files/000=
2-tidl-api_gcc_8.3.0_compilation.patch
> new file mode 100644
> index 00000000..6a48203e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/files/0002-tidl-api_gcc_8.3.0=
_compilation.patch
> @@ -0,0 +1,52 @@
> +commit aa7101256aefcea11d326740c111bf37a48b191e (HEAD -> master_patch)
> +Author: Yuan Zhao <yuanzhao@ti.com>
> +Date:   Thu Jun 20 12:01:24 2019 -0500
> +
> +    Fix g++ 8.3.0 compilation error
> +   =20
> +    - Fix a syntax allowed in g++ 7.2.1 but not in 8.3.0
> +    - Make should report error from loop
> +   =20
> +    Upstream-Status: Submitted [Remove this patch when next release is o=
ut]
> +   =20
> +    Signed-off-by: Yuan Zhao <yuanzhao@ti.com>

This doesn't look like a proper git patch, but rather the output of git log=
?
Please use git format-patch command. Thanks.


> +diff --git a/examples/Makefile b/examples/Makefile
> +index 52b3ff6..9217380 100644
> +--- a/examples/Makefile
> ++++ b/examples/Makefile
> +@@ -34,7 +34,7 @@ RUN_DIRS :=3D $(filter-out classification, $(DIRS))
> + define make_in_dirs
> + 	@for dir in $(1); do \
> + 	  echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D " $$dir " =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D" ; \
> +-	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2); \
> ++	  $(MAKE) --no-print-directory $(MAKEFILE) -C $$dir $(2) || exit 1; \
> + 	done
> + endef
> +=20
> +diff --git a/examples/classification/main.cpp b/examples/classification/=
main.cpp
> +index 020004b..25361f8 100644
> +--- a/examples/classification/main.cpp
> ++++ b/examples/classification/main.cpp
> +@@ -699,7 +699,7 @@ int tf_postprocess(uchar *in, int size, int roi_idx,=
 int frame_idx, int f_id)
> +   int rpt_id =3D -1;
> +=20
> +   typedef std::pair<uchar, int> val_index;
> +-  auto constexpr cmp =3D [](val_index &left, val_index &right) { return=
 left.first > right.first; };
> ++  auto cmp =3D [](val_index &left, val_index &right) { return left.firs=
t > right.first; };
> +   std::priority_queue<val_index, std::vector<val_index>, decltype(cmp)>=
 queue(cmp);
> +   // initialize priority queue with smallest value on top
> +   for (int i =3D 0; i < k; i++) {
> +diff --git a/examples/imagenet/main.cpp b/examples/imagenet/main.cpp
> +index 937f467..dc1035b 100644
> +--- a/examples/imagenet/main.cpp
> ++++ b/examples/imagenet/main.cpp
> +@@ -309,7 +309,7 @@ bool WriteFrameOutput(const ExecutionObjectPipeline =
&eop,
> +=20
> +     // sort and get k largest values and corresponding indices
> +     typedef pair<unsigned char, int> val_index;
> +-    auto constexpr cmp =3D [](val_index &left, val_index &right)
> ++    auto cmp =3D [](val_index &left, val_index &right)
> +                          { return left.first > right.first; };
> +     priority_queue<val_index, vector<val_index>, decltype(cmp)> queue(c=
mp);
> +     // initialize priority queue with smallest value on top
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-ar=
ago-extras/recipes-ti/tidl-api/tidl-api.inc
> index 04049e73..d93aec82 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,5 +1,5 @@
>  PV =3D "1.3.0"
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
> =20
>  LIC_FILES_CHKSUM =3D "file://license.txt;md5=3De3daeabffb9fc131a73f16d16=
cbdb118"
> =20
> @@ -12,4 +12,5 @@ SRCREV =3D "785170685ca6a5c11876b05ddf74741c419393be"
> =20
>  # default patchdir is ${S}
>  SRC_URI +=3D "file://0001-tidl-api_l2_cache_size.patch"
> +SRC_URI +=3D "file://0002-tidl-api_gcc_8.3.0_compilation.patch"
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta=
-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index 1deb59e3..48f4db1d 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -8,7 +8,7 @@ require recipes-ti/includes/ti-paths.inc
> =20
>  PR =3D "${INC_PR}.0"
> =20
> -COMPATIBLE_MACHINE =3D "dra7xx-evm|m57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE =3D "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  inherit python3native
> --=20
> 2.14.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

