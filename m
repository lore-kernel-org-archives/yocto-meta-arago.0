Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B997752972
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2019 19:45:21 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61JiaFe059139
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 14:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562010276;
	bh=bj8veHKjBFU/Fhy1yd2s5QAFsOb6NSX7mEiCijNXizs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Q6kNKuxDCyyiYAZaNf6AFYiqIxAWvDpSulN6LRylKj00/5X/vv6e2wt1072QDqrQE
	oBuUNv0C5cfxQgF108QHEBaIysxwVoCsnsoPJb1YsUyKAKdai+uDgOSobbS1JMOyU3
	zvjrhFSySuaYAmGPuZnRW0wnOIIw6Sugs/nbhzs4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61JiaPI079249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 14:44:36 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 1 Jul 2019 14:44:36 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
	15.01.1713.004; Mon, 1 Jul 2019 14:44:36 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Tammana, Gowtham" <g-tammana@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago][thud][PATCH 1/3] arago-prefs: Specify gbm provider
	for J7
Thread-Index: AQHVLjR28ZZLFZBWPEaz+JV3zkiTTaa2Lk8w
Date: Mon, 1 Jul 2019 19:44:36 +0000
Message-ID: <01736aa0fb904ba99ccebbd22ca8d2d5@ti.com>
References: <20190629043954.7786-1-g-tammana@ti.com>
In-Reply-To: <20190629043954.7786-1-g-tammana@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.208]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [thud][PATCH 1/3] arago-prefs: Specify gbm provider for J7
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
X-List-Received-Date: Mon, 01 Jul 2019 19:45:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ERROR: Nothing PROVIDES 'libgbm' (but /OE/arago-thud-next-build/sources/met=
a-arago/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb DEPENDS=
 on or otherwise requires it)
libgbm was skipped: PREFERRED_PROVIDER_virtual/libgbm set to ti-img-rogue-u=
mlibs, not libgbm
NOTE: Runtime target 'kmscube' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['kmscube', 'libgbm']


> -----Original Message-----
> From: Tammana, Gowtham
> Sent: Saturday, June 29, 2019 12:40 AM
> To: meta-arago@arago-project.org; Dmytriyenko, Denys
> Cc: Balagopalakrishnan, Anand; Ruei, Eric; Tammana, Gowtham
> Subject: [meta-arago][thud][PATCH 1/3] arago-prefs: Specify gbm provider =
for
> J7
>=20
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 939569c0..0f961322 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -23,8 +23,12 @@ PREFERRED_PROVIDER_virtual/gpudriver_j7-evm =3D "ti-
> img-rogue-driver"
>  PREFERRED_PROVIDER_virtual/libgl =3D "mesa-gl"
>=20
>  # GBM (Generic Buffer Management) preferences
> -PREFERRED_PROVIDER_libgbm =3D "libgbm"
> -PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"
> +PREFERRED_PROVIDER_virtual/libgbm =3D "libgbm"
> +PREFERRED_PROVIDER_virtual/libgbm-dev =3D "libgbm-dev"
> +
> +# J7 gbm provider
> +PREFERRED_PROVIDER_virtual/libgbm_j7-evm =3D "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgbm-dev_j7-evm =3D "ti-img-rogue-umlibs-
> dev"
>=20
>  # This is required when using keystone devices with graphical support
>  # such as Qt5
> --
> 2.22.0


