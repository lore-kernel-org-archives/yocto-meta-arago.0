Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AC957529CC
	for <meta-arago@arago-project.org>;
	Fri,  4 Oct 2013 23:00:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94N0ACY003838
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 18:00:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94N09mo001331
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 18:00:10 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 4 Oct 2013 18:00:09 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/4] ti-tisdk-makefile: Pass in LOADADDR
	for	Linux kernel
Thread-Index: AQHOwVSh2+ebh03ef0+PvVbpjumf5pnlKElC
Date: Fri, 4 Oct 2013 23:00:09 +0000
Message-ID: <DF66FAFC-ED3D-4582-8D73-695CD644F44B@ti.com>
References: <1380929996-30089-1-git-send-email-fcooper@ti.com>,
	<1380929996-30089-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1380929996-30089-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 4/4] ti-tisdk-makefile: Pass in LOADADDR for	Linux kernel
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
X-List-Received-Date: Fri, 04 Oct 2013 23:00:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Why not switch to zImage which does not need this?

If you want to support both you could modify the make target to uImage plus=
 loadaddr or zImage based on the kernel image type.=20

Sincerely,
Chase Maupin
> On Oct 4, 2013, at 5:54 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wrote=
:
>=20
> * Newer versions of the kernel now require a LOADADDR to be set when buil=
ding
>  uImage.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> .../ti-tisdk-makefile/Makefile_linux               |    2 +-
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 +++-
> 2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/=
ti-tisdk-makefile/Makefile_linux
> index 4a13f48..43e22f2 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_linux
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_linux
> @@ -4,7 +4,7 @@ linux:
>    @echo     Building the Linux Kernel
>    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    $(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm CROSS_COMPILE=3D$(CRO=
SS_COMPILE) tisdk_$(PLATFORM)_defconfig
> -    $(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm CRO=
SS_COMPILE=3D$(CROSS_COMPILE) uImage
> +    $(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm CRO=
SS_COMPILE=3D$(CROSS_COMPILE) LOADADDR=3D__LOAD_ADDRESS__ uImage
>    $(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm CROSS=
_COMPILE=3D$(CROSS_COMPILE) modules
>=20
> linux_install:
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk=
-makefile_1.0.bb
> index a1faffd..c9ec899 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
> @@ -33,7 +33,7 @@ SRC_URI =3D "\
>     file://Makefile_oprofile-example \
> "
>=20
> -PR =3D "r15"
> +PR =3D "r16"
>=20
> MAKEFILES_COMMON =3D "linux \
>                     matrix-gui \
> @@ -119,6 +119,8 @@ do_install () {
>         sed -i -e "s/__INSTALL_TARGETS__/$install_targets/" ${D}/Makefile
>     fi
>=20
> +    sed -i -e "s/__LOAD_ADDRESS__/${UBOOT_LOADADDRESS}/" ${D}/Makefile
> +
>     install  ${WORKDIR}/Rules.make ${D}/Rules.make
>=20
>     # fixup Rules.make values
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

