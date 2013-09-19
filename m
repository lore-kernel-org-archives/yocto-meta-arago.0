Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3567D52990
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2013 00:13:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8J0D8R9008042
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2013 19:13:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8J0D8nj007634
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2013 19:13:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 18 Sep 2013 19:13:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8J0D7Qp000638;
	Wed, 18 Sep 2013 19:13:07 -0500
Date: Wed, 18 Sep 2013 20:13:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130919001306.GC27021@edge>
References: <1379453285-14892-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C553C53@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED10159735181@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159735181@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Thu, 19 Sep 2013 00:13:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, that is the correct understanding - I see it exactly the same. BTW, there 
is the RDEPENDS there for the -tisdk packagegroup to depend on the base 
package:

> +RDEPENDS_${PN}-tisdk = "\
> +    ${PN} \
> +    dbus \

But I'd have to agree that while this method of overloading the packagegroup 
is technically correct and maybe innovative, I'm not sure it is the most 
obvious one. On the other hand, that is somewhat similar to how the core base 
packagegroup in oe-core (and Classic OE before) is structured and provides all 
the base-acpi, base-alsa, base-bluetooth, base-pci etc. sub-packages depending 
on DISTRO_FEATURES defined...

Either way, we would still have blah-toolchain-host and blah-toolchain-target 
packagegroups separate from the main "blah" one. So, I'm on the fence about 
which way to go with the packagegroups - one provides less files with slightly 
more convoluted syntax, while the other is simple and srtaigtforward, but then 
you may get lost in the number of files... Do you have anything else to 
convince me one way or another? :)

-- 
Denys


On Wed, Sep 18, 2013 at 03:14:52PM +0000, Maupin, Chase wrote:
> So if I understand you what you want to do is make one package group with 
> multiple output packages rather than have for example two package groups 
> where one includes the other?
> 
> One thing I see that might be difficult here is that if I look for what 
> builds the packagegroup-arago-multimedia-tisdk package I would need to know 
> that it is inside the packagegroup-arago-multimedia group.
> 
> I assume you will also have to set the RDEPENDS inside the package group too 
> for the new packages to make sure they pull in the base package.
> 
> If the overall goal is to allow people to build a file system without SDK 
> specifics I think having packagegroups that build on top of each other is a 
> cleaner way than overloading the packagegroup recipes.  However, maybe I'm 
> misunderstanding here.
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Tuesday, September 17, 2013 5:20 PM
> >To: meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [for comments][PATCH] packagegroup-
> >arago-base: Create new tisdk package
> >
> >So I want to make some changes but would like everyone's feedback.
> >
> >Overall the problem I want to solve is simple.
> >The Sitara SDK (scripts, example applications, etc..) will be
> >updated for 3.12+ Linux kernel. This will result in older
> >platforms am18x, am37x, am335x (3.2 kernel) and am3517 being
> >unable to utilize these changes and some things will end up being
> >broken. Realistically outside of individuals who want to recreate
> >a TI SDK this is not a big deal. However, no filesystem image that
> >includes gstreamer, qt, openssl, wilink, sgx exist without SDK
> >specific packages. What I want to do is create a new image that
> >wouldn't include SDK specific packages therefore providing a full
> >fledge filesystem (supports qt, gstreamer, wilink, etc..) that is
> >independent of the sdk and will continue to work for older
> >platforms .
> >
> >Other than the obvious required changes I want to update some of
> >the current packagegroups. The below patch is an example of some
> >of the changes I want to make.
> >
> >Consolidate some packagegroups:
> >	Ex. Merge packagegroup-arago-gst with packagegroup-arago-
> >tisdk-multimedia.
> >For packagegroup's that include SDK specific packages I want to
> >create a new package ${PN}-tisdk that will include these SDK
> >specific packages
> >Due to the above change the majority of packagegroup recipes will
> >drop "tisdk" from the recipe name.
> >	Ex packagegroup-arago-tisdk-multimedia.bb will be renamed to
> >packagegroup-arago-multimedia.bb.
> >	     packagegroup-arago-multimedia.bb will then include a
> >new package ${PN}-tisdk.
> >
> >This will allow the new non SDK specific image to include
> >packagegroup-arago-multimedia but the SDK specific image (i.e.
> >tisdk-rootfs-image) would include packagegroup-arago-multimedia-
> >tisdk
> >
> >The other approach I could take is to create a bunch more
> >packagegroups but I think our current number of 28 is already good
> >enough. :)
> >
> >Any questions or concerns?
> >
> >> -----Original Message-----
> >> From: Cooper Jr., Franklin
> >> Sent: Tuesday, September 17, 2013 4:28 PM
> >> To: meta-arago@arago-project.org
> >> Cc: Cooper Jr., Franklin
> >> Subject: [for comments][PATCH] packagegroup-arago-base: Create
> >new tisdk
> >> package
> >>
> >> * Consolidate packagegroups by creating a new package that will
> >contain
> >> packages
> >>   specific to the tisdk.
> >>
> >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> ---
> >>  .../packagegroups/packagegroup-arago-base-tisdk.bb |   20 -----
> >---------------
> >>  .../packagegroups/packagegroup-arago-base.bb       |   18
> >> +++++++++++++++++-
> >>  2 files changed, 17 insertions(+), 21 deletions(-)  delete mode
> >100644 meta-
> >> arago-distro/recipes-core/packagegroups/packagegroup-arago-base-
> >tisdk.bb
> >>
> >> diff --git a/meta-arago-distro/recipes-
> >core/packagegroups/packagegroup-
> >> arago-base-tisdk.bb b/meta-arago-distro/recipes-
> >> core/packagegroups/packagegroup-arago-base-tisdk.bb
> >> deleted file mode 100644
> >> index 16b5df1..0000000
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-
> >> base-tisdk.bb
> >> +++ /dev/null
> >> @@ -1,20 +0,0 @@
> >> -DESCRIPTION = "Additional packages beyond console packages
> >shared by TI
> >> SDKs"
> >> -LICENSE = "MIT"
> >> -PR = "r13"
> >> -
> >> -inherit packagegroup
> >> -
> >> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> -
> >> -RDEPENDS_${PN} = "\
> >> -    dbus \
> >> -    expat \
> >> -    glib-2.0 \
> >> -    libxml2 \
> >> -    libpcre \
> >> -    iptables \
> >> -    iperf \
> >> -    psplash \
> >> -    arago-gpl-notice \
> >> -    nfs-utils-client \
> >> -    "
> >> diff --git a/meta-arago-distro/recipes-
> >core/packagegroups/packagegroup-
> >> arago-base.bb b/meta-arago-distro/recipes-
> >> core/packagegroups/packagegroup-arago-base.bb
> >> index fd9cd15..02242c7 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-
> >> base.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-ba
> >> +++ se.bb
> >> @@ -1,6 +1,6 @@
> >>  DESCRIPTION = "Basic task to get a device booting"
> >>  LICENSE = "MIT"
> >> -PR = "r3"
> >> +PR = "r4"
> >>
> >>  inherit packagegroup
> >>
> >> @@ -23,9 +23,25 @@ ARAGO_EXTRA = "\
> >>      tcpdump \
> >>      "
> >>
> >> +PACKAGES += "${PN}-tisdk"
> >> +
> >>  # minimal set of packages - needed to boot  RDEPENDS_${PN} = "\
> >>      ${ARAGO_ALSA_BASE} \
> >>      ${ARAGO_BASE} \
> >>      ${ARAGO_EXTRA} \
> >>      "
> >> +
> >> +RDEPENDS_${PN}-tisdk = "\
> >> +    ${PN} \
> >> +    dbus \
> >> +    expat \
> >> +    glib-2.0 \
> >> +    libxml2 \
> >> +    libpcre \
> >> +    iptables \
> >> +    iperf \
> >> +    psplash \
> >> +    arago-gpl-notice \
> >> +    nfs-utils-client \
> >> +    "
> >> --
> >> 1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

