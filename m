Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 18228529E4
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 16:13:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62GDFSS004152
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 11:13:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62GDFSt024649
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 11:13:15 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 11:13:15 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62GDF2q023711;
	Tue, 2 Jul 2013 11:13:15 -0500
Date: Tue, 2 Jul 2013 12:13:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130702161314.GH4941@edge>
References: <1370555268-22244-1-git-send-email-fcooper@ti.com>
	<1370555268-22244-3-git-send-email-fcooper@ti.com>
	<20130607184912.GE15158@edge> <20130613175043.GT3741@edge>
MIME-Version: 1.0
In-Reply-To: <20130613175043.GT3741@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] wl12xx-firmware: Update to Wilink 6 version of wl1271-nvs.bin
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
X-List-Received-Date: Tue, 02 Jul 2013 16:13:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Franklin,

ping^2 - do you want to address this?


On Thu, Jun 13, 2013 at 01:50:44PM -0400, Denys Dmytriyenko wrote:
> ping
> 
> On Fri, Jun 07, 2013 at 02:49:12PM -0400, Denys Dmytriyenko wrote:
> > On Thu, Jun 06, 2013 at 04:47:48PM -0500, Franklin S. Cooper Jr wrote:
> > > * The version of the wl1271-nvs.bin included in the current repository was meant
> > >   for Wilink 7 not Wilink 6.
> > > * This caused firmware errors which caused Wilink 6 not to work on any boards
> > >   that don't rerun a calibration script.
> > > * Use the Wilink 6 version of the nvs file to use a version supported by Wilink
> > >   6 so by default wireless will work.
> > 
> > Any chance to get this resolved in the upstream TI-OpenLink repository, 
> > instead of dumping a binary here in the metadata?
> > 
> > 
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  .../wl1271-nvs.bin-wilink6                         |  Bin 0 -> 912 bytes
> > >  .../wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb   |    7 ++++++-
> > >  2 files changed, 6 insertions(+), 1 deletions(-)
> > >  create mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/wl1271-nvs.bin-wilink6
> > > 
> > > diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/wl1271-nvs.bin-wilink6 b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/wl1271-nvs.bin-wilink6
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..bb6ff93e585cbc92e1270a3a01779d0614616441
> > > GIT binary patch
> > > literal 912
> > > zcmZR~4PgKR#zHU!VnP7pOvbNJCKJPte=uQe^tV53Y#dx%Jp6*9;?i;|3|b5Z4CV}W
> > > z3@!|Q4517$4Dk$!46zIm*tCv{0Yl)=-+%xA1ET;4n3$M|2ofe?Y>HMf1I=IpnZ(2j
> > > zl4oRO;AD{y;9&Uv{`q~70KYvdp8-uCq=w<mHwGSwAAcA)1U~#=;1U6gQAU(AHZaJ_
> > > qE2*h#O35p!s;Z00$|<O*2H*jpU|?bp6%`c}73GuDrOf&vrW*iCk}^R6
> > > 
> > > literal 0
> > > HcmV?d00001
> > > 
> > > diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
> > > index 2232e1c..96b15e0 100644
> > > --- a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
> > > +++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
> > > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
> > >  
> > >  PACKAGE_ARCH = "all"
> > >  
> > > -PR = "r3+gitr${SRCPV}"
> > > +PR = "r4+gitr${SRCPV}"
> > >  
> > >  # This recipe provides the latest firmware files for wl12xx.
> > >  # Therefore, use the contents of this recipe instead of the contents
> > > @@ -16,6 +16,7 @@ RPROVIDES_${PN}  = "linux-firmware-wl12xx"
> > >  SRCREV = "c8d6b8e6ddf81091e1b1c99ebfb6751cc62b2c63"
> > >  SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git \
> > >             file://Makefile \
> > > +           file://wl1271-nvs.bin-wilink6 \
> > >            "
> > >  
> > >  S = "${WORKDIR}/git/hw/firmware"
> > > @@ -26,6 +27,10 @@ do_compile() {
> > >  
> > >  do_install() {
> > >      cp ${WORKDIR}/Makefile ${S}
> > > +    # Remove Wilink 7 version
> > > +    rm ${S}/wl1271-nvs.bin
> > > +    # Copy and use Wilink 6 version
> > > +    cp ${WORKDIR}/wl1271-nvs.bin-wilink6 ${S}/wl1271-nvs.bin
> > >      oe_runmake 'DEST_DIR=${D}' install
> > >  }
> > >  
> > > -- 
> > > 1.7.0.4
> > > 
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

