Return-Path: <anandb@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 52A1852A80
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 05:45:59 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C5jvVs020952
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 00:45:58 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C5jr9Q028511
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 11:15:55 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 11:15:53 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Chengalvala, Vivek" <vchengalvala@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-arago] [meta-arago 1/2] packagegroup-*-graphics: Add
	omapdrm-pvr
Thread-Index: AQHQXFW+WVDfWWeFXUOtFaTUMRhbm50YFC+ggABAAzo=
Date: Thu, 12 Mar 2015 05:45:52 +0000
Message-ID: <05CF4794C98B244ABDC620C10903762272FB05A7@DBDE04.ent.ti.com>
References: <1426074538-21653-1-git-send-email-a0393906@ti.com>
	<20150311234718.GC23587@edge>,
	<FCB36D0BED1F0D4EA8E6242507E4245B0C8827C7@DFLE08.ent.ti.com>
In-Reply-To: <FCB36D0BED1F0D4EA8E6242507E4245B0C8827C7@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.52]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Mar 2015 22:55:58 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Thu, 12 Mar 2015 05:45:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I believe the second message is because kernel has not been built before om=
apdrm-pvr.=0A=
=0A=
The first message is due to config_preempt. Nevertheless, the current versi=
on/recipe in meta-arago also requires config_preempt. I am not sure how the=
 current version has been accepted.=0A=
=0A=
As Vivek said, I am looking at enabling SGX for config_preempt_voluntary. =
=0A=
=0A=
Regards,=0A=
Anand=0A=
________________________________________=0A=
From: Chengalvala, Vivek=0A=
Sent: Thursday, March 12, 2015 7:19 AM=0A=
To: Dmytriyenko, Denys; R, Karthik=0A=
Cc: meta-arago@arago-project.org; Balagopalakrishnan, Anand=0A=
Subject: RE: [meta-arago] [meta-arago 1/2] packagegroup-*-graphics: Add oma=
pdrm-pvr=0A=
=0A=
+Anand=0A=
=0A=
Anand is trying to get Graphics to work with CONFIG_PREEMPT voluntary.=0A=
=0A=
=0A=
-----Original Message-----=0A=
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys=0A=
Sent: Wednesday, March 11, 2015 7:47 PM=0A=
To: R, Karthik=0A=
Cc: meta-arago@arago-project.org=0A=
Subject: Re: [meta-arago] [meta-arago 1/2] packagegroup-*-graphics: Add oma=
pdrm-pvr=0A=
=0A=
This doesn't work:=0A=
=0A=
| /home/jenkins/tisdk-build-am57x/build-CORTEX_1/arago-tmp-external-linaro-=
toolchain/work/am57xx_evm-oe-linux-gnueabi/omapdrm-pvr/1.9.2253347-r6c/git/=
eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services=
4/srvkm/env/linux/osfunc.c:116:2: error: #error "A preemptible Linux kernel=
 is required when using workqueues"=0A=
=0A=
=0A=
Also I see these messages, but I don't think they are fatal:=0A=
=0A=
| ../config/core.mk:419: $(KERNELDIR)/vmlinux does not exist. Kbuild may fa=
il.=0A=
| /bin/sh: dos2unix: command not found=0A=
=0A=
--=0A=
Denys=0A=
=0A=
=0A=
On Wed, Mar 11, 2015 at 05:18:57PM +0530, Karthik Ramanan wrote:=0A=
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>=0A=
> ---=0A=
>  .../packagegroup-arago-tisdk-graphics.bb           |    3 +--=0A=
>  1 file changed, 1 insertion(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-graphics.bb=0A=
> index f854596..1043ce5 100644=0A=
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb=0A=
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb=0A=
> @@ -38,9 +38,8 @@ GRAPHICS_RDEPENDS_omap3 =3D "\=0A=
>  GRAPHICS_RDEPENDS_omap-a15 =3D "\=0A=
>      libgbm \=0A=
>      omap5-sgx-ddk-um-linux \=0A=
> +    omapdrm-pvr \=0A=
>      "=0A=
> -# Put this back when compile issues are fixed against 3.14=0A=
> -#    omapdrm-pvr=0A=
>=0A=
>  GRAPHICS_BLTSVILLE =3D ""=0A=
>  GRAPHICS_BLTSVILLE_omap-a15 =3D " \=0A=
> --=0A=
> 1.7.9.5=0A=
>=0A=
> _______________________________________________=0A=
> meta-arago mailing list=0A=
> meta-arago@arago-project.org=0A=
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=0A=
_______________________________________________=0A=
meta-arago mailing list=0A=
meta-arago@arago-project.org=0A=
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=0A=

