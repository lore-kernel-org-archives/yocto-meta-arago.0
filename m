Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7B33B52986
	for <meta-arago@arago-project.org>;
	Thu, 21 Nov 2013 04:46:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAL4k362010435
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2013 22:46:03 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAL4k3RN025979
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2013 22:46:03 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Nov 2013 22:46:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAL4k34k016464;
	Wed, 20 Nov 2013 22:46:03 -0600
Date: Wed, 20 Nov 2013 23:46:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20131121044603.GI29952@edge>
References: <20131025103440.GB13772@edge>
	<8F29D6B095ED194EA1980491A5E029710C58765A@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101597DC30B@DLEE11.ent.ti.com>
	<20131030225728.GA24696@edge>
	<CF956B779D819D41BBC043B7082161D545CFC7@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015980ADA9@DLEE11.ent.ti.com>
	<52846899.7030100@ti.com>
	<7D46E86EC0A8354091174257B2FED1015981A351@DLEE11.ent.ti.com>
	<52859B1E.5060503@ti.com> <20131115074343.GB19813@edge>
MIME-Version: 1.0
In-Reply-To: <20131115074343.GB19813@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr.,	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 0/5] GStreamer multimedia framework and plugins recipes
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
X-List-Received-Date: Thu, 21 Nov 2013 04:46:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 15, 2013 at 02:43:44AM -0500, Denys Dmytriyenko wrote:
> On Fri, Nov 15, 2013 at 09:25:10AM +0530, Siddharth Heroor wrote:
> > On 11/14/2013 7:44 PM, Maupin, Chase wrote:
> > >>-----Original Message-----
> > >>From: Heroor, Siddharth
> > >>Sent: Thursday, November 14, 2013 12:07 AM
> > >>To: Maupin, Chase; Hingolikar, Mrinmayee; Dmytriyenko, Denys
> > >>Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> > >>Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
> > >>framework and plugins recipes
> > >>
> > >>On 11/11/2013 8:05 PM, Maupin, Chase wrote:
> > >>>Mrinmayee,
> > >>>
> > >>>Some things that would help would be if you could give us an
> > >>idea about the following:
> > >>>1. What are these patches adding?  Are they adding new
> > >>components?
> > >>As I mentioned these patches are a result of the GLP work on
> > >>OMAP4.
> > >>>2. If new components are being added why not create a separate
> > >>project for them so that it is easier to work on moving them along
> > >>with different releases of gstreamer?  Basically split out the
> > >>"base" gstreamer and the new elements.  This way if another group
> > >>wants to look at supporting a different gstreamer version your
> > >>changes are isolated from the gstreamer base.
> > >>
> > >>>3. For patches against gstreamer elements what is the
> > >>plan/schedule for pushing those patches up to the gstreamer
> > >>mainline to minimize what is being carried?
> > >>>This basically boils down to what is the roadmap tomorrow to
> > >>being ready to adapt to new gstreamer releases and reduce this
> > >>patchset?  What is the plan for handling migrations and is a
> > >>consolidated code base the easiest way to do this?
> > >>Interestingly, as an example, the original work on gst-wayland was
> > >>part
> > >>of a separate plugin - gst-ducati. As part of the GLP work, this
> > >>was
> > >>moved to gst-plugins-ugly. Upstream GStreamer have a proposal for
> > >>a
> > >>Wayland Sink that we will need to move to in the future. So, the
> > >>way I
> > >>see it, these are specific to current work and not a roadmap.
> > >>
> > >>The choices are either we carry the patches on glsdk staging tree
> > >>or we
> > >>host them on meta-ti as a separate recipe because I see that we
> > >>will
> > >>need to move to GStreamer 1.x in the future regardless. Either
> > >>way, we
> > >>are carrying patches that we inherited and now are getting flack
> > >>for
> > >>someone else not upstreaming them 2 years ago when we weren't even
> > >>involved. :-(
> 
> > >Not trying to give you flack.  Just trying to understand what was going on 
> > >and if there was a better way to separate this code to make it more 
> > >portable.  Knowing there is a plan to get to 1.x is a good thing and helps 
> > >us in making a recommendation on how to proceed.  I think we can work with 
> > >these recipes, but they need to be modified to not apply to all devices but 
> > >instead limit them to your device.
> > 
> > Right. Let's limit the recipes to OMAP5 and J6 but is it possible
> > for it to be built and tested in the Core SDK context? Or do you
> > recommend that we use -glsdk.bb for the recipe and give a preferred
> > provider in the branding file?
> 
> There are 2 options:
> 
> 1. create separate -glsdk versions of the recipe (gstreamer and all plugins) 
> and then in the arago.conf point preferred provider to those recipes for omap5 
> and j6 platforms (or entire omap-a15 SOC family)
> 
> 2. re-use the same recipes (or rather bbappends, since we don't carry complete 
> recipes in meta-arago) and then machine-override necessary variables, like 
> SRC_URI to point to your trees, but only for specific machines. E.g. 
> SRC_URI_omap-a15 = "git://omapzoom.org..." or SRC_URI_append_omap-a15 = 
> "file://some.patch"
> 
> The first one is cleaner and easier to maintain, but also easier to diverge or 
> get stale...

Sid, Mrinmayee,

Have you decided how you want to proceed in this case?

-- 
Denys


> > >>>>-----Original Message-----
> > >>>>From: Hingolikar, Mrinmayee
> > >>>>Sent: Monday, November 11, 2013 12:16 AM
> > >>>>To: Dmytriyenko, Denys; Maupin, Chase
> > >>>>Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> > >>>>Subject: RE: [meta-arago] [PATCH 0/5] GStreamer multimedia
> > >>>>framework and plugins recipes
> > >>>>
> > >>>>I was on a long vacation, so I apologize for the delay in
> > >>>>response.
> > >>>>Here are the no. of patches on top of standard GStreamer.
> > >>>>
> > >>>>Gstreamer - 15
> > >>>>Gstreamer base plugins - 56
> > >>>>Gstreamer good plugins - 11
> > >>>>Gstreamer bad plugins - 195
> > >>>>
> > >>>>Based on Franklin's suggestions and discussions with Sid, we
> > >>have
> > >>>>decided to create new recipes with unique identifiers, for eg.
> > >>>>gstreamer-glsdk.
> > >>>>Kindly let me know if this approach is fine with you.
> > >>>>
> > >>>>Regards,
> > >>>>Mrinmayee
> > >>>>
> > >>>>>-----Original Message-----
> > >>>>>From: Dmytriyenko, Denys
> > >>>>>Sent: Thursday, October 31, 2013 4:27 AM
> > >>>>>To: Maupin, Chase
> > >>>>>Cc: Cooper Jr., Franklin; Hingolikar, Mrinmayee; meta-
> > >>>>arago@arago-
> > >>>>>project.org
> > >>>>>Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
> > >>>>framework
> > >>>>>and plugins recipes
> > >>>>>
> > >>>>>Mrinmayee,
> > >>>>>
> > >>>>>Myself, Franklin and Chase have asked you to estimate the
> > >>amount
> > >>>>and
> > >>>>>size of the patches that you have in your gstreamer trees. And
> > >>>>you
> > >>>>>still have not answered that.
> > >>>>>
> > >>>>>The reason we are asking this simple question is because the
> > >>>>changes
> > >>>>>you are making to the recipes will affect others and cannot be
> > >>>>accepted
> > >>>>>as is. You would need to use machine override VAR_omap-a15
> > >>>>instead of
> > >>>>>COMPATIBLE_MACHINE and depending on the amount and size of the
> > >>>>patches,
> > >>>>>you either simply apply them just for your machine, or change
> > >>>>the
> > >>>>>SRC_URI completely for your machine.
> > >>>>>
> > >>>>>Either way, I would like to encourage you to participate in
> > >>the
> > >>>>>discussion and not just disappear. Thank you.
> > >>>>>
> > >>>>>--
> > >>>>>Denys
> > >>>>>
> > >>>>>
> > >>>>>On Fri, Oct 25, 2013 at 12:08:48PM -0400, Maupin, Chase wrote:
> > >>>>>>>-----Original Message-----
> > >>>>>>>From: meta-arago-bounces@arago-project.org [mailto:meta-
> > >>>>arago-
> > >>>>>>>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > >>>>>>>Sent: Friday, October 25, 2013 10:27 AM
> > >>>>>>>To: Dmytriyenko, Denys; Hingolikar, Mrinmayee
> > >>>>>>>Cc: meta-arago@arago-project.org
> > >>>>>>>Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
> > >>>>>>>framework and plugins recipes
> > >>>>>>>
> > >>>>>>>All of your appends are currently blocking all of the
> > >>>>gstreamer
> > >>>>>>>plugins for all machines other than omap-a15. There is no
> > >>way
> > >>>>to
> > >>>>>>>only apply a bbappend for a specific machine and have all
> > >>>>other
> > >>>>>>>machines ignore the bbappend.
> > >>>>>>>
> > >>>>>>>Depending on your patch set on top of the standard gstreamer
> > >>>>>>>sources it probably would be better to break out the patches
> > >>>>from
> > >>>>>>>your git repo and add it to the SRC_URI for only the omap
> > >>>>machine.
> > >>>>>>This may be preferred just to help keep from getting locked
> > >>to
> > >>>>>particular
> > >>>>>>gstreamer version and make clear the changeds on top.  But
> > >>>>number of
> > >>>>>patches
> > >>>>>>is something that would weigh in here.
> > >>>>>>
> > >>>>>>>Another approach would be to create a "new "recipe called
> > >>>>omap-
> > >>>>>>><base recipe name> that "requires/includes" the base
> > >>>>gstreamer
> > >>>>>>>recipe and then you can override whatever you want. Take a
> > >>>>look at
> > >>>>>>>the qt4-embedded-gles_4.8.4.bb recipe.
> > >>>>>>>http://arago-project.org/git/?p=meta-
> > >>arago.git;a=blob;f=meta-
> > >>>>>>>arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb
> > >>>>>>>
> > >>>>>>>Or
> > >>>>>>>Create new recipes with some unique identifier to indicate
> > >>>>this
> > >>>>>>>isn't the standard gstreamer.
> > >>>>>>If not patches one of the above seems right.
> > >>>>>>
> > >>>>>>>Others may have other approaches that they recommend.
> > >>>>>>>
> > >>>>>>>>-----Original Message-----
> > >>>>>>>>From: meta-arago-bounces@arago-project.org [mailto:meta-
> > >>>>arago-
> > >>>>>>>>bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > >>>>>>>>Sent: Friday, October 25, 2013 5:35 AM
> > >>>>>>>>To: Hingolikar, Mrinmayee
> > >>>>>>>>Cc: meta-arago@arago-project.org
> > >>>>>>>>Subject: Re: [meta-arago] [PATCH 0/5] GStreamer multimedia
> > >>>>>>>framework and
> > >>>>>>>>plugins recipes
> > >>>>>>>>
> > >>>>>>>>On Fri, Oct 25, 2013 at 03:03:35PM +0530, Mrinmayee
> > >>>>Hingolikar
> > >>>>>>>wrote:
> > >>>>>>>>>This patch-set adds GStreamer framework and its plugins:
> > >>>>>>>>>base, good, bad and ugly.
> > >>>>>>>>>
> > >>>>>>>>>The development trees for all of these components are
> > >>>>>>>mainitained at
> > >>>>>>>>>git.ti.com and they are based on top of the Freedesktop
> > >>>>>>>releases.
> > >>>>>>>>Why? How large is the patchset on top of upstream?
> > >>>>>>>>
> > >>>>>>>>
> > >>>>>>>>>Mrinmayee Hingolikar (5):
> > >>>>>>>>>    multimedia: Add GStreamer multimedia framework.
> > >>>>>>>>>    multimedia: GStreamer base plugins
> > >>>>>>>>>    multimedia: GStreamer good plugins
> > >>>>>>>>>    multimedia: GStreamer bad plugins
> > >>>>>>>>>    multimedia: GStreamer ugly plugins.
> > >>>>>>>>>
> > >>>>>>>>>   .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |
> > >>>>25
> > >>>>>>>>++++++++++++++++++++
> > >>>>>>>>>   .../gstreamer/gst-plugins-base_0.10.36.bbappend    |
> > >>>>22
> > >>>>>>>>+++++++++++++++++
> > >>>>>>>>>   .../gstreamer/gst-plugins-good_0.10.31.bbappend    |
> > >>>>20
> > >>>>>>>>++++++++++++++++
> > >>>>>>>>>   .../gstreamer/gst-plugins-ugly_0.10.18.bb          |
> > >>>>23
> > >>>>>>>++++++++++++++++++
> > >>>>>>>>>   .../gstreamer/gstreamer_0.10.36.bbappend           |
> > >>>>16
> > >>>>>>>+++++++++++++
> > >>>>>>>>>   5 files changed, 106 insertions(+)
> > >>>>>>>>>   create mode 100644
> > >>>>>>>>>meta-arago-extras/recipes-multimedia/gstreamer/gst-
> > >>>>plugins-
> > >>>>>>>bad_0.10.23
> > >>>>>>>>>.bbappend  create mode 100644
> > >>>>>>>>>meta-arago-extras/recipes-multimedia/gstreamer/gst-
> > >>>>plugins-
> > >>>>>>>base_0.10.3
> > >>>>>>>>>6.bbappend  create mode 100644
> > >>>>>>>>>meta-arago-extras/recipes-multimedia/gstreamer/gst-
> > >>>>plugins-
> > >>>>>>>good_0.10.3
> > >>>>>>>>>1.bbappend  create mode 100644
> > >>>>>>>>>meta-arago-extras/recipes-multimedia/gstreamer/gst-
> > >>>>plugins-
> > >>>>>>>ugly_0.10.1
> > >>>>>>>>>8.bb  create mode 100644
> > >>>>>>>>>meta-arago-extras/recipes-
> > >>>>>>>multimedia/gstreamer/gstreamer_0.10.36.bbapp
> > >>>>>>>>>end
> > >>>>>>>>>
> > >>>>>>>>>--
> > >>>>>>>>>1.7.9.5
> > >>>>>>>>>
> > >>>>>>>>>_______________________________________________
> > >>>>>>>>>meta-arago mailing list
> > >>>>>>>>>meta-arago@arago-project.org
> > >>>>>>>>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> > >>>>arago
> > >>>>>>>>_______________________________________________
> > >>>>>>>>meta-arago mailing list
> > >>>>>>>>meta-arago@arago-project.org
> > >>>>>>>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> > >>>>arago
> > >>>>>>>_______________________________________________
> > >>>>>>>meta-arago mailing list
> > >>>>>>>meta-arago@arago-project.org
> > >>>>>>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >>>_______________________________________________
> > >>>meta-arago mailing list
> > >>>meta-arago@arago-project.org
> > >>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

