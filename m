Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 3BF6352A78
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2020 21:08:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044L6XUX100874;
	Mon, 4 May 2020 16:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588626393;
	bh=4VJTrT6EJrpzEVDl21kFGnKhMXYM9Rj2GCa2m7uEwXA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=VEGC3sGN1IO2CP2w0mMe1qNdAp96H5CCAGQd+24lR2l7IXQXJpz1oRLjApIFzCNuh
	d8hAR7PPwN7HEmHCtcZACE87y6Bobm/zXpc6zux1GiR/q8H3GQ8Cz/dIrmBvBVMdm9
	bWgjz5rPfdB1TLqm6JXITmWglwQg3Y1UsSVRDGgQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044L6X3a066958;
	Mon, 4 May 2020 16:06:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 4 May 2020 16:06:32 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1979.003; Mon, 4 May 2020 16:06:33 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master][PATCH 2/4] toolchain: remove
	secondary toolchain hack
Thread-Index: AQHWIlZHo5455eBWVkiTPiHDl4kzO6iYatng
Date: Mon, 4 May 2020 21:06:32 +0000
Message-ID: <6fc6e6c601214fc083d666da2a7aff60@ti.com>
References: <1588625682-33592-1-git-send-email-denis@denix.org>
	<1588625682-33592-2-git-send-email-denis@denix.org>
In-Reply-To: <1588625682-33592-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master][PATCH 2/4] toolchain: remove secondary toolchain hack
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
X-List-Received-Date: Mon, 04 May 2020 21:08:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK.

This was for adding the R5 toolchain into the devkit so that we can build t=
he R5 u-boot from the SDK.=20

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, May 04, 2020 4:55 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [master][PATCH 2/4] toolchain: remove
> secondary toolchain hack
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> With K3 R5F support in meta-ti now, this hack is no longer needed.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/toolchain-arm.inc        |  6 ----=
--
>  .../recipes-core/meta/external-arm-secondary-sdk-toolchain.bb  |  4 ----
>  .../packagegroups/packagegroup-cross-canadian.bbappend         | 10 ----=
-----
> -
>  3 files changed, 20 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-
> secondary-sdk-toolchain.bb
>  delete mode 100644 meta-arago-distro/recipes-
> core/packagegroups/packagegroup-cross-canadian.bbappend
>=20
> diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
> b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
> index d2c2b2f..fd63256 100644
> --- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
> +++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
> @@ -9,9 +9,6 @@ EAT_TARGET_SYS_arm =3D "${EAT_TARGET_SYS_ARMV5}"
>  EAT_TARGET_SYS_armv7a =3D "${EAT_TARGET_SYS_ARMV7}"
>  EAT_TARGET_SYS_aarch64 =3D "${EAT_TARGET_SYS_ARMV8}"
>=20
> -SECONDARY_TARGET_ARCH =3D ""
> -SECONDARY_TARGET_ARCH_k3 =3D "armv7a"
> -
>  TARGET_VENDOR =3D ""
>=20
>  TOOLCHAIN_BASE ?=3D "/opt"
> @@ -34,9 +31,6 @@ PREFERRED_PROVIDER_gcc-cross-canadian-
> ${TRANSLATED_TARGET_ARCH} ?=3D "external-arm
>  PREFERRED_PROVIDER_binutils-cross-canadian-
> ${TRANSLATED_TARGET_ARCH} ?=3D "external-arm-sdk-toolchain"
>  #PREFERRED_PROVIDER_gdb-cross-canadian-
> ${TRANSLATED_TARGET_ARCH} =3D "external-arm-sdk-toolchain"
>=20
> -PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGET_ARCH}
> ?=3D "external-arm-secondary-sdk-toolchain"
> -PREFERRED_PROVIDER_binutils-cross-canadian-
> ${SECONDARY_TARGET_ARCH} ?=3D "external-arm-secondary-sdk-toolchain"
> -
>  # Special case for gdb to be built as part of canadian-cross-sdk, instea=
d of
> packaged from external toolchain
>  bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D
> "${exec_prefix}/bin"
>  PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}
> =3D "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-
> sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-
> secondary-sdk-toolchain.bb
> deleted file mode 100644
> index 22a8aa0..0000000
> --- a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-
> toolchain.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -TARGET_ARCH :=3D "${SECONDARY_TARGET_ARCH}"
> -MACHINEOVERRIDES :=3D "${SECONDARY_TARGET_ARCH}"
> -
> -require recipes-core/meta/external-arm-sdk-toolchain.bb
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> cross-canadian.bbappend b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-cross-canadian.bbappend
> deleted file mode 100644
> index fb728e0..0000000
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-
> canadian.bbappend
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -PR_append =3D ".arago0"
> -
> -SECONDARY_TARGET_ARCH ?=3D ""
> -
> -SECONDARY_TOOLCHAIN =3D "gcc-cross-canadian-
> ${SECONDARY_TARGET_ARCH} \
> -                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
> -
> -RDEPENDS_${PN}_append =3D " \
> -    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', '', '',
> '${SECONDARY_TOOLCHAIN}', d)} \
> -"
> --
> 2.7.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

