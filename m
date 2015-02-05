Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0B193529A7
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 17:14:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15HEQEB026832
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:14:26 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15HEO3o004173
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:14:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 11:14:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15HEOGv006265;
	Thu, 5 Feb 2015 11:14:24 -0600
Date: Thu, 5 Feb 2015 12:14:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150205171423.GL9943@edge>
References: <1423152936-3396-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7F91C3@DFLE08.ent.ti.com>
	<20150205165237.GJ9943@edge>
	<8F29D6B095ED194EA1980491A5E029710C7F926D@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7F926D@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sysvinit: Changing default setting to add HWCLOCKACCESS=no
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
X-List-Received-Date: Thu, 05 Feb 2015 17:14:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 12:08:09PM -0500, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, February 05, 2015 10:53 AM
> > To: Cooper Jr., Franklin
> > Cc: Nelson, Sam; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] sysvinit: Changing default setting to add
> > HWCLOCKACCESS=no
> > 
> > This was supposed to be an RFC, by the way...
> > 
> > 
> > On Thu, Feb 05, 2015 at 04:45:43PM +0000, Cooper Jr., Franklin wrote:
> > > I see references to several boards that have enabled rtc in its dts
> > > file. I didn't check all the boards we support in meta-ti but
> > > additional boards may use it. So we shouldn't disable it for these boards.
> > 
> > Exactly, so the proposal was to disable it by default and enable through
> > machine overrides for those boards that have it.

> [Franklin] I'm assuming there was some conversation in the background 
> regarding this patch

Well, not about the patch, but about the problem this patch is trying to fix :)


> I wasn't aware of since the above two points weren't 
> clear. But no problem doing with what you suggested as long as enabling it 
> for the right boards is being done as part of a patch series with this one.

Do we have a list of boards that have RTC? Just glancing over what I have I 
don't see any...

As an alternative, we can keep it enabled by default and disable it just for 
Keystone to make Sam happy. But I've seen that error on pretty much every 
platform lately.


> > > Honestly if the error is harmless I would say just ignore it.
> > 
> > That was my initial response - the error is harmless, just ignore it. Not good
> > for OOB experience, I guess :)
> > 
> > 
> > > Use some variable that will
> > > conditional add that string depending on the machine if you want to disable
> > > it for the machines you care about.
> > 
> > Just use machine overrides directly, no need to invent another variable...
> [Franklin] I'll go with whatever you prefer. 
> > 
> > 
> > > Honestly creating a file just to cat it's value to another file I feel is a
> > > bit of an overkill especially since that file isn't generic and is meant for
> > > hwclock. So just using echoing something would probably be better.
> > >
> > > DISABLE_RTC = ""
> > > DISABLE_<machine> = "yes"
> > > ....
> > >
> > > do_install_append() {
> > > 	if [ "${DISABLE_RTC}" = "yes" ]
> > > 	then
> > > 		echo "#This is to indicate hwclock is not supported" >>
> > ${D}${sysconfdir}/default/rcS
> > > 		echo "HWCLOCKACCESS=no"
> > > 	fi
> > > }
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > > > Sent: Thursday, February 05, 2015 10:16 AM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCH] sysvinit: Changing default setting to add
> > > > HWCLOCKACCESS=no
> > > >
> > > > - realtime clock is not commonly present and hence adding
> > > >   HWCLOCKACCESS=no
> > > > - Avoids error message if rc device not present
> > > >
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > ---
> > > >  .../recipes-core/sysvinit/files/hwclock.rcS        |    2 ++
> > > >  .../sysvinit/sysvinit_2.88dsf.bbappend             |    9 +++++++++
> > > >  2 files changed, 11 insertions(+)
> > > >  create mode 100644 meta-arago-distro/recipes-
> > core/sysvinit/files/hwclock.rcS
> > > >  create mode 100644 meta-arago-distro/recipes-
> > > > core/sysvinit/sysvinit_2.88dsf.bbappend
> > > >
> > > > diff --git a/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> > b/meta-
> > > > arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> > > > new file mode 100644
> > > > index 0000000..3e26c20
> > > > --- /dev/null
> > > > +++ b/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> > > > @@ -0,0 +1,2 @@
> > > > +# This is to indicate hwclock is not supported HWCLOCKACCESS=no
> > > > diff --git a/meta-arago-distro/recipes-
> > core/sysvinit/sysvinit_2.88dsf.bbappend
> > > > b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
> > > > new file mode 100644
> > > > index 0000000..6e08c83
> > > > --- /dev/null
> > > > +++ b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
> > > > @@ -0,0 +1,9 @@
> > > > +PR_append = "-arago0"
> > > > +
> > > > +# look for files in this layer first
> > > > +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> > > > +SRC_URI += "file://hwclock.rcS"
> > > > +do_install_append () {
> > > > +# Add hwclock configuration
> > > > +	cat ${WORKDIR}/hwclock.rcS >> ${D}${sysconfdir}/default/rcS }
> > > > --
> > > > 1.7.9.5
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

