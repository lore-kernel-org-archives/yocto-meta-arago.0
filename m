Return-Path: <yuanzhao@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0C15852985
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 01:29:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5P1SJt1061236
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 20:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561426099;
	bh=R/JTAlpqlpPmQ4P7aSzbsAA3aan7PzVqz53mbeiVzEk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=s+LWktQ4ohPQUdYvw3EtYHFixFOFkfUaVeLpGi3tD5O30+Unsm8bjYXzbUxD7UX3S
	2IFdRxePjCb+JVKZF3t1Gtl3wlgtouhE69WwHr2CsMLMsyNjBlubLC4ht+SQYmNQdL
	YLv25MkfWjeeO4eiguR9BT+MTCVUkFFH3nvWcL44=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5P1SJaB072139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 20:28:19 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 20:28:19 -0500
Received: from DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0]) by
	DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0%18]) with mapi id
	15.01.1713.004; Mon, 24 Jun 2019 20:28:19 -0500
From: "Zhao, Yuan" <yuanzhao@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud/ti2019.01][PATCH] ocl: fix g++8.3
	opencl-examples undefined behavior
Thread-Index: AQHVKsAzWL3TFs0sQ0mBhn5/qHbgBqarnKEA///37IA=
Date: Tue, 25 Jun 2019 01:28:19 +0000
Message-ID: <9f580ae7696c4805a5f3efab39642221@ti.com>
References: <20190624190734.44740-1-yuanzhao@ti.com>
	<20190624205530.GU4849@beryl>
In-Reply-To: <20190624205530.GU4849@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.82.129]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/ti2019.01][PATCH] ocl: fix g++8.3 opencl-examples undefined behavior
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
X-List-Received-Date: Tue, 25 Jun 2019 01:29:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Okay, I am changing to relative patchdir.  Patch v2 coming up.  Thanks!  - =
Yuan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, June 24, 2019 3:56 PM
To: Zhao, Yuan
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [thud/ti2019.01][PATCH] ocl: fix g++8.3 opencl-ex=
amples undefined behavior

On Mon, Jun 24, 2019 at 02:07:34PM -0500, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  ...g-8.3.0-OpenCL-example-undefined-behavior.patch | 68 ++++++++++++++++=
++++++
>  .../recipes-ti/ocl/opencl-examples_git.bb          |  6 +-
>  2 files changed, 72 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3=
.0-OpenCL-example-undefined-behavior.patch
>=20
> diff --git a/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-Open=
CL-example-undefined-behavior.patch b/meta-arago-extras/recipes-ti/ocl/file=
s/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch
> new file mode 100644
> index 00000000..b2c40c84
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-exam=
ple-undefined-behavior.patch
> @@ -0,0 +1,68 @@
> +From 7cf77b704544b6012105f7ed19807b798b6cb242 Mon Sep 17 00:00:00 2001
> +From: Yuan Zhao <yuanzhao@ti.com>
> +Date: Mon, 24 Jun 2019 13:24:11 -0500
> +Subject: [PATCH] Fix g++ 8.3.0 OpenCL example undefined behavior
> +
> +- Fix undefined behavior of non-void functions with no return statements=
,
> +  when using g++ 8.3.0.  Change them to void functions.
> +
> +Upstream-Status: Submitted [Remove this patch when next release is out]
> +
> +Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> +---
> + examples/persistent_common/host_assist.cpp | 2 +-
> + examples/persistent_common/host_assist.h   | 2 +-
> + examples/sgemm/main.cpp                    | 4 ++--
> + 3 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/examples/persistent_common/host_assist.cpp b/examples/persi=
stent_common/host_assist.cpp
> +index f1640bc..fd8bb18 100644
> +--- a/examples/persistent_common/host_assist.cpp
> ++++ b/examples/persistent_common/host_assist.cpp
> +@@ -34,7 +34,7 @@ void print_completion_code(uint32_t completion_code)
> + /**********************************************************************=
********
> + * Given an OpenCL Device, Abort if the device is not part of the AM57x =
platform
> + ***********************************************************************=
*******/
> +-int assert_am57x(cl::Device &device)
> ++void assert_am57x(cl::Device &device)
> + {
> +     cl::Platform platform;
> +     std::string  platform_name;
> +diff --git a/examples/persistent_common/host_assist.h b/examples/persist=
ent_common/host_assist.h
> +index dec381e..4abf837 100644
> +--- a/examples/persistent_common/host_assist.h
> ++++ b/examples/persistent_common/host_assist.h
> +@@ -7,7 +7,7 @@
> + /*---------------------------------------------------------------------=
--------
> + * Prototypes
> + *----------------------------------------------------------------------=
------*/
> +-int  assert_am57x         (cl::Device &device);
> ++void assert_am57x         (cl::Device &device);
> + void print_completion_code(uint32_t completion_code);
> +=20
> + #endif // _HOST_ASSIST_H_
> +diff --git a/examples/sgemm/main.cpp b/examples/sgemm/main.cpp
> +index 85f19ac..dfac651 100644
> +--- a/examples/sgemm/main.cpp
> ++++ b/examples/sgemm/main.cpp
> +@@ -96,7 +96,7 @@ int NUMCOMPUNITS                    =3D 0;
> + /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 */
> + void PrintUsageAndExit();
> + void HandleOptions(int argc, char* argv[]);
> +-bool SetSgemmParams(Device& device);
> ++void SetSgemmParams(Device& device);
> +=20
> + /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 */
> + /*  MAIN                                                               =
     */
> +@@ -428,7 +428,7 @@ static cl_ulong roundDownPower2(cl_ulong value)
> + /*---------------------------------------------------------------------=
--------
> + * Check platform name, set sgemm blocking/tiling parameters accordingly
> + *----------------------------------------------------------------------=
------*/
> +-bool SetSgemmParams(Device& device)
> ++void SetSgemmParams(Device& device)
> + {
> +    int APanelSz        =3D 8  << 10;
> +    int BPanelSz        =3D 16 << 10;
> +--=20
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/me=
ta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> index cbc35ce5..d0925db1 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> @@ -5,7 +5,9 @@ LICENSE =3D "BSD"
>  include ocl.inc
>  require recipes-ti/includes/ti-paths.inc
> =20
> -PR =3D "${INC_PR}.0"
> +SRC_URI +=3D "file://0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.=
patch;patchdir=3D${WORKDIR}/git"

Can this be done with striplevel/pnum instead of patchdir?
Also, when using patchdir, it's preferred to use relative path, instead of=
=20
very long absolute one. I'm aware of our existing instances of passing ${S}=
=20
(which is redundant) and ${WORKDIR} to patchdir, when it can be as simple a=
s=20
patchdir=3D..


> +
> +PR =3D "${INC_PR}.1"
> =20
>  COMPATIBLE_MACHINE =3D "dra7xx|keystone"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> @@ -64,7 +66,7 @@ OCL_MPAX_EXAMPLE_LIST =3D " vecadd_mpax \
> =20
>  OCL_EXAMPLE_LIST_append_k2hk =3D " ${OCL_MPAX_EXAMPLE_LIST}"
> =20
> -python do_unpack_append() {
> +python do_patch_append() {
>      import shutil
> =20
>      git_dir =3D d.expand("${WORKDIR}/git/examples")
> --=20
> 2.14.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

