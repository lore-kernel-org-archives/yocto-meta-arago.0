Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5D923529A2
	for <meta-arago@arago-project.org>;
	Thu,  5 Sep 2013 00:36:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r850aI9J031934
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 19:36:18 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r850aIYx025467
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 19:36:18 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 4 Sep 2013 19:36:18 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/6 v2] board-port-labs-linux: Create new
	recipe using new sourceipk.bbclass feature
Thread-Index: AQHOo1op5f5nhcUZ80+hB99lCMw43pm2jp8A///KiyU=
Date: Thu, 5 Sep 2013 00:36:17 +0000
Message-ID: <B2FFF03E-7DF3-4CCF-8969-7C7A097F624B@ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
	<1377633092-29917-3-git-send-email-fcooper@ti.com>,
	<20130904224738.GC25135@edge>
In-Reply-To: <20130904224738.GC25135@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/6 v2] board-port-labs-linux: Create new recipe using new sourceipk.bbclass feature
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
X-List-Received-Date: Thu, 05 Sep 2013 00:36:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On Sep 4, 2013, at 5:47 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> Can we do away w/o using AUTOREV here? How often do you change the conten=
t in=20
> those repos? Would it be too much hassle to keep updating the recipe with=
 the=20
> new SRCREV for every new (AM-)SDK release?
>=20
Repo won't change often so that is fine with me.
> --=20
> Denys
>=20
> On Tue, Aug 27, 2013 at 02:51:29PM -0500, Franklin S. Cooper Jr wrote:
>> * Do to the inability to keep the git repository intact the board port l=
abs
>>  recipe manually ran git clone which took a long time every time the rec=
ipe was
>>  built.
>> * Using the new SRCIPK_PRESERVED_GIT feature in sourceipk.bbclass the re=
cipes can
>>  now be treated like any other recipe and allow OE to handle the cloning=
 and
>>  unpacking.
>> * This will significantly shorten the amount of time required to rebuild=
 this
>>  recipe.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> Changes Version 2:
>> Split recipe into its own patch.
>> Also use the kernel's license.
>>=20
>> .../board-port-labs/board-port-labs-linux_git.bb   |   35 ++++++++++++++=
++++++
>> 1 files changed, 35 insertions(+), 0 deletions(-)
>> create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board=
-port-labs-linux_git.bb
>>=20
>> diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-=
labs-linux_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-p=
ort-labs-linux_git.bb
>> new file mode 100644
>> index 0000000..711e3a8
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-li=
nux_git.bb
>> @@ -0,0 +1,35 @@
>> +DESCRIPTION =3D "Git repositories containing sample board port code"
>> +HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be=
7cd7"
>> +
>> +inherit allarch
>> +
>> +CREATE_SRCIPK =3D "1"
>> +SRCIPK_INSTALL_DIR =3D "board-support/board-port-labs/sitara-board-port=
-linux"
>> +SRCIPK_PRESERVE_GIT =3D "true"
>> +
>> +PR =3D "r0"
>> +
>> +BRANCH =3D "master"
>> +SRC_URI =3D "git://gitorious.org/sitara-board-port/sitara-board-port-li=
nux.git;protocol=3Dgit;branch=3D${BRANCH}"
>> +
>> +SRCREV =3D "${AUTOREV}"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +adjust_git_prepend() {
>> +
>> +    # Checkout a specific branch instead of a commit that is used by de=
fault
>> +    git checkout ${BRANCH}
>> +}
>> +
>> +do_configure() {
>> +    :
>> +}
>> +
>> +do_compile() {
>> +    :
>> +}
>> +
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

