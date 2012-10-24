Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BECBD529A5
	for <meta-arago@arago-project.org>;
	Wed, 24 Oct 2012 21:11:48 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9OLBmsi003377
	for <meta-arago@arago-project.org>; Wed, 24 Oct 2012 16:11:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9OLBm8i020449
	for <meta-arago@arago-project.org>; Wed, 24 Oct 2012 16:11:48 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 24 Oct 2012 16:11:47 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] remove-net-rules: Add a class to
	remove net rules from images
Thread-Index: AQHNsiIvuCeekME2ckeKE150G3Xz0pfI8+0A
Date: Wed, 24 Oct 2012 21:11:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015927DF92@DLEE12.ent.ti.com>
References: <1350942384-27039-1-git-send-email-Chase.Maupin@ti.com>
	<20121024200012.GB3465@denix.org>
In-Reply-To: <20121024200012.GB3465@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] remove-net-rules: Add a class to remove net rules from images
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
X-List-Received-Date: Wed, 24 Oct 2012 21:11:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, October 24, 2012 3:00 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/2] remove-net-rules: Add a
> class to remove net rules from images
>=20
> On Mon, Oct 22, 2012 at 04:46:23PM -0500, Chase Maupin wrote:
> > * Inherit the remove-net-rules class in the TISDK images to
> remove
> >   the utility that creates the persistent net rules file.
> > * This allows moving SD cards between EVMs.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  meta-arago-distro/classes/remove-net-rules.bbclass |   15
> +++++++++++++++
> >  1 files changed, 15 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-distro/classes/remove-net-
> rules.bbclass
> >
> > diff --git a/meta-arago-distro/classes/remove-net-rules.bbclass
> b/meta-arago-distro/classes/remove-net-rules.bbclass
> > new file mode 100644
> > index 0000000..3227221
> > --- /dev/null
> > +++ b/meta-arago-distro/classes/remove-net-rules.bbclass
> > @@ -0,0 +1,15 @@
> > +# Add a ROOTFS_POSTPROCESS_COMMAND that will strip the
> write_net_rules
> > +# executable from the file system.  This will prevent the
> > +# 70-persistent-net.rules from being created.  Not having this
> file
> > +# will allow moving SD cards between EVMs and similar boards
> such as
> > +# beaglebone and the EVM.
> > +
> > +ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_remove_net_rules"
>=20
> ROOTFS_POSTPROCESS_COMMAND is a list of shell commands/functions
> - you need to
> terminate it with a semicolon, i.e. R_P_C +=3D "func;"

I'll send an update.  I guess I got away with this in the past because this=
 was the last command to run.

>=20
> > +
> > +rootfs_remove_net_rules () {
> > +    if [ -e ${IMAGE_ROOTFS}/lib/udev/write_net_rules ]
> > +    then
> > +        rm ${IMAGE_ROOTFS}/lib/udev/write_net_rules
> > +    fi
> > +}
> > +
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

