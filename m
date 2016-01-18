Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DDDEA52993
	for <meta-arago@arago-project.org>;
	Mon, 18 Jan 2016 15:40:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0IFeYqR003554
	for <meta-arago@arago-project.org>; Mon, 18 Jan 2016 09:40:34 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0IFeYhx032469
	for <meta-arago@arago-project.org>; Mon, 18 Jan 2016 09:40:34 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 18 Jan 2016 09:40:34 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [oe-layersetup] [PATCH] configs: Add
	processor-sdk-02.00.01.07-config
Thread-Index: AQHRT7JKTEM77LzJEEmVhwSsxiB69Z8Bba+g
Date: Mon, 18 Jan 2016 15:40:34 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B4A5BF@DLEE08.ent.ti.com>
References: <1452875531-11989-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1452875531-11989-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [oe-layersetup] [PATCH] configs: Add processor-sdk-02.00.01.07-config
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
X-List-Received-Date: Mon, 18 Jan 2016 15:40:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Friday, January 15, 2016 11:32 AM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [oe-layersetup] [PATCH] configs: Add processor-sdk-
> 02.00.01.07-config
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../processor-sdk-02.00.01.07-config.txt}                        | 9 +++=
++----
>  1 file changed, 5 insertions(+), 4 deletions(-)  copy configs/{coresdk/c=
oresdk-
> 2015.02-config.txt =3D> processor-sdk/processor-sdk-02.00.01.07-config.tx=
t}
> (55%)
>=20
> diff --git a/configs/coresdk/coresdk-2015.02-config.txt b/configs/process=
or-
> sdk/processor-sdk-02.00.01.07-config.txt
> similarity index 55%
> copy from configs/coresdk/coresdk-2015.02-config.txt
> copy to configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
> index d6e8515..ea969c5 100644
> --- a/configs/coresdk/coresdk-2015.02-config.txt
> +++ b/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
> @@ -2,11 +2,12 @@
>  # repo name,repo uri,repo branch,repo
> commit[,layers=3Dlayer1:layer2...:layern]
>=20
>=20
> bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465
> f0c5a2a937b4c4a4c,layers=3D
> -meta-arago,git://arago-project.org/git/meta-
> arago.git,master,ti2015.02,layers=3Dmeta-arago-distro:meta-arago-extras
> -meta-qt5,git://github.com/meta-qt5/meta-
> qt5.git,jethro,0454fb083c38f2155a8be3b61930ad1ddf995695,layers=3D
> +meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-
> +sdk.git,master,12c6ff170389762b6f7f7bf290cd26bfa316cf47,layers=3D
> +meta-arago,git://arago-project.org/git/meta-arago.git,master,b1bf5b6385
> +67cd5be269c5968931de8deeac0c80,layers=3Dmeta-arago-distro:meta-arago-
> extr
> +as
> +meta-qt5,git://github.com/meta-qt5/meta-
> qt5.git,master,97ce05c0b2a81f05
> +388d7f727741529fb9177775,layers=3D
>  meta-openembedded,git://git.openembedded.org/meta-
> openembedded,fido,df2f700d66bace65f5d802225232d01cf511fe81,layers=3Dm
> eta-networking:meta-ruby:meta-python:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.02,layers=3D
> +meta-ti,git://arago-project.org/git/meta-ti.git,fido,3b27c871dbf67497ea
> +9a953fe3fa0f819c6e41c9,layers=3D
>  meta-linaro,git://git.linaro.org/openembedded/meta-
> linaro.git,fido,08a46787862966f2236c5a9b3eb4d4ec68263593,layers=3Dmeta-
> linaro-toolchain
>  oe-core,git://git.openembedded.org/openembedded-
> core,fido,9f339f516ab03d598fae0e536b3a420ea4d8ee1a,layers=3Dmeta
>  OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-processor-sdk-64.conf.sample
> --
> 1.9.1


