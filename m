Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 31EDB529A4
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 15:08:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TF8umu012668
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 09:08:56 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TF8tbl004562
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 09:08:55 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Thu, 29 Jan 2015 09:08:55 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile size
Thread-Index: AQHQO9BKu1iTos4y3U2qHhB6zZMpfpzXKifwgABrcgD//5xJEA==
Date: Thu, 29 Jan 2015 15:08:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F04F6@DFLE08.ent.ti.com>
References: <1422541885-5800-1-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7F048A@DFLE08.ent.ti.com>
	<54CA4B0E.10503@ti.com>
In-Reply-To: <54CA4B0E.10503@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC PATCH] base-files: Increase /var/volatile size
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
X-List-Received-Date: Thu, 29 Jan 2015 15:08:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: R, Karthik
> Sent: Thursday, January 29, 2015 9:01 AM
> To: Cooper Jr., Franklin
> Cc: R, Karthik; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile =
size
>=20
> Thanks for the feedback Franklin.
>=20
> Starting from Weston 1.6.0, weston itself consumes about 10MB of the
> tmpfs while it initializes. You might have not seen this because this is
> observable only when you use multiple displays (usually with DRM backend)=
.
>=20
> And then on top of this when you invoke many the weston applications
> together, we quickly run out of the 16MB size that is preconfigured.
>=20
> It is desirable that this size be as high as possible to allow more UI in=
tensive
> applications, and many applications, to be able to run simultaneously.
>=20
> This would be needed for all platforms and more so with QT applications
> coming in, I'm guessing that this will need to be set to a higher value.
>=20
> Can we agree on some reasonably big size?
[Franklin] Thanks for clarifying. The majority of the evms we support only =
have max 1 hdmi output so multiple displays aren't used. However, I persona=
lly have no issue bumping and if it is a problem we can always fix it. As l=
ong as Denys doesn't have an concerns then I'm ok.

>=20
> Regards
> Karthik
>=20
> On 29-Jan-15 8:20 PM, Cooper Jr., Franklin wrote:
> > I think the size just determines the "maximum" amount of RAM that can b=
e
> used. So your basically your allowing the tmpfs to consume upto 50MB of
> memory. I never seen an issue on Beaglebone Black and AM57 with the
> current tmpfs being too small. Are the problems your seeing related to a
> particular application/demo? If its specific to a particular platform may=
be
> just create a custom fstab for that platform.
> >
> >> -----Original Message-----
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> bounces@arago-project.org] On Behalf Of R, Karthik
> >> Sent: Thursday, January 29, 2015 8:31 AM
> >> To: meta-arago@arago-project.org
> >> Subject: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile
> >> size
> >>
> >> * Weston applications allocate memory from tmpfs, need to
> >>    increase the tmpfs area to atleast 50M. Can this be
> >>    increased more - what are the pros/cons?
> >>
> >> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >> ---
> >>   .../recipes-core/base-files/base-files/fstab       |    2 +-
> >>   .../base-files/base-files_3.0.14.bbappend          |    2 +-
> >>   2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git
> >> a/meta-arago-distro/recipes-core/base-files/base-files/fstab
> >> b/meta-arago-distro/recipes-core/base-files/base-files/fstab
> >> index 9ed6f33..8ddadd9 100644
> >> --- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
> >> +++ b/meta-arago-distro/recipes-core/base-files/base-files/fstab
> >> @@ -5,7 +5,7 @@ proc                 /proc                proc       d=
efaults              0
> 0
> >>   devpts               /dev/pts             devpts     mode=3D0620,gid=
=3D5       0  0
> >>   usbdevfs             /proc/bus/usb        usbdevfs   noauto         =
       0  0
> >>   tmpfs                /run                 tmpfs
> mode=3D0755,nodev,nosuid,strictatime 0
> >> 0
> >> -tmpfs                /var/volatile        tmpfs      defaults,size=3D=
16M     0  0
> >> +tmpfs                /var/volatile        tmpfs      defaults,size=3D=
50M     0  0
> >>   tmpfs                /media/ram           tmpfs      defaults,size=
=3D16M     0  0
> >>
> >>   # uncomment this if your device has a SD/MMC/Transflash slot diff
> >> --git
> >> a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappen
> >> d
> >> b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappen
> >> d
> >> index 40b7722..956a057 100644
> >> ---
> >> a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappen
> >> d
> >> +++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bba
> >> +++ ppe
> >> +++ nd
> >> @@ -1,4 +1,4 @@
> >>   # look for files in this layer first
> >>   FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >>
> >> -PR_append =3D "-arago3"
> >> +PR_append =3D "-arago4"
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


