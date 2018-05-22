Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8CD465297E
	for <meta-arago@arago-project.org>;
	Tue, 22 May 2018 13:25:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4MDPhsB004260
	for <meta-arago@arago-project.org>; Tue, 22 May 2018 08:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526995543;
	bh=PKfZPUFpF8FCm6VvJP5sGrxBpNB1IRBZ0JKt9G+M1io=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=RgoS2oEg2vXf2wTm2pFQInuMcXRlM4ciI3ivnuJayChbSdryjcV9LFv3wkJZmlvcl
	xfONaik/UHjKCuiqTSokkuhpGKupTCmtzZzKQGU8K8fJ60Tq2VN0ndx8vAqVsJTWtS
	dc76O/5WFRIx/ZZe/kyFXygyBvZLsDshvaUHRvCo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4MDPhUl010654
	for <meta-arago@arago-project.org>; Tue, 22 May 2018 08:25:43 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 22 May 2018 08:25:43 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Tue, 22 May 2018 08:25:43 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH v5] ti-ipc: Update to new version
	3.47.02.00
Thread-Index: AQHT8Q1n6o3bztjCoUaeYWAXaWytUKQ7vp7g
Date: Tue, 22 May 2018 13:25:43 +0000
Message-ID: <57da39dab54349ff9a9b577fc86932aa@ti.com>
References: <1526911794-26708-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1526911794-26708-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.171.2]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][PATCH v5] ti-ipc: Update to new version 3.47.02.00
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
X-List-Received-Date: Tue, 22 May 2018 13:25:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping..

> -----Original Message-----
> From: Nelson, Sam
> Sent: Monday, May 21, 2018 10:10 AM
> To: meta-arago@arago-project.org
> Cc: Nelson, Sam
> Subject: [meta-processor-sdk][PATCH v5] ti-ipc: Update to new version
> 3.47.02.00
>=20
> Added new examples for AM571X
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> Change from previous version
> Remove signit part
> ---
> ---
>  recipes-ti/ipc/ti-ipc-3.47.01.00.inc              |  4 --
>  recipes-ti/ipc/ti-ipc-3.47.02.00.inc              |  4 ++
>  recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend |  4 +-
>  recipes-ti/ipc/ti-ipc-examples_git.bbappend       | 57
> ++++++++++++++++++++++-
>  recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc         |  7 ---
>  recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc         |  5 ++
>  recipes-ti/ipc/ti-ipc-rtos_git.bbappend           | 52 +++++++++++++++++=
+++-
>  recipes-ti/ipc/ti-ipc_git.bbappend                |  2 +-
>  8 files changed, 117 insertions(+), 18 deletions(-)
>  delete mode 100644 recipes-ti/ipc/ti-ipc-3.47.01.00.inc
>  create mode 100644 recipes-ti/ipc/ti-ipc-3.47.02.00.inc
>  delete mode 100644 recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
>  create mode 100644 recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc=
-
> 3.47.01.00.inc
> deleted file mode 100644
> index 02abfa6..0000000
> --- a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -PV =3D "3.47.01.00"
> -
> -#Corresponds to 3.47.01.00A
> -TI_IPC_SRCREV =3D "6a2595a4148fb12f259efc19164a9d33ad2ed294"
> diff --git a/recipes-ti/ipc/ti-ipc-3.47.02.00.inc b/recipes-ti/ipc/ti-ipc=
-
> 3.47.02.00.inc
> new file mode 100644
> index 0000000..970f04b
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-3.47.02.00.inc
> @@ -0,0 +1,4 @@
> +PV =3D "3.47.02.00"
> +
> +#Corresponds to 3.47.02.00
> +TI_IPC_SRCREV =3D "24c36385d096613af123d1e1696fb2fee652ef36"
> diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend b/recipes-
> ti/ipc/ti-ipc-examples-linux_git.bbappend
> index c0eac74..6d6a771 100644
> --- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
> +++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
> @@ -1,5 +1,5 @@
>  PR_append =3D ".tisdk1"
>=20
> -require ti-ipc-3.47.01.00.inc
> +require ti-ipc-3.47.02.00.inc
>=20
> -require ti-ipc-rtos-3.47.01.00.inc
> +require ti-ipc-rtos-3.47.02.00.inc
> diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bbappend b/recipes-ti/ipc=
/ti-ipc-
> examples_git.bbappend
> index c0eac74..4491a25 100644
> --- a/recipes-ti/ipc/ti-ipc-examples_git.bbappend
> +++ b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
> @@ -1,5 +1,58 @@
>  PR_append =3D ".tisdk1"
>=20
> -require ti-ipc-3.47.01.00.inc
> +require ti-ipc-3.47.02.00.inc
> +
> +require ti-ipc-rtos-3.47.02.00.inc
> +
> +ALT_PLATFORM_am57xx-evm =3D "AM572X AM571X"
> +
> +do_compile() {
> +
> +  cd ${S_ipc-examples}/src
> +  oe_runmake .examples \
> +    IPCTOOLS=3D"${S_ipc-metadata}/src/etc"
> +
> +  for alt_platform in ${ALT_PLATFORM}; do
> +    oe_runmake .examples "PLATFORM=3D${alt_platform}" \
> +      IPCTOOLS=3D"${S_ipc-metadata}/src/etc"
> +  done
> +}
> +
> +do_compile_append() {
> +
> +  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> +    oe_runmake extract HOSTOS=3D"bios"
> IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}"
> +
> +    for alt_platform in ${ALT_PLATFORM}; do
> +      oe_runmake extract PLATFORM=3D"${alt_platform}" HOSTOS=3D"bios" \
> +         IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}"
> +    done
> +    oe_runmake -C examples all HOSTOS=3D"bios" \
> +      IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}"
> +    for alt_platform in ${ALT_PLATFORM}; do
> +      oe_runmake -C examples all HOSTOS=3D"bios" \
> +        IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}" PLATFORM=3D"${alt_platfor=
m}"
> +    done
> +  fi
> +}
> +
> +do_install_append() {
> +  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> +    # Install directory for bios examples
> +    install -d ${D}/ipc_${IPC_VERSION}/examples/bios
> +    oe_runmake -C examples install IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}=
" \
> +      HOSTOS=3D"bios" EXEC_DIR=3D"${D}/ipc_${IPC_VERSION}/examples/bios"
> +    oe_runmake -C examples install_rov
> IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}" \
> +      HOSTOS=3D"bios" EXEC_DIR=3D"${D}/ipc_${IPC_VERSION}/examples/bios"
> +
> +    for alt_platform in ${ALT_PLATFORM}; do
> +      oe_runmake -C examples install IPC_INSTALL_DIR=3D"${IPC_INSTALL_DI=
R}" \
> +        HOSTOS=3D"bios"
> EXEC_DIR=3D"${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
> +        PLATFORM=3D"${alt_platform}"
> +      oe_runmake -C examples install_rov
> IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}" \
> +        HOSTOS=3D"bios"
> EXEC_DIR=3D"${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
> +        PLATFORM=3D"${alt_platform}"
> +    done
> +  fi
> +}
>=20
> -require ti-ipc-rtos-3.47.01.00.inc
> diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc b/recipes-ti/ipc/t=
i-ipc-rtos-
> 3.47.01.00.inc
> deleted file mode 100644
> index d31773d..0000000
> --- a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Corresponds to tag: 3.47.01.00B
> -SRCREV_ipc-examples =3D "03ff856444b5bb9e60a907125a1f042b29b25d7b"
> -
> -# Corresponds to tag: 3.47.01.00A
> -SRCREV_ipc-metadata =3D "72578cce9c9f9a932eb22b3397b46131efb12d69"
> -
> -PR =3D "${INC_PR}.r5"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc b/recipes-ti/ipc/t=
i-ipc-rtos-
> 3.47.02.00.inc
> new file mode 100644
> index 0000000..84178e7
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc
> @@ -0,0 +1,5 @@
> +# Corresponds to tag: 3.47.02.00
> +SRCREV_ipc-metadata =3D "e8aff83111b8a0d64d7a77413b6f66d3106084d8"
> +
> +# Corresponds to tag: 3.47.02.00
> +SRCREV_ipc-examples =3D "351e9a6d94c68f7ff64b2c002ee6750242ece6d9"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend b/recipes-ti/ipc/ti-=
ipc-
> rtos_git.bbappend
> index c0eac74..d181688 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
> @@ -1,5 +1,53 @@
>  PR_append =3D ".tisdk1"
>=20
> -require ti-ipc-3.47.01.00.inc
> +require ti-ipc-3.47.02.00.inc
>=20
> -require ti-ipc-rtos-3.47.01.00.inc
> +require ti-ipc-rtos-3.47.02.00.inc
> +
> +ALT_PLATFORM_am57xx-evm =3D "AM572X AM571X"
> +
> +do_compile() {
> +  oe_runmake -f ipc-bios.mak clean
> +  oe_runmake -f ipc-bios.mak release
> +
> +  cd ${S_ipc-metadata}
> +  oe_runmake .all-files IPC_INSTALL_DIR=3D"${S}" \
> +    BUILD_HOST_OS=3D"linux" \
> +    RELEASE_TYPE=3D"${RELEASE_TYPE}"
> +
> +  cd ${S_ipc-examples}/src
> +  oe_runmake .examples \
> +    IPCTOOLS=3D"${S_ipc-metadata}/src/etc"
> +  for alt_platform in ${ALT_PLATFORM}; do
> +    oe_runmake .examples \
> +      IPCTOOLS=3D"${S_ipc-metadata}/src/etc" \
> +      PLATFORM=3D${alt_platform}
> +  done
> +
> +  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> +    oe_runmake extract HOSTOS=3D"bios" IPC_INSTALL_DIR=3D"${S}"
> +    oe_runmake extract HOSTOS=3D"linux" IPC_INSTALL_DIR=3D"${S}"
> +
> +    for alt_platform in ${ALT_PLATFORM}; do
> +      oe_runmake extract PLATFORM=3D${alt_platform} HOSTOS=3D"bios"
> IPC_INSTALL_DIR=3D"${S}"
> +      oe_runmake extract PLATFORM=3D${alt_platform} HOSTOS=3D"linux"
> IPC_INSTALL_DIR=3D"${S}"
> +    done
> +  fi
> +
> +  IPC_VERSION=3D`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
> +  install -d ${IPC_PACKAGE_DIR}
> +  # Copy docs and other meta files
> +  cp -pPrf  ${S_ipc-metadata}/exports/ipc_${IPC_VERSION}/* -d
> ${IPC_PACKAGE_DIR}
> +
> +  # Copy example folders corresponding to the platforms
> +  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> +    install -d ${IPC_PACKAGE_DIR}/examples
> +    cp -pPf ${S_ipc-examples}/src/examples/*.*
> ${IPC_PACKAGE_DIR}/examples/
> +    cp -pPf ${S_ipc-examples}/src/examples/makefile
> ${IPC_PACKAGE_DIR}/examples/
> +    cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}*
> ${IPC_PACKAGE_DIR}/examples/
> +    for alt_platform in ${ALT_PLATFORM}; do
> +      cp -pPrf ${S_ipc-examples}/src/examples/${alt_platform}*
> ${IPC_PACKAGE_DIR}/examples/
> +    done
> +    find ${IPC_PACKAGE_DIR}/examples/ -name "*zip" -type f | xargs -I {}=
 rm {}
> +  fi
> +}
> diff --git a/recipes-ti/ipc/ti-ipc_git.bbappend b/recipes-ti/ipc/ti-
> ipc_git.bbappend
> index 96b3c2d..3451b19 100644
> --- a/recipes-ti/ipc/ti-ipc_git.bbappend
> +++ b/recipes-ti/ipc/ti-ipc_git.bbappend
> @@ -1,3 +1,3 @@
>  PR_append =3D ".tisdk0"
>=20
> -require ti-ipc-3.47.01.00.inc
> +require ti-ipc-3.47.02.00.inc
> --
> 1.9.1


