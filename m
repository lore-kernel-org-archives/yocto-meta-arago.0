Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id 2C434529AF
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:25:11 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJX00BBTTDJ1TA0@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 19 Mar 2013 21:25:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0753F200DB; Tue,
	19 Mar 2013 22:24:55 -0400 (EDT)
Date: Tue, 19 Mar 2013 22:24:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20130320022454.GO14761@denix.org>
References: <1363707935-2749-2-git-send-email-eyalr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159485C17@DLEE11.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED10159485C17@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2 2/9] wl18xx-firmware: install Wilink8 wlan	firmware files
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
X-List-Received-Date: Wed, 20 Mar 2013 02:25:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 19, 2013 at 03:50:03PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Reizer, Eyal
> > Sent: Tuesday, March 19, 2013 10:45 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCHv2 2/9] wl18xx-firmware: install
> > Wilink8 wlan firmware files
> > 
> 
> What changed in v2?  You need to add that note.
> 
> > Add a recipe for installing the Wilink8 wlan firmware files into
> > the target file system.
> > 
> > This package replace the wilink6 package which is provided by the
> > wl12xx-firmware recipe. Selection between the two is done using a
> > "WILINK_VERSION" switch added to arago.conf
> > 
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
> >  .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   30
> > ++++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> > firmware/wl18xx-firmware/Makefile
> >  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> > firmware/wl18xx-firmware_r8.a6.01.bb
> > 
> > diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> > firmware/wl18xx-firmware/Makefile b/meta-arago-extras/recipes-
> > bsp/wl18xx-firmware/wl18xx-firmware/Makefile
> > new file mode 100644
> > index 0000000..0bb7ab8
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > firmware/Makefile
> > @@ -0,0 +1,7 @@
> > +# Installs the the ti-connectiviy wlan firmware files into the
> > root file system
> > +
> > +install:
> > +	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
> > +	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
> > +	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
> > +
> > diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> > firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-
> > bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
> > new file mode 100644
> > index 0000000..fd463cc
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > firmware_r8.a6.01.bb
> > @@ -0,0 +1,30 @@
> > +DESCRIPTION = "Firmware files for use with TI wl18xx"
> > +LICENSE = "TI-TSPA"
> > +LIC_FILES_CHKSUM =
> > "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
> > +
> > +PACKAGE_ARCH = "all"
> > +
> > +PR = "r1+gitr${SRCREV}"
> > +
> > +PROVIDES += "wl12xx-firmware"
> > +RPROVIDES += "wl12xx-firmware"
> > +RREPLACES += "wl12xx-firmware"
> > +RCONFLICTS += "wl12xx-firmware"
> 
> This seems wrong.  You are providing wl12xx-firmware and also saying you 
> replace and conflict with wl12xx firmware.

No, that is actually the correct approach.

With one exception! All runtime variables (those beginning with R) should 
always be package-specific, i.e. use the _${PN} suffix or the actual name of 
the package:

+PROVIDES += "wl12xx-firmware"
+RPROVIDES_${PN} += "wl12xx-firmware"
+RREPLACES_${PN} += "wl12xx-firmware"
+RCONFLICTS_${PN} += "wl12xx-firmware"


> I'm thinking you should use wl-firmware as the package name and then your 
> PREFERRED_PROVIDER settings can be updated and the PROVIDES here would be 
> updated.

I don't see the point. Currently, it would produce wl18xx-firmware package, 
which at build time can substitute wl12xx-firmware with 
PREFERRED_PROVIDER_wl12xx-firmware = "wl18xx-firmware" as well as prevent 
accidental installation of both of them at the same time with those runtime R* 
variables.

-- 
Denys


> > +
> > +SRCREV = "ol_r8.a6.01"
> > +SRC_URI = "git://github.com/TI-
> > OpenLink/wl18xx_fw.git;protocol=git \
> > +           file://Makefile \
> > +          "
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +do_compile() {
> > +    :
> > +}
> > +
> > +do_install() {
> > +    cp ${WORKDIR}/Makefile ${S}
> > +    oe_runmake 'DEST_DIR=${D}' install
> > +}
> > +
> > +FILES_${PN} = "/lib/firmware/ti-connectivity/*"
> > --
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

