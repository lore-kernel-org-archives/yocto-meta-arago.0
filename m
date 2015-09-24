Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1A25F529C8
	for <meta-arago@arago-project.org>;
	Thu, 24 Sep 2015 15:17:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8OFH8fR011044
	for <meta-arago@arago-project.org>; Thu, 24 Sep 2015 10:17:08 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8OFH8KB010503
	for <meta-arago@arago-project.org>; Thu, 24 Sep 2015 10:17:08 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 24 Sep 2015 10:17:08 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] branding-processor-sdk: set
	PREFERRED_VERSION for dspdce-fw
Thread-Index: AQHQ8mJnrqo3gf3iukuWdVqT+TNGrp5L0pgA
Date: Thu, 24 Sep 2015 15:17:08 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926AC43B9@DLEE08.ent.ti.com>
References: <1442615762-28197-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1442615762-28197-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] branding-processor-sdk: set PREFERRED_VERSION for dspdce-fw
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
X-List-Received-Date: Thu, 24 Sep 2015 15:17:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch is no longer needed since dspdce-fw now only includes recipe to =
recompile the firmware from git source.
http://patchwork.dal.design.ti.com/patch/16731/

Thanks,
Hongmei

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Friday, September 18, 2015 6:36 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [PATCH] branding-processor-sdk: set
> PREFERRED_VERSION for dspdce-fw
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/branding-processor-
> sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.in=
c
> index 3ef3009..b973322 100644
> --- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> @@ -40,3 +40,6 @@ SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging =3D "400"
>=20
>  SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging =3D "processor-sdk-1.0"
>  SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging =3D
> "${SRCIPK_GIT_COMMIT_MESSAGE}"
> +
> +# Set PREFERRED_VERSION of dspdce to choose recompiling firmware from
> +git source PREFERRED_VERSION_dspdce-fw =3D "1.00.00.%+git%"
> --
> 1.9.1


