Return-Path: <manisha.agrawal@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 940C8529B0
	for <meta-arago@arago-project.org>;
	Wed, 13 Feb 2019 01:50:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1D1oIKW071331
	for <meta-arago@arago-project.org>; Tue, 12 Feb 2019 19:50:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550022618;
	bh=oWpFjkwYIAXTWg2P3mDxjvBiWmVq806ThUrIgQ9JC6I=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=g83mQH7awPnPFJUtVJh4MAj2fHJ9ss0BZacRFoYqzr+LGW87/obKsNo1sO1qFHsS1
	Z+0KBIvV9lU6JltgKEw/+FyTzHrjEpySyf2wcaojmj8Qo521OKstO8/nubcupgW/Et
	m5HU7RlyB+KtnnxlKg7Wpw2ITqEzkSg98SyhPzc8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1D1oITQ012217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 12 Feb 2019 19:50:18 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 12 Feb 2019 19:50:17 -0600
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
	DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
	15.01.1591.008; Tue, 12 Feb 2019 19:50:17 -0600
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago][rocko/master][PATCH v1] matrix-gui-apps: bump
	SRCREV to get the mmwavegesture-hmi changes
Thread-Index: AQHUvLEUeXR9OdZSjEaxOcErtpgQD6XdZ66A//+bzFA=
Date: Wed, 13 Feb 2019 01:50:17 +0000
Message-ID: <82f44a5d2e2b4a1c8bfe4d3c44b86909@ti.com>
References: <20190204174300.13373-1-manisha.agrawal@ti.com>
	<20190213014839.GA4386@beryl>
In-Reply-To: <20190213014839.GA4386@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.59.86]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCH v1] matrix-gui-apps: bump SRCREV to get the mmwavegesture-hmi changes
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
X-List-Received-Date: Wed, 13 Feb 2019 01:50:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I didn't understand the comment.

Regards,
Manisha

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, February 12, 2019 7:49 PM
To: Agrawal, Manisha
Cc: meta-arago@arago-project.org; Stiffler, Jacob; Gou, Hongmei
Subject: Re: [meta-arago][rocko/master][PATCH v1] matrix-gui-apps: bump SRC=
REV to get the mmwavegesture-hmi changes

On Mon, Feb 04, 2019 at 11:43:00AM -0600, Manisha Agrawal wrote:
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index d74f889..1781134 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb2=
5f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
> =20
>  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;proto=
col=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "20f1f86c7b8ec9e1ccc52953fb2a9bac74e23efd"
> +SRCREV =3D "94e9f17332065fa838d9334efdab8451c8119b8d"
>  BRANCH =3D "master"
> -INC_PR =3D "r64"
> -
> +INC_PR =3D "r65"
> +i

^^^^ ???


>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> --=20
> 2.13.0
>=20

