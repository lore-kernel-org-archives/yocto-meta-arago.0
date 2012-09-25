Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 77F4F529B2
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 13:19:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8PDJgex002873;
	Tue, 25 Sep 2012 08:19:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8PDJgKo028210;
	Tue, 25 Sep 2012 08:19:42 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 25 Sep 2012 08:19:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [meta-arago-extra][PATCH] pinmux-utility: Add
	pinmux utility for am1808
Thread-Index: AQHNmFgGkKU86+cLtkCyZslt2w95iJeaTpiAgAC5oFA=
Date: Tue, 25 Sep 2012 13:19:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2ECE72@DFLE09.ent.ti.com>
References: <1348274580-27428-1-git-send-email-fcooper@ti.com>
	<20120924204655.GB4278@denix.org>
In-Reply-To: <20120924204655.GB4278@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-extra][PATCH] pinmux-utility: Add pinmux utility for am1808
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
X-List-Received-Date: Tue, 25 Sep 2012 13:19:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will send an updated patch that fixes the name=3Dbase issue.=20

I still do not like porting recipes and adding compatible machines to a rec=
ipe that I am not sure if it will work but for tools like pinmux especially=
 in meta-arago-extras I can understand not being so restrictive since it ex=
plicitly states what devices it supports. However, for this version of the =
pinmux utility, omapl138 wouldn't be a proper machine to use since this too=
l only supports AM1808/AM1810, AM1806, AM1802 which means all the DSP relat=
ed pins are ignored. If for the SOC family in meta-ti we had "am180x" then =
I could see changing the compatible machine to that.

I will also send a  patch for pinmux-utility_2.3.1.0.bb that uses SOC names=
 rather than machine names when possible.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Monday, September 24, 2012 3:47 PM
To: Franklin S. Cooper Jr
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago-extra][PATCH] pinmux-utility: Add pin=
mux utility for am1808

On Fri, Sep 21, 2012 at 07:43:00PM -0500, Franklin S. Cooper Jr wrote:
> * Add Windows base pinmux utility for am1808.
> * This recipe was split from the pinmux-utility_2.3.1.0 recipe in arago.
> * The current recipe pulls in a zip file that doesn't contain license
>   information. No where within the zip file or actually application conta=
ins
>   licensing information.
> * Use the LICENSE file that contains the license agreement text that is
>   displayed when installing the pinmux-utility version 2.3.1.0.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../pinmux-utility/pinmux-utility_1.0.1076.3.bb    |   34 ++++++++++++++=
++++++
>  1 files changed, 34 insertions(+), 0 deletions(-)  create mode 100644=20
> meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1
> 076.3.bb
>=20
> diff --git=20
> a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0
> .1076.3.bb=20
> b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0
> .1076.3.bb
> new file mode 100644
> index 0000000..24f4a15
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility
> +++ _1.0.1076.3.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "Texas Instruments Pinmux Utility"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b328fcf0477d688d8b85f7310f9e=
6b9"
> +COMPATIBLE_MACHINE =3D "am180x-evm"

Do we want it to be this strict? Should this rather be "omapl138" SOC?
Well, the same applies to another pinmux-utility - should that be "omap3|ti=
33x" instead? Please be less restrictive in recipes, especially in meta-ara=
go-extras, as that can be used with derivative boards, so no reason to limi=
t it to a specific EVM only. And "was not tested" is not an excuse here :)


> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_S=
etup_AM18xx_01_00_1076_03.zip;name=3Domapl138;subdir=3D${P}"

Above has name=3Domapl138...


> +# Temporarily add LICENSE file here since zip files don't contain any=20
> +license information. This file was grabbed # from the License=20
> +Agreement screen when installing pinmux-utility_2.3.1.0. No license info=
rmation exist for this # version of the pinmux utility.
> +SRC_URI +=3D "file://LICENSE"
> +
> +SRC_URI[base.md5sum] =3D "5a4eb834bde44c662aaf669882adbfe6"
> +SRC_URI[base.sha256sum] =3D "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0=
bd18c34cd0221d9d450d0"

And checksums require name=3Dbase!


> +S =3D "${WORKDIR}/${P}"
> +
> +do_unpack_extra() {
> +    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P} }
> +
> +addtask unpack_extra after do_unpack before do_patch
> +
> +installdir =3D "host-tools/pinmux_utils/windows"
> +
> +do_install() {
> +    install -d ${D}/${installdir}
> +    cp -rf ${S}/bin ${D}/${installdir}/
> +    cp -rf ${S}/configurations ${D}/${installdir}/ }
> +
> +FILES_${PN} +=3D "${installdir}/*"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

