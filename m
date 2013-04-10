Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 78D5B529F5
	for <meta-arago@arago-project.org>;
	Wed, 10 Apr 2013 21:32:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3ALWRrw004377
	for <meta-arago@arago-project.org>; Wed, 10 Apr 2013 16:32:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALWR0e025080
	for <meta-arago@arago-project.org>; Wed, 10 Apr 2013 16:32:27 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Apr 2013 16:32:27 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3ALWQoW015100;
	Wed, 10 Apr 2013 16:32:27 -0500
Date: Wed, 10 Apr 2013 17:32:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Message-ID: <20130410213226.GC3078@edge>
References: <1363771816-4022-2-git-send-email-eyalr@ti.com>
	<20130326184527.GA22032@denix.org>
	<8665E2433BC68541A24DFFCA87B70F5B17C5D70E@DNCE04.ent.ti.com>
	<20130331201326.GC31233@denix.org>
	<20130405231433.GG31233@denix.org>
MIME-Version: 1.0
In-Reply-To: <20130405231433.GG31233@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv3 2/9] wl18xx-firmware: install Wilink8 wlan firmware files
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
X-List-Received-Date: Wed, 10 Apr 2013 21:32:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 05, 2013 at 07:14:33PM -0400, Denys Dmytriyenko wrote:
> On Sun, Mar 31, 2013 at 04:13:26PM -0400, Denys Dmytriyenko wrote:
> > On Wed, Mar 27, 2013 at 07:53:24AM +0000, Reizer, Eyal wrote:
> > > Hi,
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Tuesday, March 26, 2013 8:45 PM
> > > > To: Reizer, Eyal
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [PATCHv3 2/9] wl18xx-firmware: install
> > > > Wilink8 wlan firmware files
> > > > 
> > > > On Wed, Mar 20, 2013 at 11:30:09AM +0200, Eyal Reizer wrote:
> > > > > Add a recipe for installing the Wilink8 wlan firmware files into the
> > > > > target file system.
> > > > >
> > > > > This package replace the wilink6 package which is provided by the
> > > > > wl12xx-firmware recipe. Selection between the two is done using a
> > > > > "WILINK_VERSION" switch added to arago.conf
> > > > 
> > > > I have 2 questions:
> > > > 
> > > > 1. I seem to be missing the first patch in this series - 1/9 never made
> > > 
> > > I do see patch 1/9 in the following link:
> > > http://arago-project.org/pipermail/meta-arago/2013-March/001004.html
> > 
> > Ah, I see it was part of v1 submission, but not the following v2 or v3 sets...
> 
> Eyal,
> 
> Ping on this one. There was a v1 of the 1/9 patch, but not v2 or v3. Are you 
> saying you want the v1 to be pushed? Do you want to address Franklin's 
> comment here:
> http://arago-project.org/pipermail/meta-arago/2013-March/001013.html

Eyal,

Ping again - any updates?

-- 
Denys


> > > > it 2. Is this set depending on Franklin's big set of 17 patches?
> > >  
> > > > 
> > > > > Changes in v2:
> > > > > * Use an actual release name in the recipe name instead of _git
> > > > > * Add RPROVIDES, RREPLACES, RCONFLICTS as this recipe completely
> > > > >   replace the wilink6 one.
> > > > >
> > > > > Changes in v3:
> > > > > * Add _${PN} to all runtime variables
> > > > >
> > > > > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > > > > ---
> > > > >  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
> > > > >  .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   30
> > > > ++++++++++++++++++++
> > > > >  2 files changed, 37 insertions(+)
> > > > >  create mode 100644
> > > > > meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > firmware/Makefile
> > > > >  create mode 100644
> > > > > meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > firmware_r8.a6.01
> > > > > .bb
> > > > >
> > > > > diff --git
> > > > > a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > firmware/Makefi
> > > > > le
> > > > > b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > firmware/Makefi
> > > > > le
> > > > > new file mode 100644
> > > > > index 0000000..0bb7ab8
> > > > > --- /dev/null
> > > > > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > firmware/Ma
> > > > > +++ kefile
> > > > > @@ -0,0 +1,7 @@
> > > > > +# Installs the the ti-connectiviy wlan firmware files into the root
> > > > > +file system
> > > > > +
> > > > > +install:
> > > > > +	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
> > > > > +	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
> > > > > +	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
> > > > > +
> > > > > diff --git
> > > > > a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > firmware_r8.a6.
> > > > > 01.bb
> > > > > b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > firmware_r8.a6.
> > > > > 01.bb
> > > > > new file mode 100644
> > > > > index 0000000..fd463cc
> > > > > --- /dev/null
> > > > > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > firmware_r8
> > > > > +++ .a6.01.bb
> > > > > @@ -0,0 +1,30 @@
> > > > > +DESCRIPTION = "Firmware files for use with TI wl18xx"
> > > > > +LICENSE = "TI-TSPA"
> > > > > +LIC_FILES_CHKSUM =
> > > > "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
> > > > > +
> > > > > +PACKAGE_ARCH = "all"
> > > > > +
> > > > > +PR = "r1+gitr${SRCREV}"
> > > > > +
> > > > > +PROVIDES += "wl12xx-firmware"
> > > > > +RPROVIDES_${PN} += "wl12xx-firmware"
> > > > > +RREPLACES_${PN} += "wl12xx-firmware"
> > > > > +RCONFLICTS_${PN} += "wl12xx-firmware"
> > > > > +
> > > > > +SRCREV = "ol_r8.a6.01"
> > > > > +SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
> > > > > +           file://Makefile \
> > > > > +          "
> > > > > +
> > > > > +S = "${WORKDIR}/git"
> > > > > +
> > > > > +do_compile() {
> > > > > +    :
> > > > > +}
> > > > > +
> > > > > +do_install() {
> > > > > +    cp ${WORKDIR}/Makefile ${S}
> > > > > +    oe_runmake 'DEST_DIR=${D}' install }
> > > > > +
> > > > > +FILES_${PN} = "/lib/firmware/ti-connectivity/*"
> > > > > --
> > > > > 1.7.9.5
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

