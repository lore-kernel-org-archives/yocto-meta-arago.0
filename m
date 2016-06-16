Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 46C08529F3
	for <meta-arago@arago-project.org>;
	Thu, 16 Jun 2016 13:44:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5GDhYnJ001929
	for <meta-arago@arago-project.org>; Thu, 16 Jun 2016 08:43:34 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5GDi2Xm006488
	for <meta-arago@arago-project.org>; Thu, 16 Jun 2016 08:44:03 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 16 Jun 2016 08:44:03 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/4] meta-toolchain-arago: do devkit
	fixups first in postprocess list
Thread-Index: AQHRxriZ1NwLifeSOEaVe6zE/+vMIZ/sG8Mw
Date: Thu, 16 Jun 2016 13:44:02 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142BAA78@DFLE09.ent.ti.com>
References: <1465977060-3376-1-git-send-email-denys@ti.com>
	<1465977060-3376-4-git-send-email-denys@ti.com>
In-Reply-To: <1465977060-3376-4-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] meta-toolchain-arago: do devkit fixups first in postprocess list
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
X-List-Received-Date: Thu, 16 Jun 2016 13:44:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

This patch set resolves to devkit toolchain and target toolchain issues.=20

Can this be also be applied to a 2016.01 release branch?

Thank you,
Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Wednesday, June 15, 2016 3:51 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 4/4] meta-toolchain-arago: do devkit fixups
> first in postprocess list
>=20
> Otherwise devkit packaging happens before fixups are done.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 749085b..014bc76 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -64,7 +64,7 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"' >> $script
> }
>=20
> -SDK_POSTPROCESS_COMMAND +=3D "arago_sdk_fixup; "
> +SDK_POSTPROCESS_COMMAND_prepend =3D "arago_sdk_fixup; "
>=20
>  arago_sdk_fixup () {
>  	# Remove broken .la files
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

