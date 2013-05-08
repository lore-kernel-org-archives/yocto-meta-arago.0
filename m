Return-Path: <sajesh@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9097F52995
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 02:10:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r482AtJx011469
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 21:10:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r482AtwE021879
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 21:10:55 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 7 May 2013 21:10:55 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] multiprocmgr: recipe update for external
	git and mpm changes
Thread-Index: AQHOS39SD3t/S+WfskuEF7KoKsc+35j6ydQA///Az2c=
Date: Wed, 8 May 2013 02:10:54 +0000
Message-ID: <8EAE6244CE843044A42356038645C855156EF043@DFLE12.ent.ti.com>
References: <1367971342-12085-1-git-send-email-sajesh@ti.com>,
	<20130508005349.GM12982@edge>
In-Reply-To: <20130508005349.GM12982@edge>
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
X-List-Received-Date: Wed, 08 May 2013 02:10:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I had a requirement to rename the recipe to make in consistent as it is mos=
tly a platform specific product.=0A=
=0A=
Regards,=0A=
Sajesh=0A=
=0A=
________________________________________=0A=
From: Dmytriyenko, Denys=0A=
Sent: Tuesday, May 07, 2013 8:53 PM=0A=
To: Saran, Sajesh Kumar=0A=
Cc: meta-arago@arago-project.org=0A=
Subject: Re: [meta-arago] [PATCH] multiprocmgr: recipe update for external =
git and mpm changes=0A=
=0A=
On Tue, May 07, 2013 at 08:02:22PM -0400, Sajesh Kumar Saran wrote:=0A=
> the recipe is renamed to ti-multiprocmgr=0A=
=0A=
We've been there before:=0A=
http://arago-project.org/pipermail/meta-arago/2013-February/000878.html=0A=
=0A=
While it is probably not very critical, I still think we should not abuse t=
i-=0A=
prefix that much. At some point we had every own recipe starting with ti- a=
nd=0A=
there were a lot of them. It is just redundant at a minimum...=0A=
=0A=
=0A=
> and updated to support=0A=
> mpm daemon and kernel dependancies.=0A=
>=0A=
> Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>=0A=
> ---=0A=
>  .../recipes-bsp/multiprocmgr/multiprocmgr_git.bb   |   20 ----------=0A=
>  .../ti-multiprocmgr/ti-multiprocmgr_git.bb         |   42 ++++++++++++++=
++++++=0A=
>  2 files changed, 42 insertions(+), 20 deletions(-)=0A=
>  delete mode 100644 meta-arago-extras/recipes-bsp/multiprocmgr/multiprocm=
gr_git.bb=0A=
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-mult=
iprocmgr_git.bb=0A=
=0A=
Please use -M flag for git-format-patch to detect renames, so it would look=
=0A=
like a patch/diff instead of removing old file and adding a new one.=0A=
=0A=
=0A=
> diff --git a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.=
bb b/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb=0A=
> deleted file mode 100644=0A=
> index 3f2e52c..0000000=0A=
> --- a/meta-arago-extras/recipes-bsp/multiprocmgr/multiprocmgr_git.bb=0A=
> +++ /dev/null=0A=
> @@ -1,20 +0,0 @@=0A=
> -DESCRIPTION =3D "TI Multiproc Manager for KeyStone II"=0A=
> -HOMEPAGE =3D "http://gtgit01.gt.design.ti.com/git/?p=3Dprojects/multipro=
cmgr.git;a=3Dsummary"=0A=
> -LICENSE =3D "BSD & MIT"=0A=
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfce208c498eb9669223724dc9=
c1d8fe4"=0A=
> -SECTION =3D "console"=0A=
> -COMPATIBLE_MACHINE =3D "keystone"=0A=
> -=0A=
> -PR =3D "r1"=0A=
> -=0A=
> -BRANCH ?=3D "master"=0A=
> -SRCREV =3D "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"=0A=
> -=0A=
> -SRC_URI =3D "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.gi=
t;protocol=3Dgit;branch=3D${BRANCH}"=0A=
> -=0A=
> -S =3D "${WORKDIR}/git"=0A=
> -=0A=
> -do_install() {=0A=
> -     install -d ${D}${bindir}/=0A=
> -     install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv=0A=
> -}=0A=
> diff --git a/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmg=
r_git.bb b/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_gi=
t.bb=0A=
> new file mode 100644=0A=
> index 0000000..951dc3c=0A=
> --- /dev/null=0A=
> +++ b/meta-arago-extras/recipes-bsp/ti-multiprocmgr/ti-multiprocmgr_git.b=
b=0A=
> @@ -0,0 +1,42 @@=0A=
> +DESCRIPTION =3D "TI Multiproc Manager for KeyStone II"=0A=
> +HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-linux/multi-proc-=
manager.git"=0A=
=0A=
That is a good name used for the repository name! Why not match it instead?=
=0A=
=0A=
=0A=
> +LICENSE =3D "BSD & MIT"=0A=
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfce208c498eb9669223724dc9=
c1d8fe4"=0A=
> +SECTION =3D "console"=0A=
> +COMPATIBLE_MACHINE =3D "keystone"=0A=
> +=0A=
> +DEPENDS =3D "libdaemon virtual/kernel"=0A=
> +RDEPENDS =3D "syslog-ng"=0A=
=0A=
What is the run-time dependency on syslog-ng here?=0A=
=0A=
=0A=
> +PR =3D "r6"=0A=
> +=0A=
> +BRANCH ?=3D "master"=0A=
> +SRCREV =3D "${AUTOREV}"=0A=
=0A=
You're abusing AUTOREV here - there were only ~35 commits total in 6 month!=
=0A=
Just use the specific commit ID, it doesn't seem to change too often.=0A=
=0A=
=0A=
> +SRC_URI =3D "git://git.ti.com/keystone-linux/multi-proc-manager.git;prot=
ocol=3Dgit;branch=3D${BRANCH}"=0A=
> +=0A=
> +S =3D "${WORKDIR}/git"=0A=
> +=0A=
> +CC +=3D "-I${STAGING_KERNEL_DIR}/include"=0A=
> +=0A=
> +INITSCRIPT_NAME =3D "mpmsrv-daemon.sh"=0A=
> +INITSCRIPT_PARAMS =3D "defaults 10"=0A=
> +=0A=
> +inherit update-rc.d=0A=
> +=0A=
> +do_install() {=0A=
> +     install -d ${D}${bindir}/=0A=
> +     install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv=0A=
> +     install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl=0A=
> +=0A=
> +     install -d ${D}${sysconfdir}/init.d/=0A=
> +     install -c -m 755 ${S}/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${=
INITSCRIPT_NAME}=0A=
> +     install -d ${D}${sysconfdir}/mpm/=0A=
> +     install -c -m 755 ${S}/mpm_config.json ${D}${sysconfdir}/mpm/mpm_co=
nfig.json=0A=
> +=0A=
> +     install -d ${D}${includedir}/=0A=
> +     install -c -m 755 ${S}/include/* ${D}${includedir}/=0A=
> +=0A=
> +     install -d ${D}${libdir}/=0A=
> +     install -c -m 755 ${S}/lib/* ${D}${libdir}/=0A=
> +}=0A=
> --=0A=
> 1.7.9.5=0A=
>=0A=
> _______________________________________________=0A=
> meta-arago mailing list=0A=
> meta-arago@arago-project.org=0A=
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=0A=

