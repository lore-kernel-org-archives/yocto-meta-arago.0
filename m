Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E0897529F9
	for <meta-arago@arago-project.org>;
	Fri,  9 Mar 2018 15:31:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w29FUo2Q031558
	for <meta-arago@arago-project.org>; Fri, 9 Mar 2018 09:30:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520609450;
	bh=y7aHq06VB25fkpnHQ1DG5ROJqMTLe7hgqMEOC+FuJMo=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Ek5v7mM2KKp8bMVV1Rqi8vY5SpB3KB8mmpN1kWh+7qMe7ehrRkW/LxUqXok90Fojo
	lFGDi0dRtYa6egOStSMF3KySKC3ntQP1NDTagKN7DNnhfWMjtdyUV9e5axt2j/7ghz
	JxcLYiIktXVRVBWq79qzocfGbhpiPlx/B+FfxCYk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w29FUovi026893
	for <meta-arago@arago-project.org>; Fri, 9 Mar 2018 09:30:50 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 9 Mar 2018 09:30:50 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1261.035; Fri, 9 Mar 2018 09:30:50 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/rocko/master] [PATCH] matrix-gui-apps-git:
	bump SRCREV for fixes
Thread-Index: AQHTtmcAJYjhU9R97UChSJH6DftUhaPICk0g
Date: Fri, 9 Mar 2018 15:30:50 +0000
Message-ID: <10482baca2ea4336af0734b86c2cc8e9@ti.com>
References: <1520463157-12324-1-git-send-email-a0271529@ti.com>
In-Reply-To: <1520463157-12324-1-git-send-email-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.131]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [morty/rocko/master] [PATCH] matrix-gui-apps-git: bump SRCREV for fixes
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
X-List-Received-Date: Fri, 09 Mar 2018 15:31:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping...

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Wednesday, March 07, 2018 5:53 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [morty/rocko/master] [PATCH] matrix-gui-apps-git:
> bump SRCREV for fixes
>=20
> * browser_chromium: fix runGoogleChrome.sh
> * runGoogleChrome: fix line endings
> * ivahd_multimedia_h264dec: update the audio sink for AM5 IDKs
>=20
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 2d93b34..ff90a66 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D
> "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>=20
>  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "094736065e1a15a49da19ef4c5a100aa763c41d1"
> +SRCREV =3D "2ef38ec90f2523f138fb54f11f9a895145d88522"
>  BRANCH =3D "master"
> -INC_PR =3D "r50"
> +INC_PR =3D "r51"
>=20
>  # Pull in the base package for installing matrix applications  require m=
atrix-
> gui-apps.inc
> --
> 1.9.1


