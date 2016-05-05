Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0AA3F52A65
	for <meta-arago@arago-project.org>;
	Thu,  5 May 2016 20:49:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u45KnSdN032764
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 15:49:28 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45KnS78009587
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 15:49:28 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 5 May 2016 15:49:28 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard: use
	parted instead of sfdisk
Thread-Index: AQHRpvk5C8crcauNCUq2ih1YbIm11Z+rAb6A///PepA=
Date: Thu, 5 May 2016 20:49:27 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581426C7BC@DFLE09.ent.ti.com>
References: <1462471748-17612-1-git-send-email-j-stiffler@ti.com>
	<20160505184254.GK12998@edge>
In-Reply-To: <20160505184254.GK12998@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-setup-scripts][PATCH] create-sdcard: use parted instead of sfdisk
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
X-List-Received-Date: Thu, 05 May 2016 20:49:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, May 05, 2016 2:43 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard: use
> parted instead of sfdisk
>=20
> On Thu, May 05, 2016 at 02:09:08PM -0400, Jacob Stiffler wrote:
> > * The options for sfdisk since version 2.26
>=20
> Truncated sentence?
>=20

Yeah, I'll send out a v2.

>=20
> > * Ubuntu 16.04 contains sfdisk version 2.27.1
> > * In order to retain compatibility from Ubuntu 12.04 through 16.04,i
> >   use parted instead.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  create-sdcard.sh | 21 +++++++++------------
> >  1 file changed, 9 insertions(+), 12 deletions(-)
> >
> > diff --git a/create-sdcard.sh b/create-sdcard.sh index
> > 46ed5ae..edf57b0 100644
> > --- a/create-sdcard.sh
> > +++ b/create-sdcard.sh
> > @@ -501,13 +501,12 @@ SIZE=3D`fdisk -l $DRIVE | grep Disk | awk '{print
> > $5}'`
> >
> >  echo DISK SIZE - $SIZE bytes
> >
> > -CYLINDERS=3D`echo $SIZE/255/63/512 | bc`
> > +parted -s $DRIVE mklabel msdos
> > +parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9 parted -s
> > +$DRIVE set 1 boot on parted -s $DRIVE unit cyl mkpart primary ext2 --
> > +9 310 parted -s $DRIVE unit cyl mkpart primary ext2 -- 310 -2
> >
> > -sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
> > -,9,0x0C,*
> > -10,300,,-
> > -310,,,-
> > -EOF
> >
> >  cat << EOM
> >
> > @@ -560,12 +559,10 @@ SIZE=3D`fdisk -l $DRIVE | grep Disk | awk '{print
> > $5}'`
> >
> >  echo DISK SIZE - $SIZE bytes
> >
> > -CYLINDERS=3D`echo $SIZE/255/63/512 | bc`
> > -
> > -sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
> > -,9,0x0C,*
> > -10,,,-
> > -EOF
> > +parted -s $DRIVE mklabel msdos
> > +parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9 parted -s
> > +$DRIVE set 1 boot on parted -s $DRIVE unit cyl mkpart primary ext2 --
> > +9 -2
> >
> >  cat << EOM
> >
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

