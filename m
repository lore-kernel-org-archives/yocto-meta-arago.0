Return-Path: <e-ruei1@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9094552A85
	for <meta-arago@arago-project.org>;
	Wed,  4 May 2016 16:03:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u44G3b4o027578
	for <meta-arago@arago-project.org>; Wed, 4 May 2016 11:03:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u44G3b9s013429
	for <meta-arago@arago-project.org>; Wed, 4 May 2016 11:03:37 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Wed, 4 May 2016 11:03:36 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [arago-commits] Gou, Hongmei : weston-init:
	update init scripts related to restarting Weston
Thread-Index: AQHRpPKtcxy6HOBWMEeaLy5vj9RX8Z+o8OrA
Date: Wed, 4 May 2016 16:03:36 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A14263022@DFLE09.ent.ti.com>
References: <20160127210049.58111529C9@arago-project.org>
	<20160428194623.GA17066@denix.org> <20160429235943.GF1546@edge>
	<20160503041701.GS1546@edge>
In-Reply-To: <20160503041701.GS1546@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [arago-commits] Gou, Hongmei : weston-init: update init scripts related to restarting Weston
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
X-List-Received-Date: Wed, 04 May 2016 16:03:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

We are sorry for the late response. Hongmei and myself are finally able to =
discuss this change and reproduce the issue at PSDK 2.0.1 release.
Please see our comments below.

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, May 03, 2016 12:17 AM
To: meta-arago@arago-project.org
Cc: Gou, Hongmei; Ruei, Eric; Stiffler, Jacob
Subject: Re: [meta-arago] [arago-commits] Gou, Hongmei : weston-init: updat=
e init scripts related to restarting Weston

Hongmei, Eric, Jake,

Ping again. I will be reverting this if not clarified. Thanks.

--=20
Denys


On Fri, Apr 29, 2016 at 07:59:44PM -0400, Denys Dmytriyenko wrote:
> Ping.
>=20
>=20
> On Thu, Apr 28, 2016 at 03:46:23PM -0400, Denys Dmytriyenko wrote:
> > So, I was looking into Weston init script lately for another reason and=
=20
> > noticed there was a hole in its logic. From the logs I came to this com=
mit=20
> > made few months ago. Particularly, I'm interested why the first part of=
 the=20
> > change was made:
> >=20
> > * Bypass restarting Weston if SD card has calibration file already
> >=20
> > This seems incorrect, because if calibration file is only available on =
SD=20
> > card, it has to be copied to /etc and in order to take immediate effect=
, udev=20
> > has to be reloaded and weston has to be restarted, which how it used to=
 be=20
> > before. Why is this now bypassed? Please provide details of what this c=
hange=20
> > is meant to address and how is it supposed to work. Thanks.
> >=20
> > --=20
> > Denys
> >=20

You are right. It is incorrect and we need toi restart weston to pick up th=
e calibration data.=20
Therefore, we need to undo the change by removing "exit 0".
However, we may need to keep the "sleep 2" change, which is required for PS=
DK 2.0.1 AM437x.
Please see my comments close to the changes below.

Eric

> >=20
> > On Wed, Jan 27, 2016 at 09:00:49PM +0000, Arago Project git wrote:
> > > Module: meta-arago
> > > Branch: master
> > > Commit: b057be5db06e0f2e0ebb649841e64f60a997c2c1
> > > URL:    http://arago-project.org/git/meta-arago.git?a=3Dcommit;h=3Db0=
57be5db06e0f2e0ebb649841e64f60a997c2c1
> > >=20
> > > Author: Gou, Hongmei <h-gou@ti.com>
> > > Date:   Thu Jan 28 01:48:05 2016 +0000
> > >=20
> > > weston-init: update init scripts related to restarting Weston
> > >=20
> > > * Bypass restarting Weston if SD card has calibration file already
> > >=20
> > > * Increase the sleep time before Weston is restarted
> > >   It takes some time to complete the Weston termination procedure.
> > >   If Weston is restarted before the previous instance is fully
> > >   terminated, the restart of Weston will fail.
> > >=20
> > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >=20
> > > ---
> > >=20
> > >  .../recipes-graphics/wayland/weston-init.bbappend  |    2 +-
> > >  .../recipes-graphics/wayland/weston-init/init      |    7 ++++---
> > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.b=
bappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > > index d9e15b6..4b5ad93 100644
> > > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > > @@ -1,4 +1,4 @@
> > > -PR_append =3D "-arago4"
> > > +PR_append =3D "-arago5"
> > > =20
> > >  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> > > =20
> > > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/i=
nit b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > > index 2e2ae36..494584f 100644
> > > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > > @@ -63,8 +63,9 @@ case "$1" in
> > >          # Check if SD card has a calibration rules file
> > >          SD_CALUDEV_FILE=3D/run/media/mmcblk0p1/ws-calibrate.rules
> > >          if [ "$SD_MOUNTED" =3D "1" -a -f "$SD_CALUDEV_FILE" ] ; then
> > > -            # Copy it over to udev location
> > > +            # Copy it over to udev location, and done
> > >              cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
> > > +            exit 0

Undo both changes.

Eric

> > >          else
> > >              # Run a calibration app and save output to udev rules
> > >              echo    "Calibrating touchscreen (first time only)"
> > > @@ -85,7 +86,7 @@ case "$1" in
> > >          udevadm control --reload
> > >          udevadm trigger
> > >          killproc weston
> > > -        sleep 1
> > > +        sleep 2

This change is needed for PDSK 2.0.1 AM437x (Weston 1.6 and DDK 1.9)

Eric

> > >          openvt -c 4 -f runWeston
> > >    ;;
> > > =20
> > > @@ -96,7 +97,7 @@ case "$1" in
> > > =20
> > >    restart)
> > >  	$0 stop
> > > -        sleep 1
> > > +        sleep 2
> > >          $0 start

I believe that this change is also not required.

Eric


> > >    ;;
> > > =20
> > >=20
> > > _______________________________________________
> > > arago-commits mailing list
> > > arago-commits@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
> > >=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

