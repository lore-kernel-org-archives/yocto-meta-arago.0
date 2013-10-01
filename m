Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A5973529A7
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:38:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DcwcB019085;
	Tue, 1 Oct 2013 08:38:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DcwlT025759;
	Tue, 1 Oct 2013 08:38:58 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:38:58 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 01/13] arago-dylan-config: add
	meta-qt5/master and dependency on meta-ruby from meta-oe
Thread-Index: AQHOvnWBShLkMy95nUS6nlnqnbQ0jpnf2j5l
Date: Tue, 1 Oct 2013 13:38:57 +0000
Message-ID: <4A108B9F-2318-433C-AD91-09D666643367@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-2-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 01/13] arago-dylan-config: add meta-qt5/master and dependency on meta-ruby from meta-oe
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
X-List-Received-Date: Tue, 01 Oct 2013 13:39:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack. I'm hoping ruby doesn't need to be installed on the fs for Qt to run.

> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> configs/arago-dylan-config.txt | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/configs/arago-dylan-config.txt b/configs/arago-dylan-config.=
txt
> index 59055bd..f5fb666 100644
> --- a/configs/arago-dylan-config.txt
> +++ b/configs/arago-dylan-config.txt
> @@ -3,7 +3,8 @@
>=20
> bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b8737=
9bf629066f6662458,layers=3D
> meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEA=
D,layers=3Dtoolchain-layer:meta-networking:meta-oe
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=3D
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEA=
D,layers=3Dtoolchain-layer:meta-networking:meta-ruby:meta-oe
> meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=3D
> meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,=
layers=3Dmeta-linaro-toolchain
> oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=3D=
meta
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

