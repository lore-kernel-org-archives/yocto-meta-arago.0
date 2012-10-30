Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6997E5209D
	for <meta-arago@arago-project.org>;
	Tue, 30 Oct 2012 19:55:59 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9UJtwwf007658
	for <meta-arago@arago-project.org>; Tue, 30 Oct 2012 14:55:58 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9UJtwn9007629
	for <meta-arago@arago-project.org>; Tue, 30 Oct 2012 14:55:58 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 30 Oct 2012 14:55:58 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] task-arago-qte-toolchain-target: standard qte
	target sdk packages
Thread-Index: Ac2zhbg+HDyoEX4QQFWuZshtvE204gDe6iGAAApm7jA=
Date: Tue, 30 Oct 2012 19:55:57 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3109EC@DFLE09.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C30CDB1@DFLE09.ent.ti.com>
	<20121030194801.GH11551@edge>
In-Reply-To: <20121030194801.GH11551@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: task-arago-qte-toolchain-target: standard qte target sdk packages
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
X-List-Received-Date: Tue, 30 Oct 2012 19:55:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Previously MySQL was disabled in Qt in Arago but I wasn't planning on disab=
ling it again. Since in oe-core it is enabled by default I am assuming ther=
e is a dependency on MySQL. Why do we need to disable MySQL?



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, October 30, 2012 2:48 PM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] task-arago-qte-toolchain-target: standard qte tar=
get sdk packages

On Fri, Oct 26, 2012 at 02:30:12PM +0000, Cooper Jr., Franklin wrote:
> This task duplicates task-arago-qte-sdk-target quite a bit.
> http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob_plain;f=3Dmeta-=
ara
> go-distro/recipes-core/tasks/task-arago-qte-sdk-target.bb;hb=3DHEAD

Correct. The reason for the duplication is that it goes into extras vs.=20
distro, since the corresponding meta-toolchain-qte is also there.


> I don't see a need for both tasks so most likely we will get rid of=20
> task-arago-qte-sdk-target. Only thing I see that your task doesn't=20
> include is "qt4-embedded-dev" which I would think is also needed.

Yes, I saw that. I didn't have time to check whether qt4-embedded-dev is be=
ing pulled automatically. I'll verify that and if needed, add it back.

I have also noticed MySQL is being built though, which I started looking in=
to, but wasn't able to finish before the hurricane...

--
Denys


> -----Original Message-----
> From: Arago Project git [mailto:git@arago-project.org]=20
> Sent: Friday, October 26, 2012 12:05 AM
> To: arago-commits@arago-project.org
> Subject: [arago-commits] Denys Dmytriyenko : task-arago-qte-toolchain-tar=
get: standard qte target sdk packages
>=20
> Module: meta-arago
> Branch: master
> Commit: 0013364df6cdcf1c505087e1064ee321b36d8f76
> URL:    http://arago-project.org/git/meta-arago.git?a=3Dcommit;h=3D001336=
4df6cdcf1c505087e1064ee321b36d8f76
>=20
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Fri Oct 26 01:02:52 2012 -0400
>=20
> task-arago-qte-toolchain-target: standard qte target sdk packages
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
>  .../tasks/task-arago-qte-toolchain-target.bb       |   31 ++++++++++++++=
++++++
>  1 files changed, 31 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchai=
n-target.bb b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain=
-target.bb
> new file mode 100644
> index 0000000..67b2fbc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-targe=
t.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "Target packages for Qt Embedded SDK"
> +LICENSE =3D "MIT"
> +ALLOW_EMPTY =3D "1"
> +
> +PR =3D "r1"
> +
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58 \
> +                    file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
> +
> +RDEPENDS_${PN} +=3D " \
> +        task-core-standalone-sdk-target \
> +        qt4-embedded-mkspecs \
> +        libqt-embeddedmultimedia4-dev \
> +        libqt-embeddedphonon4-dev \
> +        libqt-embedded3support4-dev \
> +        libqt-embeddedclucene4-dev \
> +        libqt-embeddedcore4-dev \
> +        libqt-embeddeddbus4-dev \
> +        libqt-embeddeddesignercomponents4-dev \
> +        libqt-embeddeddesigner4-dev \
> +        libqt-embeddeduitools4-dev \
> +        libqt-embeddedgui4-dev \
> +        libqt-embeddedhelp4-dev \
> +        libqt-embeddednetwork4-dev \
> +        libqt-embeddedscript4-dev \
> +        libqt-embeddedscripttools4-dev \
> +        libqt-embeddedsvg4-dev \
> +        libqt-embeddedtest4-dev \
> +        libqt-embeddedwebkit4-dev \
> +        libqt-embeddedxml4-dev \
> +        "
>=20
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

