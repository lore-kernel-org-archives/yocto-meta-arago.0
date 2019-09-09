Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8490E529E4
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 15:43:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89FgUbn111067
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 10:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568043750;
	bh=Z0oeVf9+KKifleHjc0WLx0d6u2qOioZnT1d3uGzsrk8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=YmGacmSH3kgu/xrs6kGGWhKRQIYWPM9a3hYLngnladOt/WSWqOIBzg89eVXZCkgCR
	SrbDfKjDE/MM25eg3xiYt5kIpuebBwGgwure5t73JTuwoUvdEgQxONOI4vQLWHHbIl
	4fGzqt3zPTw+SBhk3pPZf6vcCpYw2QcGxGsT4/1Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89FgUYW033746
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 10:42:30 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 10:42:30 -0500
Received: from DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0]) by
	DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0%18]) with mapi id
	15.01.1713.004; Mon, 9 Sep 2019 10:42:29 -0500
From: "Zhao, Yuan" <yuanzhao@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] ocl: update version to 01.01.19.00
Thread-Index: AQHVZyI1fLX1h2o9bUmcY5+q6kqbKKcjz68A//+sRHA=
Date: Mon, 9 Sep 2019 15:42:29 +0000
Message-ID: <a9a9417ebf4944bf81e61f7db8a94a8d@ti.com>
References: <20190909152101.84543-1-yuanzhao@ti.com>
	<20190909154138.GJ2400@beryl>
In-Reply-To: <20190909154138.GJ2400@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.48.216]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] ocl: update version to 01.01.19.00
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
X-List-Received-Date: Mon, 09 Sep 2019 15:43:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I moved SRCREV in ocl/ocl.inc to one commit newer.  Thanks!  - Yuan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, September 9, 2019 10:42 AM
To: Zhao, Yuan
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH v2] ocl: update version to 01.01.19.00

On Mon, Sep 09, 2019 at 10:21:01AM -0500, Yuan Zhao wrote:
> - Selected OpenCL 1.2 features
> - Runtime support update for TIDL API 01.03.01
> - Update OpenCL TIDL firmware to 01.01.19.00
>=20
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---

What changed in v2?


>  .../ocl-rtos/opencl-examples-rtos_git.bb           |  2 +-
>  .../recipes-ti/ocl-rtos/opencl-rtos_git.bb         |  2 +
>  .../ocl/files/0001-OpenCL_K2x_compile.patch        | 12 ----
>  .../ocl/files/0002-OpenCL_l2_cache_size.patch      | 49 ----------------
>  ...g-8.3.0-OpenCL-example-undefined-behavior.patch | 68 ----------------=
------
>  meta-arago-extras/recipes-ti/ocl/ocl.inc           |  5 +-
>  .../recipes-ti/ocl/opencl-examples_git.bb          |  4 +-
>  .../recipes-ti/ocl/opencl-monitor_git.bb           |  4 +-
>  .../recipes-ti/ocl/opencl-tidl-fw_git.bb           |  4 +-
>  meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |  6 +-
>  10 files changed, 13 insertions(+), 143 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2=
x_compile.patch
>  delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2=
_cache_size.patch
>  delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3=
.0-OpenCL-example-undefined-behavior.patch
>=20
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_g=
it.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
> index 42bc0a9b..15ac0af7 100644
> --- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "BSD"
>  require recipes-ti/ocl/ocl.inc
>  require recipes-ti/includes/arago-paths.inc
> =20
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.0"
> =20
>  COMPATIBLE_MACHINE =3D "omap-a15"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/m=
eta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> index 0c9aca7e..fd7e53c5 100644
> --- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> @@ -38,6 +38,7 @@ export WANT_LLVM_RELEASE =3D "3.6-ti"
>  OCL_BUILD_TARGET_omap-a15   =3D "ARM_AM57"
> =20
>  ENABLE_ULM =3D "0"
> +SHMEM_MANAGER =3D "CMEM"
> =20
>  RELEASE_TARGET =3D ""
>  RELEASE_TARGET_omap-a15 =3D "am57xx"
> @@ -63,6 +64,7 @@ do_configure() {
>          -DBUILD_TARGET=3D${OCL_BUILD_TARGET} \
>          -DBUILD_OUTPUT=3Dlib \
>          -DENABLE_ULM=3D${ENABLE_ULM} \
> +        -DSHMEM_MANAGER=3D${SHMEM_MANAGER} \
>          -DBUILD_OS=3DSYS_BIOS \
>          -DIPC_INSTALL_PATH=3D${IPC_INSTALL_DIR}/packages \
>          -DXDC_INSTALL_PATH=3D${XDC_INSTALL_DIR}/packages \
> diff --git a/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compi=
le.patch b/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.p=
atch
> deleted file mode 100644
> index 0098d321..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patc=
h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff --git a/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp b/host/src/=
core/dsp/tal/devmem_map_policy_mpm.cpp
> -index e5da9cc..182e5e3 100644
> ---- a/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp
> -+++ b/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp
> -@@ -91,6 +91,7 @@ void* DevMemMapPolicyMPM::Map (DSPDevicePtr64 dsp_addr=
,  uint32_t size) const
> -     else
> -         ReportError(ErrorType::Fatal,
> -                     ErrorKind::TranslateAddressOutsideMappedAddressRang=
e);
> -+    return 0;
> - }
> -=20
> - void DevMemMapPolicyMPM::Unmap(void* host_addr, uint32_t size) const
> diff --git a/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_=
size.patch b/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_si=
ze.patch
> deleted file mode 100644
> index 7a81a137..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.pa=
tch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -diff --git a/monitor/src/builtins.c b/monitor/src/builtins.c
> -index fbf3bf3..4edf61c 100644
> ---- a/monitor/src/builtins.c
> -+++ b/monitor/src/builtins.c
> -@@ -159,7 +159,7 @@ EXPORT int __cache_l2_none()
> - EXPORT int __cache_l2_32k()
> - {
> -     int32_t scratch_delta =3D __cache_l2_size() - (32 << 10);
> --    uint32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -+    int32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -     if (-scratch_delta > scratch_size) return 0;
> -     kernel_config_l2.L2_scratch_size +=3D scratch_delta;
> -=20
> -@@ -173,7 +173,7 @@ EXPORT int __cache_l2_32k()
> - EXPORT int __cache_l2_64k()
> - {
> -     int32_t scratch_delta =3D __cache_l2_size() - (64 << 10);
> --    uint32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -+    int32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -     if (-scratch_delta > scratch_size) return 0;
> -     kernel_config_l2.L2_scratch_size +=3D scratch_delta;
> -=20
> -@@ -187,7 +187,7 @@ EXPORT int __cache_l2_64k()
> - EXPORT int __cache_l2_128k()
> - {
> -     int32_t scratch_delta =3D __cache_l2_size() - (128 << 10);
> --    uint32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -+    int32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -     if (-scratch_delta > scratch_size) return 0;
> -     kernel_config_l2.L2_scratch_size +=3D scratch_delta;
> -=20
> -@@ -205,7 +205,7 @@ EXPORT int __cache_l2_512k() { return 0; }
> - EXPORT int __cache_l2_256k()
> - {
> -     int32_t scratch_delta =3D __cache_l2_size() - (256 << 10);
> --    uint32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -+    int32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -     if (-scratch_delta > scratch_size) return 0;
> -     kernel_config_l2.L2_scratch_size +=3D scratch_delta;
> -=20
> -@@ -219,7 +219,7 @@ EXPORT int __cache_l2_256k()
> - EXPORT int __cache_l2_512k()
> - {
> -     int32_t scratch_delta =3D __cache_l2_size() - (512 << 10);
> --    uint32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -+    int32_t scratch_size  =3D kernel_config_l2.L2_scratch_size;
> -     if (-scratch_delta > scratch_size) return 0;
> -     kernel_config_l2.L2_scratch_size +=3D scratch_delta;
> -=20
> diff --git a/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-Open=
CL-example-undefined-behavior.patch b/meta-arago-extras/recipes-ti/ocl/file=
s/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch
> deleted file mode 100644
> index b2c40c84..00000000
> --- a/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-exam=
ple-undefined-behavior.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 7cf77b704544b6012105f7ed19807b798b6cb242 Mon Sep 17 00:00:00 2001
> -From: Yuan Zhao <yuanzhao@ti.com>
> -Date: Mon, 24 Jun 2019 13:24:11 -0500
> -Subject: [PATCH] Fix g++ 8.3.0 OpenCL example undefined behavior
> -
> -- Fix undefined behavior of non-void functions with no return statements=
,
> -  when using g++ 8.3.0.  Change them to void functions.
> -
> -Upstream-Status: Submitted [Remove this patch when next release is out]
> -
> -Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ----
> - examples/persistent_common/host_assist.cpp | 2 +-
> - examples/persistent_common/host_assist.h   | 2 +-
> - examples/sgemm/main.cpp                    | 4 ++--
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/examples/persistent_common/host_assist.cpp b/examples/persi=
stent_common/host_assist.cpp
> -index f1640bc..fd8bb18 100644
> ---- a/examples/persistent_common/host_assist.cpp
> -+++ b/examples/persistent_common/host_assist.cpp
> -@@ -34,7 +34,7 @@ void print_completion_code(uint32_t completion_code)
> - /**********************************************************************=
********
> - * Given an OpenCL Device, Abort if the device is not part of the AM57x =
platform
> - ***********************************************************************=
*******/
> --int assert_am57x(cl::Device &device)
> -+void assert_am57x(cl::Device &device)
> - {
> -     cl::Platform platform;
> -     std::string  platform_name;
> -diff --git a/examples/persistent_common/host_assist.h b/examples/persist=
ent_common/host_assist.h
> -index dec381e..4abf837 100644
> ---- a/examples/persistent_common/host_assist.h
> -+++ b/examples/persistent_common/host_assist.h
> -@@ -7,7 +7,7 @@
> - /*---------------------------------------------------------------------=
--------
> - * Prototypes
> - *----------------------------------------------------------------------=
------*/
> --int  assert_am57x         (cl::Device &device);
> -+void assert_am57x         (cl::Device &device);
> - void print_completion_code(uint32_t completion_code);
> -=20
> - #endif // _HOST_ASSIST_H_
> -diff --git a/examples/sgemm/main.cpp b/examples/sgemm/main.cpp
> -index 85f19ac..dfac651 100644
> ---- a/examples/sgemm/main.cpp
> -+++ b/examples/sgemm/main.cpp
> -@@ -96,7 +96,7 @@ int NUMCOMPUNITS                    =3D 0;
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 */
> - void PrintUsageAndExit();
> - void HandleOptions(int argc, char* argv[]);
> --bool SetSgemmParams(Device& device);
> -+void SetSgemmParams(Device& device);
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 */
> - /*  MAIN                                                               =
     */
> -@@ -428,7 +428,7 @@ static cl_ulong roundDownPower2(cl_ulong value)
> - /*---------------------------------------------------------------------=
--------
> - * Check platform name, set sgemm blocking/tiling parameters accordingly
> - *----------------------------------------------------------------------=
------*/
> --bool SetSgemmParams(Device& device)
> -+void SetSgemmParams(Device& device)
> - {
> -    int APanelSz        =3D 8  << 10;
> -    int BPanelSz        =3D 16 << 10;
> ---=20
> -2.17.1
> -
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras=
/recipes-ti/ocl/ocl.inc
> index 21247177..f6775299 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,5 +1,5 @@
>  # patch version at the end needs to be in double digits
> -PV =3D "1.1.18.00"
> +PV =3D "1.1.19.00"
>  INC_PR =3D "r0"
> =20
>  LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3D2e3965a73a8a49c23=
836467266120dff"
> @@ -10,7 +10,8 @@ OCL_GIT_URI =3D "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL =3D "git"
>  OCL_GIT_BRANCH =3D "master"
> =20
> -OCL_SRCREV =3D "a50d8b41cc30bdf4faf1998ec3fc7d0a3093b795"
> +
> +OCL_SRCREV =3D "0f4be82079ba6ec9c7c8ee00f879c9f6f0ad4803"
> =20
>  BRANCH =3D "${OCL_GIT_BRANCH}"
>  SRC_URI =3D "${OCL_GIT_URI};protocol=3D${OCL_GIT_PROTOCOL};branch=3D${BR=
ANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/me=
ta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> index c562bbf7..4732c73d 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> @@ -5,9 +5,7 @@ LICENSE =3D "BSD"
>  include ocl.inc
>  require recipes-ti/includes/ti-paths.inc
> =20
> -SRC_URI +=3D "file://0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.=
patch;patchdir=3D.."
> -
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.0"
> =20
>  COMPATIBLE_MACHINE =3D "dra7xx|keystone"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> index 00aa773c..0ab21a1a 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> @@ -5,9 +5,7 @@ LICENSE =3D "BSD"
>  include ocl.inc
>  require recipes-ti/includes/arago-paths.inc
> =20
> -SRC_URI +=3D "file://0002-OpenCL_l2_cache_size.patch;patchdir=3D${WORKDI=
R}/git"
> -
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.0"
> =20
>  inherit update-alternatives
> =20
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> index a9ec413a..64dfd0d7 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "OpenCL TIDL firmware for AM57xx"
>  LICENSE =3D "TI-TFL"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3D082a028431c455252c1e1d3d10=
21d382"
> =20
> -PV =3D "01.01.18.00"
> +PV =3D "01.01.19.00"
>  PR =3D "r0"
> =20
>  require recipes-ti/includes/arago-paths.inc
> @@ -15,7 +15,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  GIT_URI      =3D "git://git.ti.com/opencl/opencl-firmware.git"
>  GIT_PROTOCOL =3D "git"
>  BRANCH       =3D "master"
> -SRCREV       =3D "3b98f405d98416a66678dec01d8f7ef244f379b6"
> +SRCREV       =3D "32772d41ae6978b0ec66173d2bfc8c041017bda1"
> =20
>  SRC_URI      =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${BRANC=
H}"
> =20
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-=
extras/recipes-ti/ocl/opencl_git.bb
> index 8b363573..69f93309 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> @@ -3,9 +3,8 @@ HOMEPAGE =3D "https://downloads.ti.com/mctools/esd/docs/o=
pencl/index.html"
>  LICENSE =3D "BSD"
> =20
>  include ocl.inc
> -SRC_URI +=3D "file://0001-OpenCL_K2x_compile.patch;patchdir=3D${WORKDIR}=
/git"
> =20
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.0"
> =20
>  inherit cmake systemd
> =20
> @@ -59,8 +58,9 @@ OCL_BUILD_TARGET_k2g =3D "ARM_K2G"
> =20
>  ENABLE_ULM =3D "1"
>  ENABLE_ULM_k2g =3D "0"
> +SHMEM_MANAGER =3D "CMEM"
> =20
> -EXTRA_OECMAKE +=3D " -DBUILD_TARGET=3D${OCL_BUILD_TARGET} -DBUILD_OUTPUT=
=3Dlib -DENABLE_ULM=3D${ENABLE_ULM} -DOCL_VERSION=3D${PV}"
> +EXTRA_OECMAKE +=3D " -DBUILD_TARGET=3D${OCL_BUILD_TARGET} -DBUILD_OUTPUT=
=3Dlib -DENABLE_ULM=3D${ENABLE_ULM} -DOCL_VERSION=3D${PV} -DSHMEM_MANAGER=
=3D${SHMEM_MANAGER}"
> =20
>  EXTRA_OEMAKE +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR} LINUX_DEVK=
IT_ROOT=3D${STAGING_DIR_HOST}"
>  export KERNEL_INSTALL_DIR =3D "${STAGING_KERNEL_DIR}"
> --=20
> 2.14.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

