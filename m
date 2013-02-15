Return-Path: <sajesh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AD21452A79
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 01:34:17 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1F1YGPu005316
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 19:34:16 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1F1YGQ2014167
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 19:34:16 -0600
Received: from DLEE08.ent.ti.com ([fe80::8145:89a6:94e5:8cad]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 14 Feb 2013 19:34:16 -0600
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] Added ti-multiproc manager recipe for
	KeyStone2 devices
Thread-Index: AQHOCwKmJHRPo1g1hku4Ah9BSvGQSZh6g+wA//+eBcA=
Date: Fri, 15 Feb 2013 01:34:15 +0000
Message-ID: <8EAE6244CE843044A42356038645C8551564C358@DLEE08.ent.ti.com>
References: <1360880920-24652-1-git-send-email-sajesh@ti.com>
	<20130215012046.GC9154@denix.org>
In-Reply-To: <20130215012046.GC9154@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] Added ti-multiproc manager recipe for KeyStone2 devices
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
X-List-Received-Date: Fri, 15 Feb 2013 01:34:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The internal git repo is temporary. It will be moved to external soon.

What do you want me to put in instead of AUTOREV?

Regards,
Sajesh


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, February 14, 2013 8:21 PM
To: Saran, Sajesh Kumar
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] Added ti-multiproc manager recipe for Key=
Stone2 devices

Sajesh,

Thanks for submitting your patch to the list. It mostly looks good, but her=
e are few comments:

[PATCH] Added ti-multiproc manager recipe for KeyStone2 devices

Please follow the OpenEmbedded Patch Message Guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Basically, it means the commit/patch subject should look like this:

[PATCH] multiprocmgr: add initial version


On Thu, Feb 14, 2013 at 05:28:40PM -0500, Sajesh Kumar Saran wrote:
>=20
> Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
> ---
>  .../multiprocmgr/ti-multiprocmgr_git.bb            |   19 ++++++++++++++=
+++++
>  1 file changed, 19 insertions(+)
>  create mode 100644=20
> meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb
>=20
> diff --git=20
> a/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.
> bb=20
> b/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.
> bb
> new file mode 100644
> index 0000000..c72bc7d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_
> +++ git.bb

I don't mind it too much, but do we still need to abuse ti-* prefix for our=
 own software? Can it be simply multiprocmgr?


> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "TI Multiproc Manager for KeyStone II"
> +HOMEPAGE =3D "http://gtgit01.gt.design.ti.com/git/?p=3Dprojects/multipro=
cmgr.git;a=3Dsummary"
> +LICENSE =3D "BSD & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfce208c498eb9669223724dc9=
c1d8fe4"
> +SECTION =3D "console"

If you really want this to be available to Keystone machines, you'd want:

COMPATIBLE_MACHINE =3D "keystone"


> +PR =3D "r2"

I don't usually complain about PR being out of sequence, or starting with 1=
=20
vs. 0, but other people may find this a problem. Just FYI...


> +BRANCH ?=3D "master"

> +SRCREV =3D "${AUTOREV}"
> +SRC_URI =3D "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.gi=
t;protocol=3Dgit;branch=3D${BRANCH}"

The use of AUTOREV and non-public internal git repository would break parsi=
ng=20
for anyone doing builds outside of TI network.

Using non-public internal git repository temporarily until you get your=20
project published externally is somewhat acceptable. And AUTOREV in rare ca=
ses=20
is also acceptable, although it's quite unstable. But definitely don't use=
=20
them both.


> +S =3D "${WORKDIR}/git"
> +
> +do_install() {
> +	install -d ${D}${bindir}/
> +	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
> +}
> --=20
> 1.7.9.5

