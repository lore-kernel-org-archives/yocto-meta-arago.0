Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BEA30529B1
	for <meta-arago@arago-project.org>;
	Mon, 20 Apr 2015 12:31:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3KCVIj2020318
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 07:31:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3KCVG6R016818
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 07:31:16 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 20 Apr 2015 07:31:16 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [meta-arago PATCH v2] img-pvr-sdk: IMG PowerVR
	SDK	based demos
Thread-Index: AQHQeFXd2dFrq8PNtkaYZp/0yNq5M51V2jCQ
Date: Mon, 20 Apr 2015 12:31:16 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814121E6D@DFLE09.ent.ti.com>
References: <1429196326-11255-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1429196326-11255-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [meta-arago PATCH v2] img-pvr-sdk: IMG PowerVR SDK	based demos
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
X-List-Received-Date: Mon, 20 Apr 2015 12:31:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Karthik,=20

Can this be modified so that the installation of the demos matches the inst=
allation of the libgles-omap3-rawdemos package for AM3 and AM4 so that Matr=
ix scripts may be reused on the platforms?=20

Thanks,
Jake

On 4/16/2015 10:58 AM, Karthik Ramanan wrote:
> * This is a package with pre-built demos
> * These demos will work on DRM
> * Also contains utilities for SGX performance measurement
>
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
> .../imgpvrsdk/img-pvr-sdk_3.3.2.bb                 |   29 +++++++++++++++=
+++++
> 1 file changed, 29 insertions(+)
> create mode 100644 meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-s=
dk_3.3.2.bb
>
> diff --git a/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3=
.2.bb b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
> new file mode 100644
> index 0000000..9387a74
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "Imagination PowerVR SDK binaries for Jacinto6 SoC"
> +LICENSE =3D "TI-TSPA"
> +LIC_FILES_CHKSUM =3D "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=
=3D46bcbfc69f8837c339e15fd4a5044a8c"
> +
> +SRC_URI =3D "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=3Dgit"
> +SRCREV =3D "c2456ec3f03da022fb7489d6b381a4ac26a68203"
> +
> +PR =3D "r1"
> +
> +COMPATIBLE_MACHINE =3D "dra7xx"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +
> +INSANE_SKIP_${PN} +=3D "dev-so"
> +
> +FILES_${PN} +=3D "/opt/img-powervr-sdk/Examples/Advanced/OGLES2Chameleon=
Man \
> +                /opt/img-powervr-sdk/Examples/Advanced/OGLES2Coverflow \
> +                /opt/img-powervr-sdk/Examples/Advanced/OGLES2ExampleUI \
> +                /opt/img-powervr-sdk/Examples/Advanced/OGLES2Navigation =
\
> +                /opt/img-powervr-sdk/PVRHub/* \
> +                /opt/img-powervr-sdk/PVRScopeDeveloper/* \
> +               "

