Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 94BEC52A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:32:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJWSWt005155;
	Fri, 20 Jun 2014 14:32:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJWSTX023716;
	Fri, 20 Jun 2014 14:32:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Jun 2014 14:32:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJWR3p007221;
	Fri, 20 Jun 2014 14:32:27 -0500
Date: Fri, 20 Jun 2014 15:32:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140620193227.GF1825@edge>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-18-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6D61C9@DFLE08.ent.ti.com>
	<20140620191312.GB1825@edge>
	<8F29D6B095ED194EA1980491A5E029710C6D638E@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D638E@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 17/19] arago.conf: with unification on mainline, remove PACKAGE_ARCH logic
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
X-List-Received-Date: Fri, 20 Jun 2014 19:32:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 20, 2014 at 03:22:39PM -0400, Cooper Jr., Franklin wrote:
> I'm a bit worried when there is an overlap LTS overlap (working on 
> unreleased LTS sdk while previously release LTS is available). But I'm ok 
> with removing it for now and possibly resurrecting it in the future.

It's very kludgy and causes more problems than it solves. E.g. the one I 
previously fixed with TOOLCHAIN variable. Plus it multiplies the build time - 
almosot no sharing is possible between generic armv7a packages...


> It think we should also do a cleanup of old kernels in meta-ti to reflect 
> this change.

That's the plan.


> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, June 20, 2014 2:13 PM
> > To: Cooper Jr., Franklin
> > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 17/19] arago.conf: with unification on
> > mainline, remove PACKAGE_ARCH logic
> > 
> > I meant unification on mainline kernel, or at least the same version of the
> > kernel used for all our platforms.
> > 
> > On the other hand, there's nothing to fix. If a package builds differently when
> > used with different linux-libc-headers version, then it should be rather
> > marked machine-specific. In other words, if it's generic to all armv7a
> > platforms, it shouldn't matter what linux-libc-headers it builds against, as that
> > provides kernel-userspace API and it should be rather stable.
> > 
> > 
> > On Fri, Jun 20, 2014 at 07:08:52PM +0000, Cooper Jr., Franklin wrote:
> > > Does this mean that a fix for this issue was pushed to mainline?
> > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Friday, June 20, 2014 12:57 PM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCH 17/19] arago.conf: with unification on
> > > > mainline, remove PACKAGE_ARCH logic
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  meta-arago-distro/conf/distro/arago.conf | 9 ---------
> > > >  1 file changed, 9 deletions(-)
> > > >
> > > > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> > > > distro/conf/distro/arago.conf index 7bd1de2..b652fda 100644
> > > > --- a/meta-arago-distro/conf/distro/arago.conf
> > > > +++ b/meta-arago-distro/conf/distro/arago.conf
> > > > @@ -72,12 +72,3 @@ ENTERPRISE_DISTRO = "1"
> > > >  # Arago based SDK. No need to prevent gst-ffmpeg from being used
> > > > since we # disable troublesome software.
> > > >  LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
> > > > -
> > > > -# Some machines with the same architecture use different kernel
> > versions.
> > > > -# Set PACKAGE_ARCH to allow packages to be seperated by both
> > > > architecture and -# linux-libc-headers version.
> > > > -PACKAGE_ARCH := "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-
> > > > headers}"
> > > > -# Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS
> > > > variable - PACKAGE_ARCHS +=
> > > > "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-
> > > > headers}"
> > > > -# Adjust some vars accordingly
> > > > -STAGING_BINDIR_TOOLCHAIN =
> > > > "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}-
> > > > ${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-
> > > > ${TARGET_OS}"
> > > > --
> > > > 2.0.0
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

