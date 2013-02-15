Return-Path: <sajesh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A000452A5A
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 03:32:03 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1F3W3wM014646
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 21:32:03 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1F3W3hj003293
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 21:32:03 -0600
Received: from DLEE08.ent.ti.com ([fe80::8145:89a6:94e5:8cad]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 14 Feb 2013 21:32:02 -0600
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] multiprocmgr: add initial version
Thread-Index: AQHOCyFmtGOFmJNdUEqTM46vHPny35h6pI2A//+fGpA=
Date: Fri, 15 Feb 2013 03:32:01 +0000
Message-ID: <8EAE6244CE843044A42356038645C8551564C3AC@DLEE08.ent.ti.com>
References: <1360894127-24242-1-git-send-email-sajesh@ti.com>
	<20130215031825.GD9154@denix.org>
In-Reply-To: <20130215031825.GD9154@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] multiprocmgr: add initial version
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
X-List-Received-Date: Fri, 15 Feb 2013 03:32:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cool.

Thanks.
Sajesh


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, February 14, 2013 10:18 PM
To: Saran, Sajesh Kumar
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] multiprocmgr: add initial version

On Thu, Feb 14, 2013 at 09:08:46PM -0500, Sajesh Kumar Saran wrote:
> This is an initial version of commit of multiproc manager.
> It adds support to download DSP images from ARM in KeyStone II=20
> devices.
>=20
> Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
> ---
>  .../multiprocmgr/multiprocmgr_git.bb               |   20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644=20
> meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb

I pushed it with one little change - moved it to meta-arago-extras/recipes-=
bsp

--
Denys


> diff --git a/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr=
_git.bb b/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.=
bb
> new file mode 100644
> index 0000000..3f2e52c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "TI Multiproc Manager for KeyStone II"
> +HOMEPAGE =3D "http://gtgit01.gt.design.ti.com/git/?p=3Dprojects/multipro=
cmgr.git;a=3Dsummary"
> +LICENSE =3D "BSD & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfce208c498eb9669223724dc9=
c1d8fe4"
> +SECTION =3D "console"
> +COMPATIBLE_MACHINE =3D "keystone"
> +
> +PR =3D "r1"
> +
> +BRANCH ?=3D "master"
> +SRCREV =3D "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
> +
> +SRC_URI =3D "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.gi=
t;protocol=3Dgit;branch=3D${BRANCH}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install() {
> +	install -d ${D}${bindir}/
> +	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
> +}
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

