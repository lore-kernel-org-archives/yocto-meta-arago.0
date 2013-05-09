Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EBC68529A8
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2013 14:14:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r49EE5QL030656
	for <meta-arago@arago-project.org>; Thu, 9 May 2013 09:14:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r49EE5dL008799
	for <meta-arago@arago-project.org>; Thu, 9 May 2013 09:14:05 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 9 May 2013 09:14:04 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] Added initscript-debugfs to the
	server-extra packagegroup list
Thread-Index: AQHOTDueEGou62dwdk2W8f7JFqnbSpj85nAQ
Date: Thu, 9 May 2013 14:14:03 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015954D719@DLEE11.ent.ti.com>
References: <1368052202-30076-1-git-send-email-zhoujt@ti.com>
	<1368052202-30076-2-git-send-email-zhoujt@ti.com>
In-Reply-To: <1368052202-30076-2-git-send-email-zhoujt@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Added initscript-debugfs to the	server-extra packagegroup list
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
X-List-Received-Date: Thu, 09 May 2013 14:14:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhou, Jingting
> Sent: Wednesday, May 08, 2013 5:30 PM
> To: meta-arago@arago-project.org
> Cc: Zhou, Jingting
> Subject: [meta-arago] [PATCH 2/2] Added initscript-debugfs to the
> server-extra packagegroup list
>=20
> From: Jingting Zhou <zhoujt@ti.com>
>=20
> Signed-off-by: Jingting Zhou <zhoujt@ti.com>
> ---
>  .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> index 46db7c2..dfc78c2 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Additional packages beyond console packages
> shared by TI SDKs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> -PR =3D "r7"
> +PR =3D "r8"
>=20
>  inherit packagegroup
>=20
> @@ -95,4 +95,5 @@ RDEPENDS_${PN} =3D "\
>      ti-netapi \
>      ti-ipc \
>      ebtables \
> +    initscript-debugfs \
>  	"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

