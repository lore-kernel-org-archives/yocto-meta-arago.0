Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4415F520EA
	for <meta-arago@arago-project.org>;
	Fri, 17 Oct 2014 19:08:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9HJ8pVe017759
	for <meta-arago@arago-project.org>; Fri, 17 Oct 2014 14:08:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9HJ8phx016720
	for <meta-arago@arago-project.org>; Fri, 17 Oct 2014 14:08:51 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 17 Oct 2014 14:08:50 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [oe-layersetup][PATCH] configs: Add release config
	mcsdk/mcsdk-03.01.01.04
Thread-Index: AQHP5xe8JuX+khJ3Fkext4ov83bTa5w0rVlg
Date: Fri, 17 Oct 2014 19:08:50 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905807631D@DLEE11.ent.ti.com>
References: <1413226732-25636-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1413226732-25636-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [oe-layersetup][PATCH] configs: Add release config mcsdk/mcsdk-03.01.01.04
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
X-List-Received-Date: Fri, 17 Oct 2014 19:08:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: Nelson, Sam
> Sent: Monday, October 13, 2014 2:59 PM
> To: meta-arago@arago-project.org
> Cc: Nelson, Sam
> Subject: [oe-layersetup][PATCH] configs: Add release config mcsdk/mcsdk-
> 03.01.01.04
>=20
> - Based on release config mcsdk/mcsdk-3.1.0-config.txt
>       with updated commit ids for mcsdk release 3.1.1
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  configs/mcsdk/mcsdk-03.01.01.04-config.txt |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 configs/mcsdk/mcsdk-03.01.01.04-config.txt
>=20
> diff --git a/configs/mcsdk/mcsdk-03.01.01.04-config.txt
> b/configs/mcsdk/mcsdk-03.01.01.04-config.txt
> new file mode 100644
> index 0000000..b894589
> --- /dev/null
> +++ b/configs/mcsdk/mcsdk-03.01.01.04-config.txt
> @@ -0,0 +1,14 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo
> commit[,layers=3Dlayer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b
> 87379bf629066f6662458,layers=3D
> +meta-mcsdk,git://arago-project.org/git/projects/meta-
> mcsdk.git,master,832a44b1821a8d509e3461aa03c41fa915fb640b,layers=3D
> +meta-arago,git://arago-project.org/git/meta-
> arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=3Dmeta-
> arago-distro:meta-arago-extras
> +meta-qt5,git://github.com/meta-qt5/meta-
> qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=3D
> +meta-openembedded,git://git.openembedded.org/meta-
> openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layer
> s=3Dtoolchain-layer:meta-networking:meta-ruby:meta-oe
> +meta-ti,git://arago-project.org/git/meta-
> ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=3D
> +meta-linaro,git://git.linaro.org/openembedded/meta-
> linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=3Dmeta-
> linaro-toolchain
> +meta-java,git://github.com/woglinde/meta-
> java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=3D
> +oe-core,git://git.openembedded.org/openembedded-
> core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=3Dmeta
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago.conf.sample
> --
> 1.7.9.5


