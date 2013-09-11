Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 39CEC529A2
	for <meta-arago@arago-project.org>;
	Wed, 11 Sep 2013 21:13:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8BLD2hr031069
	for <meta-arago@arago-project.org>; Wed, 11 Sep 2013 16:13:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8BLD2m5016126
	for <meta-arago@arago-project.org>; Wed, 11 Sep 2013 16:13:02 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 11 Sep 2013 16:13:02 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago-qt4: undo RRECOMMENDS for
	eglibc-gconv-utf-16
Thread-Index: AQHOrpeeg4Ndxem0Vk+arNo0GVu6ZJnBF7IA///yhGE=
Date: Wed, 11 Sep 2013 21:13:01 +0000
Message-ID: <B1A7D92B-0718-4262-A267-EF216902C823@ti.com>
References: <1378866929-16570-1-git-send-email-denis@denix.org>,
	<20130911170117.GH8614@edge>
In-Reply-To: <20130911170117.GH8614@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-qt4: undo RRECOMMENDS for	eglibc-gconv-utf-16
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
X-List-Received-Date: Wed, 11 Sep 2013 21:13:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there a plan to fix this for the external arago toolchain?

On Sep 11, 2013, at 7:01 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> If there are no objections, I'd like to push this one in - it currently b=
reaks=20
> builds with the external arago toolchain (am180x only now). But in genera=
l, it=20
> pulls in entire eglibc into the build to get that specific locale/gconv m=
odule.
>=20
> --=20
> Denys
>=20
> On Tue, Sep 10, 2013 at 10:35:29PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>=20
>> Commit 995502d19cce43430c3f4dce80ce6ef5feee7421 in or-core adds RRECOMME=
NDS
>> for eglibc-gconv-utf-16 to resolve Qt's warning related to i18n and l10n=
.
>> Current external toolchains in use by meta-arago do not provide gconv mo=
dules.
>> While it is possible to fix for Linaro, as it is shipped with gconv modu=
les,
>> Arago toolchain had no gconv modules distributed, unfortunately.
>>=20
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>> meta-arago-distro/recipes-qt/qt4/arago-qt4.inc | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago=
-distro/recipes-qt/qt4/arago-qt4.inc
>> index 0291555..715092e 100644
>> --- a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
>> +++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
>> @@ -1,11 +1,15 @@
>> # Common file for patches or tweaks that are needed by qt4-embedded and
>> # qt4-embedded-gles
>>=20
>> -PR :=3D "${PR}-arago4"
>> +PR :=3D "${PR}-arago5"
>>=20
>> # look for files in this layer first
>> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>>=20
>> +python __anonymous () {
>> +    d.setVar("RRECOMMENDS_libqt-embeddedcore4", "")
>> +}
>> +
>> # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
>> # For our distribution purposes we only use LGPLv2.1
>> LICENSE =3D "LGPLv2.1"
>> --=20
>> 1.8.3.2
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

