Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B25AA529D8
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2012 21:14:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8OLELVX006943;
	Mon, 24 Sep 2012 16:14:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8OLELDk025675;
	Mon, 24 Sep 2012 16:14:21 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 24 Sep 2012 16:14:21 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [meta-arago-extras][PATCH] ussp-push: Add ussp-push
Thread-Index: AQHNmFiqZP5D/l9LaUOdaiYHMONNnZeaVBiA//+uV8U=
Date: Mon, 24 Sep 2012 21:14:20 +0000
Message-ID: <6345A026-C6AA-4BCF-91D7-08A5B0B3268F@ti.com>
References: <1348274886-27669-1-git-send-email-fcooper@ti.com>,
	<20120924210637.GE4278@denix.org>
In-Reply-To: <20120924210637.GE4278@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-extras][PATCH] ussp-push: Add ussp-push
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
X-List-Received-Date: Mon, 24 Sep 2012 21:14:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes I plan on submitting all the recipes that was in oe-classic but not in =
meta-oe/oe-core to either meta-oe or oe-core

On Sep 24, 2012, at 5:07 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:

> On Fri, Sep 21, 2012 at 07:48:06PM -0500, Franklin S. Cooper Jr wrote:
>> * Port ussp-push recipes from oe-classic.
>> * Adds ussp-push which is a OBEX object pusher for Linux that uses
>>  the BlueZ bluetooth stack.
>=20
> Is this being submitted to oe-core or meta-oe?
>=20
>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../ussp-push/ussp-push-0.11/hci_remote_name.patch |   13 ++++++++++++
>> .../ussp-push/ussp-push_0.11.bb                    |   21 ++++++++++++++=
++++++
>> 2 files changed, 34 insertions(+), 0 deletions(-)
>> create mode 100644 meta-arago-extras/recipes-connectivity/ussp-push/ussp=
-push-0.11/hci_remote_name.patch
>> create mode 100644 meta-arago-extras/recipes-connectivity/ussp-push/ussp=
-push_0.11.bb
>>=20
>> diff --git a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-=
0.11/hci_remote_name.patch b/meta-arago-extras/recipes-connectivity/ussp-pu=
sh/ussp-push-0.11/hci_remote_name.patch
>> new file mode 100644
>> index 0000000..956e048
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hc=
i_remote_name.patch
>> @@ -0,0 +1,13 @@
>> +diff -urN ussp-push-0.11/src/obex_socket.c ussp-push-0.11_Demo/src/obex=
_socket.c
>> +--- ussp-push-0.11/src/obex_socket.c    2008-08-25 02:18:53.000000000 +=
0530
>> ++++ ussp-push-0.11_Demo/src/obex_socket.c    2010-04-16 15:11:27.000000=
000 +0530
>> +@@ -197,7 +197,8 @@
>> +    for (i =3D 0; i < niinf; i++) {
>> +        char devname[128];
>> +
>> +-        if (hci_remote_name(dd, &piinf[i].bdaddr, sizeof(devname) - 1,
>> ++        if (hci_read_remote_name(dd, &piinf[i].bdaddr,
>> ++                    sizeof(devname) - 1,
>> +                    devname, 100000) >=3D 0) {
>> +            if (strcasecmp(devname, btname) =3D=3D 0) {
>> +                *btaddr =3D piinf[i].bdaddr;
>> diff --git a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_=
0.11.bb b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.b=
b
>> new file mode 100644
>> index 0000000..a2ca571
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb
>> @@ -0,0 +1,21 @@
>> +DESCRIPTION =3D "OBEX object pusher"
>> +HOMEPAGE =3D "http://www.xmailserver.org/ussp-push.html"
>> +SECTION =3D "console"
>> +PRIORITY =3D "optional"
>> +DEPENDS =3D "bluez4 openobex"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17=
f833"
>> +
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "http://www.xmailserver.org/ussp-push-${PV}.tar.gz \
>> +           file://hci_remote_name.patch"
>> +
>> +S =3D "${WORKDIR}/ussp-push-${PV}"
>> +
>> +EXTRA_OECONF =3D "--with-bluez-libs=3D${STAGING_LIBDIR} --with-bluez-in=
cludes=3D${STAGING_INCDIR}"
>> +
>> +inherit autotools
>> +
>> +SRC_URI[md5sum] =3D "5c44983ee27809867041feff6bb4423a"
>> +SRC_URI[sha256sum] =3D "bb2748eaed6164812555b4a1e186c4f2820c5ef9ce30f12=
d7aac28a452719bbd"
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

