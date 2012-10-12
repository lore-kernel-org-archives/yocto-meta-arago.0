Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 806C5529AA
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 13:41:21 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CDfK7D009255;
	Fri, 12 Oct 2012 08:41:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CDfKFp008893;
	Fri, 12 Oct 2012 08:41:20 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 12 Oct 2012 08:41:20 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v3] task-arago-tisdk-crypto: Port crypto
	tasks	from arago to meta-arago
Thread-Index: AQHNqDaLNm/gdNjwbEyTsrTnL3ObTpe1rUvQ
Date: Fri, 12 Oct 2012 13:41:19 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925C2D2@DLEE12.ent.ti.com>
References: <1350019860-10978-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350019860-10978-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH v3] task-arago-tisdk-crypto: Port crypto tasks	from arago to meta-arago
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
X-List-Received-Date: Fri, 12 Oct 2012 13:41:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 12, 2012 12:31 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH v3] task-arago-tisdk-crypto: Port
> crypto tasks from arago to meta-arago
>=20
> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * Port task-arago-tisdk-crypto including the host and target
> version
>   from arago to meta-arago. These tasks are significantly smaller
>   compared to the versions in arago. This is due to the contents
> of
>   these tasks being either split into new tasks or simply moved
> to
>   other tasks.
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 3 changes:
> Remove unneeded PACKAGE_ARCH
>=20
>  .../tasks/task-arago-tisdk-crypto-sdk-host.bb      |   11
> +++++++
>  .../tasks/task-arago-tisdk-crypto-sdk-target.bb    |   11
> +++++++
>  .../recipes-core/tasks/task-arago-tisdk-crypto.bb  |   30
> ++++++++++++++++++++
>  3 files changed, 52 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-crypto-sdk-host.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-crypto-sdk-target.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-crypto.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-crypto-sdk-host.bb
> new file mode 100644
> index 0000000..34093d6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> crypto-sdk-host.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Task to install crypto sources in SDK"
> +PR =3D "r0"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +COMPATIBLE_MACHINE =3D "(am37x-evm|am3517-evm)"
> +
> +inherit task
> +
> +RDEPENDS_${PN} =3D "\
> +    ti-ocf-crypto-module-src \
> +    "

This cannot be COMPATIBLE_MACHINE specific.  The package list is included f=
or all machines so for devices like am335x-evm this would fail to build.  I=
nstead if you have nothing to install then make this an empty package (you =
will still need to set ALLOW_EMPTY)

> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-crypto-sdk-target.bb
> new file mode 100644
> index 0000000..15f4b99
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> crypto-sdk-target.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Task to install crypto dev packages in SDK"
> +PR =3D "r0"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +
> +inherit task
> +
> +RDEPENDS_${PN} =3D "\
> +    openssl-dev \
> +    ocf-linux-dev \
> +    "
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-crypto.bb b/meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-crypto.bb
> new file mode 100644
> index 0000000..9636644
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> crypto.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "Task to install crypto packages into target FS"
> +PR =3D "r0"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +
> +inherit task
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +# Add openssl-misc to get the openssl.cnf file which is
> +# needed for "openssl req" and to avoid warnings.
> +# NOTE: This may change to openssl-conf in the future
> +CRYPTO_SUPPORT =3D "\
> +    openssl \
> +    openssl-misc \
> +    "
> +
> +# Add crypto hardware support for am37x-evm
> +# NOTE: this package depends on a kernel patch which also has a
> TSU
> +#       exemption filed.  The current name and checksums of the
> +#       kernel patch are:
> +# Name: 0001-linux-omap3-PSP-3.0.1.6-kernel-with-OCF-Linux.patch
> +# md5sum: 00bb20f2f33a37489d8c52212933368d
> +# sha256sum:
> 1fea8323d12cf1ee4f743f0f1c82d7f3821a7d9b7996c44b17d7761579bb090d
> +CRYPTO_SUPPORT_append_am37x-evm =3D " ti-ocf-crypto-module"
> +CRYPTO_SUPPORT_append_am3517-evm =3D " ti-ocf-crypto-module"
> +
> +RDEPENDS_${PN} =3D "\
> +    ${CRYPTO_SUPPORT} \
> +    "
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

