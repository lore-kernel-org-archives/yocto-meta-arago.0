Return-Path: <sam.nelson@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id CE60152A56
	for <meta-arago@arago-project.org>;
	Mon, 26 Jun 2017 18:59:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QIxxii018595
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 13:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498503599;
	bh=NQbkSQkwhbb6n7/Wk9dCrmkV9ieUYG80jihapfL87KY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=GQjKZTkF888E+TAz8TUC1Oa59AxVlGCWbv+yeAEG34Kd8tNKRz5NdksWoWa5Wqcd0
	/pRKRhTdH8CY2Xo2x7qjJm8lrwEpQnpt1qxwFsORDd7oSwZIEKrtfMs1VX4spej03W
	IwNHi1rDr0B0Pyr1WsS/96sPmRZSXOTAu5FXftEY=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QIxxXN017375
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 13:59:59 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Mon, 26 Jun 2017 13:59:59 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH v3 1/2] big-data-ipc-demo:
	Add ipc examples for big data buffer exchange
Thread-Index: AQHS7qOy3G+Y8C5gJEKDMQ9pCYewTaI3z50A//+uq2A=
Date: Mon, 26 Jun 2017 18:59:58 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058643C32@DLEE11.ent.ti.com>
References: <1498498997-30316-1-git-send-email-sam.nelson@ti.com>
	<20170626184636.GC14665@edge>
In-Reply-To: <20170626184636.GC14665@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH v3 1/2] big-data-ipc-demo: Add ipc examples for big data buffer exchange
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
X-List-Received-Date: Mon, 26 Jun 2017 19:00:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, June 26, 2017 2:47 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/master][PATCH v3 1/2] big-data-ipc-demo:
> Add ipc examples for big data buffer exchange
>=20
> Thanks, Sam, looks reasonable.
>=20
> Few non-critical comments - let me know if you want to fix them and re-
> submit, or I can merge as is and if needed, address them later as a follo=
w up.
>=20
>=20
> On Mon, Jun 26, 2017 at 01:43:16PM -0400, Sam Nelson wrote:
> > Adds example with host running linux
> > Demonstrates transfer of Big data buffers between A15 host and DSP core
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Change from previous version of patch
> > - Expand to am57xx-evm to omap-a15
> > - Remove ti-staging.inc
> > ---
> > ---
> >  .../big-data-ipc-demo-linux_git.bb                 | 41
> ++++++++++++++++++++++
> >  .../big-data-ipc-demo/big-data-ipc-demo.inc        | 39
> ++++++++++++++++++++
> >  2 files changed, 80 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-
> demo/big-data-ipc-demo-linux_git.bb
> >  create mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-
> demo/big-data-ipc-demo.inc
> >
> > diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-=
ipc-
> demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-
> data-ipc-demo-linux_git.bb
> > new file mode 100644
> > index 0000000..0734177
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-
> demo-linux_git.bb
> > @@ -0,0 +1,41 @@
> > +SUMMARY =3D "TI Big data IPC: Host linux examples"
> > +
> > +require recipes-ti/includes/ti-paths.inc
> > +require big-data-ipc-demo.inc
> > +
> > +DEPENDS =3D "ti-ipc \
> > +           ti-xdctools \
> > +           ti-sysbios \
> > +           ti-ipc-rtos \
> > +           cmem \
> > +"
> > +
> > +EXTRA_OEMAKE =3D "\
> > +    PLATFORM=3D${PLATFORM} \
> > +    XDC_INSTALL_DIR=3D"${XDC_INSTALL_DIR}" \
> > +    BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_DIR}" \
> > +    IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}" \
> > +    LINUX_SYSROOT_DIR=3D"${STAGING_INCDIR}" \
> > +    ${IPC_TARGETS} \
> > +    JOBS=3D"${PARALLEL_MAKE}" \
> > +"
> > +
> > +do_create_srcipk_prepend() {
> > +  rm -rf host_bios
> > +}
> > +
> > +do_compile() {
> > +  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> > +      oe_runmake host_linux
> > +  fi
> > +}
>=20
> I don't think checking PLATFORM above and below is necessary - you set st=
rict
> COMPATIBLE_MACHINE filter and set all possible variants of PLATFORM var
> below.
> Even if something is not defined, let if fail with UNKNOWN setting, inste=
ad of
> succeeding and not building anything...
>

Ok. I can remote PLATFORM check and handle using COMPATIBLE MACHINE.
I will send updated patch.
=20
>=20
> > +do_install() {
> > +  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> > +    oe_runmake EXEC_DIR=3D"${D}${bindir}" install_linux_bin
> > +  fi
> > +}
> > +
> > +PACKAGES =3D+ "${PN}-firmware"
> > +FILES_${PN}-firmware +=3D
> "${bindir}/simple_buffer_example/release/server_dsp.xe66"
> > +INSANE_SKIP_${PN}-firmware +=3D "arch"
> > diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-=
ipc-
> demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-
> demo.inc
> > new file mode 100644
> > index 0000000..c3f8f38
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-
> demo.inc
> > @@ -0,0 +1,39 @@
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://makefile;beginline=3D1;endline=3D31;md5=3D2f2ea348b98d5cc7807ece7=
ad
> cc2c43a"
> > +
> > +COMPATIBLE_MACHINE =3D "omap-a15|keystone"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +BIG_DATA_IPC_GIT_URI =3D "git://git.ti.com/processor-sdk/big-data-ipc-
> examples.git"
> > +BIG_DATA_IPC_GIT_PROTOCOL =3D "git"
> > +BIG_DATA_IPC_GIT_BRANCH =3D "master"
> > +
> > +# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.01.00.00"
> > +BIG_DATA_IPC_SRCREV =3D
> "5907bff5a29fe2ba8719ae8c3c5d62b20b7b6bc9"
> > +
> > +BRANCH =3D "${BIG_DATA_IPC_GIT_BRANCH}"
> > +SRC_URI =3D
> "${BIG_DATA_IPC_GIT_URI};protocol=3D${BIG_DATA_IPC_GIT_PROTOCOL};bran
> ch=3D${BRANCH}"
> > +
> > +SRCREV =3D "${BIG_DATA_IPC_SRCREV}"
> > +PV =3D "01.01.00.00"
>=20
> Kind of strange split - usually common pieces are in .inc and version-spe=
cific
> are in .bb file. Here you set SRCREV and PV in .inc file... Any reason?

This is in anticipation of a  big-data-ipc-demo-bios package from same git =
repo coming up soon.
(Waiting for some dependencies to be upstream first)

>=20
>=20
> > +S =3D "${WORKDIR}/git"
> > +
> > +PLATFORM =3D "UNKNOWN"
> > +PLATFORM_omap-a15 =3D "DRA7XX"
> > +PLATFORM_k2hk-evm =3D "TCI6636"
> > +PLATFORM_k2l-evm =3D "TCI6630"
> > +PLATFORM_k2e =3D "66AK2E"
> > +PLATFORM_k2g =3D "66AK2G"
> > +
> > +IPC_TARGETS =3D ""
> > +IPC_TARGETS_omap-a15 =3D "\
> > +    gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
> > +    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" =
\
> > +    ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
> > +"
> > +
> > +IPC_TARGETS_keystone =3D " \
> > +    gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
> > +    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" =
\
> > +"
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

