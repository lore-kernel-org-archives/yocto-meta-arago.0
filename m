Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 1CEBC52961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 15:50:13 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV004L55AI2381@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 18 Mar 2013 10:49:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7C3A820031; Mon,
	18 Mar 2013 11:49:30 -0400 (EDT)
Date: Mon, 18 Mar 2013 11:49:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-id: <20130318154930.GB14761@denix.org>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
	<1363613762-6537-2-git-send-email-eyalr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159480CD2@DLEE11.ent.ti.com>
	<8665E2433BC68541A24DFFCA87B70F5B17C504D9@DNCE04.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8665E2433BC68541A24DFFCA87B70F5B17C504D9@DNCE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/9] wl18xx-firmware: install Wilink8 wlan	firmware files
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
X-List-Received-Date: Mon, 18 Mar 2013 15:50:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 18, 2013 at 03:41:44PM +0000, Reizer, Eyal wrote:
> Hi,
> 
> Comments inline,
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Monday, March 18, 2013 5:35 PM
> > To: Eyal Reizer; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 2/9] wl18xx-firmware: install Wilink8
> > wlan firmware files
> > 
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Eyal Reizer
> > > Sent: Monday, March 18, 2013 8:36 AM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH 2/9] wl18xx-firmware: install
> > > Wilink8 wlan firmware files
> > >
> > > Add a recipe for installing the Wilink8 wlan firmware files into the
> > > target file system.
> > >
> > > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > > ---
> > >  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
> > >  .../wl18xx-firmware/wl18xx-firmware_git.bb         |   28
> > > ++++++++++++++++++++
> > >  2 files changed, 35 insertions(+)
> > >  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> > > firmware/wl18xx-firmware/Makefile
> > >  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> > > firmware/wl18xx-firmware_git.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> > > firmware/wl18xx-firmware/Makefile b/meta-arago-extras/recipes-
> > > bsp/wl18xx-firmware/wl18xx-firmware/Makefile
> > > new file mode 100644
> > > index 0000000..0bb7ab8
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > firmware/Makefile
> > > @@ -0,0 +1,7 @@
> > > +# Installs the the ti-connectiviy wlan firmware files into the
> > > root file system
> > > +
> > > +install:
> > > +	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
> > > +	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
> > > +	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
> > > +
> > > diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> > > firmware/wl18xx-firmware_git.bb b/meta-arago-extras/recipes-
> > > bsp/wl18xx-firmware/wl18xx-firmware_git.bb
> > 
> > Same comment as Franklin had about the wlconf recipe.  Should you drop
> > the _git version if you are going to be using releases with a version?
> > 
> 
> E.R: Will be fixed
> 
> > > new file mode 100644
> > > index 0000000..43c40bb
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > firmware_git.bb
> > > @@ -0,0 +1,28 @@
> > > +DESCRIPTION = "Firmware files for use with TI wl18xx"
> > > +LICENSE = "TI-TSPA"
> > > +LIC_FILES_CHKSUM =
> > > "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
> > > +
> > > +PACKAGE_ARCH = "all"
> > > +
> > > +PR = "r1+gitr${SRCREV}"
> > > +
> > > +PROVIDES += "wl12xx-firmware"
> > > +RPROVIDES += "wl12xx-firmware"
> > 
> > Why does this PROVIDES and RPROVIDES wl12xx-firmware?  Shouldn't this
> > be wl18xx-firmware?
> 
> E.R: This is the intention so it will actually provide the same packages as 
> the wilink6 recipe and based on the PREFFERED_PROVIDER in arago.conf it will 
> be picked up instead.
> 
> > 
> > Should this RCONFLICTS with wl12xx-firmware?  Or is it OK to install
> > both?   Does it make sense to install both though if they cannot co-
> > exist?
> 
> E.R: As there is a selection in arago.conf between them is it really needed?

The PREFERRED_PROVIDER or PREFERRED_VERSION selects one or another at build 
time. You still need to use RPROVIDES, RREPLACES and RCONFLICTS to tell the 
package manager (i.e. opkg) that those packages cannot be installed at the 
same time. That basically covers the run-time part, besides build-time.

-- 
Denys

