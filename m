Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A51F452A99
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 17:20:10 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95HKAr9005488;
	Fri, 5 Oct 2012 12:20:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95HKAWS007710;
	Fri, 5 Oct 2012 12:20:10 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 12:20:09 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] iperf: Update to version 2.0.5
Thread-Index: AQHNosG0cHidp72OpUGutB+zE4gVbZerQ3QA//+yYGI=
Date: Fri, 5 Oct 2012 17:20:09 +0000
Message-ID: <A0CC959A-B26A-43D1-BE47-61EBB6E7A6DD@ti.com>
References: <1349419808-21687-1-git-send-email-fcooper@ti.com>,
	<20121005165800.GA31500@edge>
In-Reply-To: <20121005165800.GA31500@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] iperf: Update to version 2.0.5
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
X-List-Received-Date: Fri, 05 Oct 2012 17:20:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Original recipe didn't use the patches from 2.0.4 I didn't check if it didn=
't apply or not.=20

On Oct 5, 2012, at 11:59 AM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Fri, Oct 05, 2012 at 01:50:08AM -0500, Franklin S. Cooper Jr wrote:
>> * Upgrading to newer version of iperf.
>> * Newer versions of iperf reduced CPU load thus increasing performance i=
n
>>  wl12xx tests.
>=20
> And one more question - sorry for separate emails.
>=20
>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../recipes-benchmark/iperf/iperf_2.0.5.bb         |   34 ++++++++++++++=
++++++
>> 1 files changed, 34 insertions(+), 0 deletions(-)
>> create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5=
.bb
>>=20
>> diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb b/=
meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
>> new file mode 100644
>> index 0000000..aff06b2
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
>> @@ -0,0 +1,34 @@
>> +DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth, allo=
wing the tuning of various parameters and UDP characteristics"
>> +HOMEPAGE =3D "http://dast.nlanr.net/Projects/Iperf/"
>> +SECTION =3D "console/network"
>> +LICENSE =3D "NewBSD"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8478eae9f479e39bc3497519336=
0298"
>> +
>> +SRC_URI =3D " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz"
>=20
> You dropped all the other patches that were part of 2.0.4 - did you verif=
y=20
> they are already there in 2.0.5 tree or they no longer needed?
>=20
> --=20
> Denys
>=20
>=20
>> +
>> +SRC_URI[md5sum] =3D "44b5536b67719f4250faed632a3cd016"
>> +SRC_URI[sha256sum] =3D "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e=
9d13096d20362265b"
>> +
>> +PR =3D "r0"
>> +
>> +inherit autotools
>> +
>> +S=3D"${WORKDIR}/iperf-${PV}"
>> +
>> +EXTRA_OECONF =3D "--exec-prefix=3D${STAGING_DIR_HOST}${layout_exec_pref=
ix}"
>> +
>> +do_configure() {
>> +    export ac_cv_func_malloc_0_nonnull=3Dyes
>> +    gnu-configize
>> +    oe_runconf
>> +}
>> +
>> +do_compile() {
>> +    cd ${WORKDIR}/iperf-${PV}
>> +    oe_runmake
>> +}
>> +
>> +do_install() {
>> +    cd ${WORKDIR}/iperf-${PV}/src
>> +    oe_runmake DESTDIR=3D${D} install
>> +}
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

