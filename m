Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 853635299F
	for <meta-arago@arago-project.org>;
	Fri,  8 Mar 2019 21:59:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28LxSqr016216
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 15:59:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552082368;
	bh=XC/FV1SLYUI9sCdgDj3WjIWe5JRmU5+Hq8yNLL9ux6c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=omsPjxRet9XRFWbg4V6UggbZsPjBBB1biBM1q4n3qpnX13c5zGDwDRlVH247Gy73K
	BWuow1ts3kokBfsPnpYEpaPsqRY6NKAOz7PM4rpLqIxrXWCtcPBP2n0qBVzsxCmitw
	Z1Vjy+19D7TMWInYILucJD5hUZ0YcgbZr8zDX+10=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28LxShr100369
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 15:59:28 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 15:59:27 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1591.008; Fri, 8 Mar 2019 15:59:28 -0600
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago]  [PATCH v3] tidl-utils: add new features; change
	license checksum
Thread-Index: AQHU1fMCh4Q6C24liUijj1AYmoCIKKYCR6+w
Date: Fri, 8 Mar 2019 21:59:28 +0000
Message-ID: <d31c2898118b427e90894731cb4c69a0@ti.com>
References: <1552051785-31309-1-git-send-email-xuj@ti.com>
	<20190308210758.GC26510@beryl>
In-Reply-To: <20190308210758.GC26510@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.116.215]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v3] tidl-utils: add new features; change license checksum
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
X-List-Received-Date: Fri, 08 Mar 2019 21:59:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

How about this commit message:

    tidl-utils: 1. update to add new features to TIDL import tool
                        - ONNX
                        - Tensorflow 1.7 and above
                        - linking with OpenCV for ARM build
                2. change license checksum by only calculating license head=
er in itidl_ti.h
                    since this file has changed and will likely change in f=
uture.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, March 08, 2019 4:08 PM
To: Xu, Jianzhong
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH v3] tidl-utils: add new features; change l=
icense checksum

The gold rule of every commit message is to answer the "Why?" question, not=
=20
"What?". The code change in the patch itself covers "What?", the commit=20
message should explain "Why?" - why those changes are being made?

Let's see:
> add new features;

Update to add new features, fine.


> change license checksum

Yeah, the license checksum is being changed, but why?

We've just gone through the same excercise with Mahesh, just on meta-ti lis=
t:
https://lists.yoctoproject.org/pipermail/meta-ti/2019-March/thread.html


On Fri, Mar 08, 2019 at 08:29:45AM -0500, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
> Change from previous version of patch: commit message modification
> ---
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb | 8 ++++----
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb      | 2 +-
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc     | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b=
/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> index 1291f9d..bef2d1a 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> @@ -5,10 +5,10 @@ DESCRIPTION =3D "TIDL import tool is using protobuf to =
read and parse information
>  require ./tidl-utils.inc
> =20
>  LICENSE =3D "BSD-3"
> -LIC_FILES_CHKSUM =3D "file://modules/ti_dl/inc/itidl_ti.h;md5=3D7baa68fe=
c0aadbac92c3b41b283d26c4"
> +LIC_FILES_CHKSUM =3D "file://modules/ti_dl/inc/itidl_ti.h;beginline=3D1;=
endline=3D34;md5=3Dcabe1fdaabfa0d85dc5544566b0e2425"
> =20
> -PV =3D "01.00.00.00"
> -PR =3D "r1"
> +PV =3D "01.01.00.00"
> +PR =3D "r0"
> =20
>  S =3D "${WORKDIR}/git/src/importTool/"
> =20
> @@ -21,7 +21,7 @@ EXTRA_OEMAKE +=3D "CORE=3Deve"
>  EXTRA_OEMAKE +=3D "TARGET_BUILD=3Drelease"
>  EXTRA_OEMAKE +=3D "TARGET_PLATFORM=3DPC"
> =20
> -EXTRA_MAKE_ARGS =3D "PLATFORM_BUILD=3Dx86 LINUX_IMPORT_TOOL=3D64BIT PROT=
OBUF_LIB_DIR=3D${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=3D${STAGING_D=
IR_NATIVE}/usr/include"
> +EXTRA_MAKE_ARGS =3D "PLATFORM_BUILD=3Dx86 LINUXENV=3Dx86 LINUX_IMPORT_TO=
OL=3D64BIT PROTOBUF_LIB_DIR=3D${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DI=
R=3D${STAGING_DIR_NATIVE}/usr/include"
>  EXTRA_MAKE_ARGS_class-target =3D "LINUX_BUILD_TOOLS=3D${TOOLCHAIN_PATH}/=
bin/${TARGET_PREFIX} PROTOBUF_LIB_DIR=3D${STAGING_LIBDIR} PROTOBUF_INC_DIR=
=3D${STAGING_INCDIR} LINUXENV=3Doearm"
> =20
>  EXTRA_OEMAKE +=3D "${EXTRA_MAKE_ARGS}"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta=
-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> index e065e17..69b6e29 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "TI-TFL"
> =20
>  require ./tidl-utils.inc
> =20
> -PV =3D "1.0.0.1"
> +PV =3D "1.0.1.0"
>  INC_PR =3D "r0"
> =20
>  LIC_FILES_CHKSUM =3D "file://docs/LICENSE.txt;md5=3Da93aa5af7a3bbbb6fb34=
c8df59efaa5c"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/met=
a-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> index 37ce84d..9ccabdd 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -1,2 +1,2 @@
>  SRC_URI =3D "git://git.ti.com/tidl/tidl-utils.git;protocol=3Dgit;branch=
=3Dmaster"
> -SRCREV =3D "0021b6f15ee4a1a8919905429a5045fd02afe5b1"
> +SRCREV =3D "057984b05e143a4740ecec3dd28cfa082927b897"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

