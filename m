Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 19B1E52AA0
	for <meta-arago@arago-project.org>;
	Thu,  5 Dec 2013 01:38:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB51c95C029723
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 19:38:09 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB51c9qt019343
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 19:38:09 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 19:38:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB51c8Jf018362;
	Wed, 4 Dec 2013 19:38:09 -0600
Date: Wed, 4 Dec 2013 20:38:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131205013808.GY690@edge>
References: <1386196643-11077-1-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C5CE5B5@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5CE5B5@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/3] matrix-gui-tscal: Add init package to run	ts_calibrate
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
X-List-Received-Date: Thu, 05 Dec 2013 01:38:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

That is what I was thinking myself - whether it should be named anything 
matrix-specific or not...

I haven't looked at those env scripts yet, so not sure about the second 
option. But I like the idea, if it works.

-- 
Denys


On Thu, Dec 05, 2013 at 12:31:16AM +0000, Cooper Jr., Franklin wrote:
> Can we change the name of this recipe to reflect that it's a ts_calibrate 
> init script and that it has no relationship with matrix-gui? Probably put it 
> at recipes-graphics/ since that is the directory where tslib is located in.
> 
> Another option:
> 
> Looking at tslib there is already a script called tslib.sh that looks like 
> it has a similar purpose. That script is located at /etc/profile.d/ which is 
> meant for Application Environment variables to be set. So would simply 
> overriding this file with our script work?
> 
> Qt has a similar file in /etc/profile.d called qte.sh. So we could even take 
> the Qt portion (matrix/matrix-gui/init) and override this file. This way 
> configuring Qt to work with our touchscreen isn't coupled with Matrix but 
> rather Qt itself.
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Wednesday, December 04, 2013 4:37 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 1/3] matrix-gui-tscal: Add init package to run
> > ts_calibrate
> > 
> > * Add a package that will run ts_calibrate if needed.  This
> >   will allow separating this logic from the matrix init script
> >   since it is not always needed.
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../recipes-core/matrix/matrix-gui-tscal/init      |   43 ++++++++++++++++++++
> >  .../recipes-core/matrix/matrix-gui-tscal_1.0.bb    |   25 +++++++++++
> >  2 files changed, 68 insertions(+), 0 deletions(-)  create mode 100644 meta-
> > arago-extras/recipes-core/matrix/matrix-gui-tscal/init
> >  create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-
> > tscal_1.0.bb
> > 
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal/init b/meta-
> > arago-extras/recipes-core/matrix/matrix-gui-tscal/init
> > new file mode 100644
> > index 0000000..e8d9197
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal/init
> > @@ -0,0 +1,43 @@
> > +#!/bin/sh
> > +# Copyright (C) {2013} Texas Instruments Incorporated -
> > +http://www.ti.com/ # # This program is free software; you can
> > +redistribute it and/or # modify it under the terms of the GNU General
> > +Public License as # published by the Free Software Foundation version
> > +2.
> > +#
> > +# This program is distributed "as is" WITHOUT ANY WARRANTY of any #
> > +kind, whether express or implied; without even the implied warranty #
> > +of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the #
> > GNU
> > +General Public License for more details.
> > +
> > +tsfile=/etc/pointercal
> > +
> > +# Check if the SD card is mounted and the first partition is # vfat.
> > +If so let's write the pointercal file there so that if # someone messes
> > +up calibration they can just delete the file from # any system and
> > +reboot the board.
> > +
> > +#TODO how can we find the SD card and not eMMC?  can we look for a "boot"
> > +# LABEL?
> > +mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1 if [ "$?" =
> > +"0" ] then
> > +    tsfile=/media/mmcblk0p1/pointercal
> > +    export TSLIB_CALIBFILE=$tsfile
> > +fi
> > +
> > +if [ ! -f $tsfile ] ; then
> > +    echo -n "Calibrating touchscreen (first time only)"
> > +    ts_calibrate
> > +    echo "."
> > +
> > +    # If we create a pointercal file and it was not in /etc/pointercal
> > +    # let's copy it there as well if it does not already exist.  This is so
> > +    # that running other applications that look for /etc/pointercal and
> > +    # without TSLIB_CALIBFILE set will still get the right calibration.
> > +    # TODO: can we just globally export TSLIB_CALIBFILE?
> > +    if [ ! -f /etc/pointercal -a -f $tsfile ]
> > +    then
> > +        cp $tsfile /etc/pointercal
> > +    fi
> > +fi
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal_1.0.bb
> > b/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal_1.0.bb
> > new file mode 100644
> > index 0000000..9156a6a
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal_1.0.bb
> > @@ -0,0 +1,25 @@
> > +DESCRIPTION = "Matrix GUI TS calibration init script"
> > +
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM =
> > "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60
> > "
> > +
> > +PR = "r0"
> > +
> > +S = "${WORKDIR}"
> > +
> > +INITSCRIPT_NAME = "matrix-gui-tscal"
> > +# Start this init script before the matrix gui launches
> > +INITSCRIPT_PARAMS = "start 96 2 3 4 5 ."
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +inherit update-rc.d
> > +
> > +SRC_URI = "file://init"
> > +
> > +do_install(){
> > +	# Install the init script
> > +	# TODO: replace init script with systemd files
> > +	install -d ${D}${sysconfdir}/init.d
> > +	install -m 0755 ${WORKDIR}/init
> > +${D}${sysconfdir}/init.d/matrix-gui-tscal
> > +}
> > --
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

