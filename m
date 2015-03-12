Return-Path: <vchengalvala@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D2666529F8
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 01:49:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C1n6vu008675
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 20:49:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C1n5OW008434
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 20:49:05 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 11 Mar 2015 20:49:05 -0500
From: "Chengalvala, Vivek" <vchengalvala@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-arago] [meta-arago 1/2] packagegroup-*-graphics: Add
	omapdrm-pvr
Thread-Index: AQHQXFW+WVDfWWeFXUOtFaTUMRhbm50YFC+g
Date: Thu, 12 Mar 2015 01:49:04 +0000
Deferred-Delivery: Thu, 12 Mar 2015 01:49:00 +0000
Message-ID: <FCB36D0BED1F0D4EA8E6242507E4245B0C8827C7@DFLE08.ent.ti.com>
References: <1426074538-21653-1-git-send-email-a0393906@ti.com>
	<20150311234718.GC23587@edge>
In-Reply-To: <20150311234718.GC23587@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Balagopalakrishnan, Anand" <anandb@ti.com>
Subject: Re: [meta-arago 1/2] packagegroup-*-graphics: Add omapdrm-pvr
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
X-List-Received-Date: Thu, 12 Mar 2015 01:49:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

+Anand

Anand is trying to get Graphics to work with CONFIG_PREEMPT voluntary.=20


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Wednesday, March 11, 2015 7:47 PM
To: R, Karthik
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago 1/2] packagegroup-*-graphics: Add oma=
pdrm-pvr

This doesn't work:

| /home/jenkins/tisdk-build-am57x/build-CORTEX_1/arago-tmp-external-linaro-=
toolchain/work/am57xx_evm-oe-linux-gnueabi/omapdrm-pvr/1.9.2253347-r6c/git/=
eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services=
4/srvkm/env/linux/osfunc.c:116:2: error: #error "A preemptible Linux kernel=
 is required when using workqueues"


Also I see these messages, but I don't think they are fatal:

| ../config/core.mk:419: $(KERNELDIR)/vmlinux does not exist. Kbuild may fa=
il.
| /bin/sh: dos2unix: command not found

--=20
Denys


On Wed, Mar 11, 2015 at 05:18:57PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroup-arago-tisdk-graphics.bb           |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-graphics.bb
> index f854596..1043ce5 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
> @@ -38,9 +38,8 @@ GRAPHICS_RDEPENDS_omap3 =3D "\
>  GRAPHICS_RDEPENDS_omap-a15 =3D "\
>      libgbm \
>      omap5-sgx-ddk-um-linux \
> +    omapdrm-pvr \
>      "
> -# Put this back when compile issues are fixed against 3.14
> -#    omapdrm-pvr
> =20
>  GRAPHICS_BLTSVILLE =3D ""
>  GRAPHICS_BLTSVILLE_omap-a15 =3D " \
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

