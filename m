Return-Path: <sajesh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 34B40529D9
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 16:34:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48GYCux004634
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 11:34:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48GYCXl016022
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 11:34:12 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 8 May 2013 11:34:11 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] multiprocmgr: recipe update for external
	git and mpm changes
Thread-Index: AQHOS39SD3t/S+WfskuEF7KoKsc+35j6ydQA///Az2eAAPGUsA==
Date: Wed, 8 May 2013 16:34:10 +0000
Message-ID: <8EAE6244CE843044A42356038645C855156EF442@DFLE12.ent.ti.com>
References: <1367971342-12085-1-git-send-email-sajesh@ti.com>,
	<20130508005349.GM12982@edge>
	<8EAE6244CE843044A42356038645C855156EF043@DFLE12.ent.ti.com>
In-Reply-To: <8EAE6244CE843044A42356038645C855156EF043@DFLE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] multiprocmgr: recipe update for external git and mpm changes
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
X-List-Received-Date: Wed, 08 May 2013 16:34:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> +RDEPENDS =3D "syslog-ng"
What is the run-time dependency on syslog-ng here?

The mpm daemon uses prints out syslog messages.

Regards,
Sajesh


-----Original Message-----
From: Saran, Sajesh Kumar=20
Sent: Tuesday, May 07, 2013 10:11 PM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] multiprocmgr: recipe update for external =
git and mpm changes

I had a requirement to rename the recipe to make in consistent as it is mos=
tly a platform specific product.

Regards,
Sajesh

________________________________________
From: Dmytriyenko, Denys
Sent: Tuesday, May 07, 2013 8:53 PM
To: Saran, Sajesh Kumar
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] multiprocmgr: recipe update for external =
git and mpm changes

On Tue, May 07, 2013 at 08:02:22PM -0400, Sajesh Kumar Saran wrote:
> the recipe is renamed to ti-multiprocmgr

We've been there before:
http://arago-project.org/pipermail/meta-arago/2013-February/000878.html

While it is probably not very critical, I still think we should not abuse t=
i- prefix that much. At some point we had every own recipe starting with ti=
- and there were a lot of them. It is just redundant at a minimum...


> and updated to support
> mpm daemon and kernel dependancies.
>
> Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
> ---
>  .../recipes-bsp/multiprocmgr/multiprocmgr_git.bb   |   20 ----------
>  .../ti-multiprocmgr/ti-multiprocmgr_git.bb         |   42 ++++++++++++++=
++++++
>  2 files changed, 42 insertions(+), 20 deletions(-)  delete mode=20
> 100644 meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
>  create mode 100644=20
> meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_git.bb

Please use -M flag for git-format-patch to detect renames, so it would look=
 like a patch/diff instead of removing old file and adding a new one.


> diff --git=20
> a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb=20
> b/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
> deleted file mode 100644
> index 3f2e52c..0000000
> --- a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION =3D "TI Multiproc Manager for KeyStone II"
> -HOMEPAGE =3D "http://gtgit01.gt.design.ti.com/git/?p=3Dprojects/multipro=
cmgr.git;a=3Dsummary"
> -LICENSE =3D "BSD & MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfce208c498eb9669223724dc9=
c1d8fe4"
> -SECTION =3D "console"
> -COMPATIBLE_MACHINE =3D "keystone"
> -
> -PR =3D "r1"
> -
> -BRANCH ?=3D "master"
> -SRCREV =3D "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
> -
> -SRC_URI =3D "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.gi=
t;protocol=3Dgit;branch=3D${BRANCH}"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -     install -d ${D}${bindir}/
> -     install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
> -}
> diff --git=20
> a/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_git.bb=20
> b/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_git.bb
> new file mode 100644
> index 0000000..951dc3c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_gi
> +++ t.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION =3D "TI Multiproc Manager for KeyStone II"
> +HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-linux/multi-proc-=
manager.git"

That is a good name used for the repository name! Why not match it instead?


> +LICENSE =3D "BSD & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfce208c498eb9669223724dc9=
c1d8fe4"
> +SECTION =3D "console"
> +COMPATIBLE_MACHINE =3D "keystone"
> +
> +DEPENDS =3D "libdaemon virtual/kernel"
> +RDEPENDS =3D "syslog-ng"

What is the run-time dependency on syslog-ng here?


> +PR =3D "r6"
> +
> +BRANCH ?=3D "master"
> +SRCREV =3D "${AUTOREV}"

You're abusing AUTOREV here - there were only ~35 commits total in 6 month!
Just use the specific commit ID, it doesn't seem to change too often.


> +SRC_URI =3D "git://git.ti.com/keystone-linux/multi-proc-manager.git;prot=
ocol=3Dgit;branch=3D${BRANCH}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +CC +=3D "-I${STAGING_KERNEL_DIR}/include"
> +
> +INITSCRIPT_NAME =3D "mpmsrv-daemon.sh"
> +INITSCRIPT_PARAMS =3D "defaults 10"
> +
> +inherit update-rc.d
> +
> +do_install() {
> +     install -d ${D}${bindir}/
> +     install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
> +     install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
> +
> +     install -d ${D}${sysconfdir}/init.d/
> +     install -c -m 755 ${S}/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${=
INITSCRIPT_NAME}
> +     install -d ${D}${sysconfdir}/mpm/
> +     install -c -m 755 ${S}/mpm_config.json=20
> + ${D}${sysconfdir}/mpm/mpm_config.json
> +
> +     install -d ${D}${includedir}/
> +     install -c -m 755 ${S}/include/* ${D}${includedir}/
> +
> +     install -d ${D}${libdir}/
> +     install -c -m 755 ${S}/lib/* ${D}${libdir}/ }
> --
> 1.7.9.5
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

