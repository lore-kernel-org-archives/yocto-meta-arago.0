Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 6A0AB52090
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2013 16:10:22 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTD00L55RKOKOW0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 19 Sep 2013 11:10:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4CF3320120; Thu,
	19 Sep 2013 12:09:59 -0400 (EDT)
Date: Thu, 19 Sep 2013 12:09:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130919160959.GA23370@denix.org>
References: <1379453285-14892-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C553C53@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED10159735181@DLEE11.ent.ti.com>
	<20130919001306.GC27021@edge>
	<8F29D6B095ED194EA1980491A5E029710C5568A7@DFLE08.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C5568A7@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [for comments][PATCH] packagegroup-arago-base: Create new tisdk package
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
X-List-Received-Date: Thu, 19 Sep 2013 16:10:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Sep 19, 2013 at 03:14:07PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, September 18, 2013 7:13 PM
> > To: Maupin, Chase
> > Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [for comments][PATCH] packagegroup-arago-base:
> > Create new tisdk package
> > 
> > Yes, that is the correct understanding - I see it exactly the same. BTW, there is
> > the RDEPENDS there for the -tisdk packagegroup to depend on the base
> > package:
> > 
> > > +RDEPENDS_${PN}-tisdk = "\
> > > +    ${PN} \
> > > +    dbus \
> > 
> > But I'd have to agree that while this method of overloading the packagegroup is
> > technically correct and maybe innovative, I'm not sure it is the most obvious
> > one. On the other hand, that is somewhat similar to how the core base
> > packagegroup in oe-core (and Classic OE before) is structured and provides all
> > the base-acpi, base-alsa, base-bluetooth, base-pci etc. sub-packages depending
> > on DISTRO_FEATURES defined...
> > 
> > Either way, we would still have blah-toolchain-host and blah-toolchain-target
> > packagegroups separate from the main "blah" one. So, I'm on the fence about
> > which way to go with the packagegroups - one provides less files with slightly
> > more convoluted syntax, while the other is simple and srtaigtforward, but then
> > you may get lost in the number of files... Do you have anything else to convince
> > me one way or another? :)
> [Franklin] 
> 
> I do understand that this approach isn't straightforward but packagegroups 
> are just another type of "recipe". A lot of traditional recipes have custom 
> packages which briefly causes slight confusion for newcomers but it's done 
> in a lot of places since the only alternative would be to deal with a crap 
> load of files.
> 
> A quick search shows that the following packagegroups end up doing something 
> similar to what I want to do. These packages span oe-core and meta-oe.
> Packagegroup-cli-tools.bb
> Packagegroup-core-qt.bb
> Packagegroup-core-clutter.bb
> Packagegroup-core-basic.bb
> Packagegroup-core-x11.bb
> Packagegroup-base.bb

Yes, I'm quite familiar with how it's done upstream and I wasn't saying it was 
something totally new and unexpected. As a matter of fact, I already pointed 
out this particular example of packagegroup-base.bb above, that produces 
multiple packages for -base-alsa, -base-pci etc.

Anyway, if we agree to take this approach and can do it in a clean way, we 
should be able to minimize any confusion with how all packagegroups fit 
together and depend on each other... So, I'm personally fine with it.


> Packagegroup-elf-standalone-sdk-target.bb
> Packagegroup-core-x11-sato.bb
> Packagegroup-core-lsb.bb
> Packagegroup-self-hosted.bb
> 
> So the concept of custom PACKAGES of course isn't new and although not 
> frequently done applying this concept to packagegroups is also not new.
> 
> Out of all the fancy logic we sometimes use in recipes I think this would be 
> one of the simplest for users to comprehend :).
> 
> 
> 
> > 
> > --
> > Denys
> > 
> > 
> > On Wed, Sep 18, 2013 at 03:14:52PM +0000, Maupin, Chase wrote:
> > > So if I understand you what you want to do is make one package group with
> > > multiple output packages rather than have for example two package groups
> > > where one includes the other?
> > >
> > > One thing I see that might be difficult here is that if I look for what
> > > builds the packagegroup-arago-multimedia-tisdk package I would need to
> > know
> > > that it is inside the packagegroup-arago-multimedia group.
> > >
> > > I assume you will also have to set the RDEPENDS inside the package group too
> > > for the new packages to make sure they pull in the base package.
> > >
> > > If the overall goal is to allow people to build a file system without SDK
> > > specifics I think having packagegroups that build on top of each other is a
> > > cleaner way than overloading the packagegroup recipes.  However, maybe I'm
> > > misunderstanding here.
> > >
> > > >-----Original Message-----
> > > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > > >Sent: Tuesday, September 17, 2013 5:20 PM
> > > >To: meta-arago@arago-project.org
> > > >Subject: Re: [meta-arago] [for comments][PATCH] packagegroup-
> > > >arago-base: Create new tisdk package
> > > >
> > > >So I want to make some changes but would like everyone's feedback.
> > > >
> > > >Overall the problem I want to solve is simple.
> > > >The Sitara SDK (scripts, example applications, etc..) will be
> > > >updated for 3.12+ Linux kernel. This will result in older
> > > >platforms am18x, am37x, am335x (3.2 kernel) and am3517 being
> > > >unable to utilize these changes and some things will end up being
> > > >broken. Realistically outside of individuals who want to recreate
> > > >a TI SDK this is not a big deal. However, no filesystem image that
> > > >includes gstreamer, qt, openssl, wilink, sgx exist without SDK
> > > >specific packages. What I want to do is create a new image that
> > > >wouldn't include SDK specific packages therefore providing a full
> > > >fledge filesystem (supports qt, gstreamer, wilink, etc..) that is
> > > >independent of the sdk and will continue to work for older
> > > >platforms .
> > > >
> > > >Other than the obvious required changes I want to update some of
> > > >the current packagegroups. The below patch is an example of some
> > > >of the changes I want to make.
> > > >
> > > >Consolidate some packagegroups:
> > > >	Ex. Merge packagegroup-arago-gst with packagegroup-arago-
> > > >tisdk-multimedia.
> > > >For packagegroup's that include SDK specific packages I want to
> > > >create a new package ${PN}-tisdk that will include these SDK
> > > >specific packages
> > > >Due to the above change the majority of packagegroup recipes will
> > > >drop "tisdk" from the recipe name.
> > > >	Ex packagegroup-arago-tisdk-multimedia.bb will be renamed to
> > > >packagegroup-arago-multimedia.bb.
> > > >	     packagegroup-arago-multimedia.bb will then include a
> > > >new package ${PN}-tisdk.
> > > >
> > > >This will allow the new non SDK specific image to include
> > > >packagegroup-arago-multimedia but the SDK specific image (i.e.
> > > >tisdk-rootfs-image) would include packagegroup-arago-multimedia-
> > > >tisdk
> > > >
> > > >The other approach I could take is to create a bunch more
> > > >packagegroups but I think our current number of 28 is already good
> > > >enough. :)
> > > >
> > > >Any questions or concerns?
> > > >
> > > >> -----Original Message-----
> > > >> From: Cooper Jr., Franklin
> > > >> Sent: Tuesday, September 17, 2013 4:28 PM
> > > >> To: meta-arago@arago-project.org
> > > >> Cc: Cooper Jr., Franklin
> > > >> Subject: [for comments][PATCH] packagegroup-arago-base: Create
> > > >new tisdk
> > > >> package
> > > >>
> > > >> * Consolidate packagegroups by creating a new package that will
> > > >contain
> > > >> packages
> > > >>   specific to the tisdk.
> > > >>
> > > >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > >> ---
> > > >>  .../packagegroups/packagegroup-arago-base-tisdk.bb |   20 -----
> > > >---------------
> > > >>  .../packagegroups/packagegroup-arago-base.bb       |   18
> > > >> +++++++++++++++++-
> > > >>  2 files changed, 17 insertions(+), 21 deletions(-)  delete mode
> > > >100644 meta-
> > > >> arago-distro/recipes-core/packagegroups/packagegroup-arago-base-
> > > >tisdk.bb
> > > >>
> > > >> diff --git a/meta-arago-distro/recipes-
> > > >core/packagegroups/packagegroup-
> > > >> arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > > >> core/packagegroups/packagegroup-arago-base-tisdk.bb
> > > >> deleted file mode 100644
> > > >> index 16b5df1..0000000
> > > >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > >arago-
> > > >> base-tisdk.bb
> > > >> +++ /dev/null
> > > >> @@ -1,20 +0,0 @@
> > > >> -DESCRIPTION = "Additional packages beyond console packages
> > > >shared by TI
> > > >> SDKs"
> > > >> -LICENSE = "MIT"
> > > >> -PR = "r13"
> > > >> -
> > > >> -inherit packagegroup
> > > >> -
> > > >> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > >> -
> > > >> -RDEPENDS_${PN} = "\
> > > >> -    dbus \
> > > >> -    expat \
> > > >> -    glib-2.0 \
> > > >> -    libxml2 \
> > > >> -    libpcre \
> > > >> -    iptables \
> > > >> -    iperf \
> > > >> -    psplash \
> > > >> -    arago-gpl-notice \
> > > >> -    nfs-utils-client \
> > > >> -    "
> > > >> diff --git a/meta-arago-distro/recipes-
> > > >core/packagegroups/packagegroup-
> > > >> arago-base.bb b/meta-arago-distro/recipes-
> > > >> core/packagegroups/packagegroup-arago-base.bb
> > > >> index fd9cd15..02242c7 100644
> > > >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > >arago-
> > > >> base.bb
> > > >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > >arago-ba
> > > >> +++ se.bb
> > > >> @@ -1,6 +1,6 @@
> > > >>  DESCRIPTION = "Basic task to get a device booting"
> > > >>  LICENSE = "MIT"
> > > >> -PR = "r3"
> > > >> +PR = "r4"
> > > >>
> > > >>  inherit packagegroup
> > > >>
> > > >> @@ -23,9 +23,25 @@ ARAGO_EXTRA = "\
> > > >>      tcpdump \
> > > >>      "
> > > >>
> > > >> +PACKAGES += "${PN}-tisdk"
> > > >> +
> > > >>  # minimal set of packages - needed to boot  RDEPENDS_${PN} = "\
> > > >>      ${ARAGO_ALSA_BASE} \
> > > >>      ${ARAGO_BASE} \
> > > >>      ${ARAGO_EXTRA} \
> > > >>      "
> > > >> +
> > > >> +RDEPENDS_${PN}-tisdk = "\
> > > >> +    ${PN} \
> > > >> +    dbus \
> > > >> +    expat \
> > > >> +    glib-2.0 \
> > > >> +    libxml2 \
> > > >> +    libpcre \
> > > >> +    iptables \
> > > >> +    iperf \
> > > >> +    psplash \
> > > >> +    arago-gpl-notice \
> > > >> +    nfs-utils-client \
> > > >> +    "
> > > >> --
> > > >> 1.7.0.4
> > > >
> > > >_______________________________________________
> > > >meta-arago mailing list
> > > >meta-arago@arago-project.org
> > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

