Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B271D52998
	for <meta-arago@arago-project.org>;
	Wed, 23 Apr 2014 20:30:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3NKU74M031909;
	Wed, 23 Apr 2014 15:30:07 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3NKU65s008930;
	Wed, 23 Apr 2014 15:30:07 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 23 Apr 2014 15:30:05 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [oe-layersetup][PATCH 0/5] RFC: cleanup and
	remove	denzil configs
Thread-Index: AQHPXyxADBNTgn71VU+ydmkgLWXVAJsfo2VQ
Date: Wed, 23 Apr 2014 20:30:04 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C68D7F2@DFLE08.ent.ti.com>
References: <1398282148-11547-1-git-send-email-denis@denix.org>
In-Reply-To: <1398282148-11547-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [oe-layersetup][PATCH 0/5] RFC: cleanup and remove	denzil configs
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
X-List-Received-Date: Wed, 23 Apr 2014 20:30:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, April 23, 2014 2:42 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [oe-layersetup][PATCH 0/5] RFC: cleanup and remove
> denzil configs
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> RFC: Remove some cruft of old denzil configs.
>=20
> I would have left amsdk* and mcsdk* configs alone, if they didn't referen=
ce
> other config files in sample-files/, which I would like to clean up mostl=
y.
[Franklin] So how about subdirectories in sample-files for each maintenance=
 branch?

I wouldn't mind deleting the generic arago config files from old maintenanc=
e branches since most of the time people really care about the sdk specific=
 config files.
>=20
> This repository is not tagged, but used as a BOM-reference for old releas=
e
> configs. Do we need to preserve those files some other place?
>=20
> Other alternatives for preserving the configs are:
> * in a separate "old/deprecated" branch
> * in a sub-directory of a similar name
> * tagging the repo before removal
[Franklin] I envisioned oe-layersetup as a way that you can simply rebuild =
any sdk no matter how old by simply swapping out config files. So I would p=
refer a sub-directory approach instead of a branch or tagging approach sinc=
e that will add complexity for users.
>=20
> Denys Dmytriyenko (5):
>   bblayers-denzil: remove denzil-specific bblayers file, deprecated
>   local-arago-linaro.conf: remove denzil-specific version setting Linaro
>     TC
>   mcsdk-03.00.00.xx: remove old denzil-based configs
>   arago-denzil-config: remove denzil-specific config
>   amsdk-05.06.00.00: remove denzil-specific config
>=20
>  configs/amsdk/amsdk-05.06.00.00-config.txt  |  10 --
>  configs/arago-denzil-config.txt             |  11 --
>  configs/mcsdk/mcsdk-03.00.00.03-config.txt  |  10 --  configs/mcsdk/mcsd=
k-
> 03.00.00.05-config.txt  |  11 --  configs/mcsdk/mcsdk-03.00.00.06-config.=
txt  |
> 11 --  configs/mcsdk/mcsdk-03.00.00.07-config.txt  |  11 --
>  sample-files/bblayers-denzil.conf.sample    |   9 --
>  sample-files/local-arago-linaro.conf.sample | 160 ----------------------=
------
>  8 files changed, 233 deletions(-)
>  delete mode 100644 configs/amsdk/amsdk-05.06.00.00-config.txt
>  delete mode 100644 configs/arago-denzil-config.txt  delete mode 100644
> configs/mcsdk/mcsdk-03.00.00.03-config.txt
>  delete mode 100644 configs/mcsdk/mcsdk-03.00.00.05-config.txt
>  delete mode 100644 configs/mcsdk/mcsdk-03.00.00.06-config.txt
>  delete mode 100644 configs/mcsdk/mcsdk-03.00.00.07-config.txt
>  delete mode 100644 sample-files/bblayers-denzil.conf.sample
>  delete mode 100644 sample-files/local-arago-linaro.conf.sample
>=20
> --
> 1.9.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

