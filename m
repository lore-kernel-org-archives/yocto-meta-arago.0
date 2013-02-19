Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 20B0B52A10
	for <meta-arago@arago-project.org>;
	Tue, 19 Feb 2013 04:20:52 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1J4KpVI011055;
	Mon, 18 Feb 2013 22:20:51 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1J4Kpd9002316;
	Mon, 18 Feb 2013 22:20:51 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 18 Feb 2013 22:20:51 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "fcooperjr27@gmail.com" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 19/20] pinmux-utility: Add new Pinmux Utility
Thread-Index: AQHODWGuv0rBgO8KaESPyT9iE1gqeZiAlhLw
Date: Tue, 19 Feb 2013 04:20:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C395427@DFLE09.ent.ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
	<1361141595-1687-19-git-send-email-fcooper@ti.com>
In-Reply-To: <1361141595-1687-19-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Tadyshak, Michael" <mtadyshak@ti.com>
Subject: Re: [PATCH 19/20] pinmux-utility: Add new Pinmux Utility
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
X-List-Received-Date: Tue, 19 Feb 2013 04:20:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

FYI although the recipes are similar using -M95% still didn't allow git to =
detect that this is a simple rename with some other minor tweaks.

> -----Original Message-----
> From: fcooperjr27@gmail.com [mailto:fcooperjr27@gmail.com]
> Sent: Sunday, February 17, 2013 4:53 PM
> To: meta-arago@arago-project.org
> Cc: Tadyshak, Michael; Cooper Jr., Franklin
> Subject: [PATCH 19/20] pinmux-utility: Add new Pinmux Utility
>=20
> From: Michael Tadyshak <mtadyshak@ti.com>
>=20
> * Add new Pinmux Utility that adds am335x silicon 2.1 support
> * Remove external license file since the zip file now contains one
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../pinmux-utility/pinmux-utility_2.4.1.0.bb       |   34 --------------=
------
>  .../pinmux-utility/pinmux-utility_2.5.2.0.bb       |   24 ++++++++++++++
>  2 files changed, 24 insertions(+), 34 deletions(-)  delete mode 100644 m=
eta-
> arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.4.1.0.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/pinmux-
> utility/pinmux-utility_2.5.2.0.bb
>=20
> diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-
> utility_2.4.1.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pi=
nmux-
> utility_2.4.1.0.bb
> deleted file mode 100644
> index c34f9fd..0000000
> --- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-
> utility_2.4.1.0.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -DESCRIPTION =3D "Texas Instruments Pinmux Utility"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2b328fcf0477d688d8b85f7310f9e6b9"
> -COMPATIBLE_MACHINE =3D "am335x-evm|am37x-evm|am3517-
> evm|beagleboard"
> -
> -PR =3D "r0"
> -
> -SRC_URI =3D
> "https://gforge.ti.com/gf/download/frsrelease/850/5562/PinMuxUtility_v2_0=
4_
> 01_00.zip;name=3Dbase;subdir=3D${P}"
> -
> -# Temporarily add LICENSE file here since zip files don't contain any li=
cense
> information. This file was grabbed -# from the License Agreement screen w=
hen
> installing this application.
> -SRC_URI +=3D "file://LICENSE"
> -
> -SRC_URI[base.md5sum] =3D "f65ec03bbbb9e14126ac8ce2795acede"
> -SRC_URI[base.sha256sum] =3D
> "a95fe1b436419bf97bfdcc0b7ce95e497558ad81190d95dc0869ef9fc794094c"
> -
> -S =3D "${WORKDIR}/${P}"
> -
> -do_unpack_extra() {
> -    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
> -}
> -
> -addtask unpack_extra after do_unpack before do_patch
> -
> -installdir =3D "host-tools/pinmux_utils/windows"
> -
> -do_install() {
> -    install -d ${D}/${installdir}
> -    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
> -    install ${S}/setup.exe ${D}/${installdir}
> -    install ${S}/Release_Notes.txt ${D}/${installdir}
> -}
> -
> -FILES_${PN} +=3D "${installdir}/*"
> diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-
> utility_2.5.2.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pi=
nmux-
> utility_2.5.2.0.bb
> new file mode 100644
> index 0000000..51c6571
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2
> +++ .5.2.0.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "Texas Instruments Pinmux Utility"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd69a4aafe4f7b66d5f9c60d6875ebd52"
> +COMPATIBLE_MACHINE =3D "am335x-evm|am37x-evm|am3517-
> evm|beagleboard"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D
> "https://gforge.ti.com/gf/download/frsrelease/1019/6393/PinMuxUtility_v2_=
05
> _02_00.zip;name=3Dbase;subdir=3D${P}"
> +
> +SRC_URI[base.md5sum] =3D "5a5cb5e9a5361fcb244a4b685872fe6b"
> +SRC_URI[base.sha256sum] =3D
> "93b8dfd726dd614aad9c2b0bb9ffc0abbd47e1c2900c3f411be7433c6d04fd2a"
> +
> +S =3D "${WORKDIR}/${P}"
> +
> +installdir =3D "host-tools/pinmux_utils/windows"
> +
> +do_install() {
> +    install -d ${D}/${installdir}
> +    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
> +    install ${S}/setup.exe ${D}/${installdir}
> +    install ${S}/Release_Notes.txt ${D}/${installdir} }
> +
> +FILES_${PN} +=3D "${installdir}/*"
> --
> 1.7.0.4


