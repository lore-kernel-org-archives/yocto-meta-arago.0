Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 0B7C15296D
	for <meta-arago@arago-project.org>;
	Mon,  1 Aug 2016 17:41:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u71HfE0J023349
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 12:41:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71HfEQP002609
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 12:41:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 Aug 2016 12:41:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71HfEba014790;
	Mon, 1 Aug 2016 12:41:14 -0500
Date: Mon, 1 Aug 2016 13:41:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20160801174113.GD3677@edge>
References: <4B26FB5A64EBA14C87266869E037F958142EFC43@DFLE09.ent.ti.com>
	<20160801165603.GB3677@edge>
	<4B26FB5A64EBA14C87266869E037F958142EFE8B@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958142EFE8B@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: gstreamer 1.6: bad plugins
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
X-List-Received-Date: Mon, 01 Aug 2016 17:41:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 01, 2016 at 01:08:22PM -0400, Stiffler, Jacob wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, August 01, 2016 12:56 PM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org; R, Karthik
> > Subject: Re: gstreamer 1.6: bad plugins
> > 
> > Surprisingly, I don't see this error in my K2 builds...
> > 
> 
> Are you building gstreamer for k2? I think we have not yet upstreamed adding 
> gstreamer to the tisdk-server images.

Huh?

http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb;hb=HEAD
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb;hb=HEAD
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb;hb=HEAD


> > On Mon, Aug 01, 2016 at 06:52:36AM -0400, Stiffler, Jacob wrote:
> > >    Karthik, Denys,
> > >
> > >
> > >
> > >    We are seeing a failure with building the gstreamer1.0-plugins-bad for k2
> > >    since upgrading to 1.6.
> > >
> > >
> > >
> > >    In file included from
> > >    ../../../../git/gst-libs/gst/drm/gstdrmallocator.c:32:0:
> > >
> > >    ../../../../git/gst-libs/gst/drm/gstdrmallocator.h:39:21: fatal error:
> > >    xf86drm.h: No such file or directory
> > >
> > >    compilation terminated.
> > >
> > >    Makefile:866: recipe for target 'libgstdrm_1.0_la-gstdrmallocator.lo'
> > >    failed
> > >
> > >    make[4]: *** [libgstdrm_1.0_la-gstdrmallocator.lo] Error 1
> > >
> > >    make[4]: Leaving directory
> > >    '/home/gtbldadm/processor-sdk-linux-krogoth-build/build-
> > CORTEX_1/arago-tmp-external-linaro-toolchain/work/k2hk_evm-linux-
> > gnueabi/gstreamer1.0-plugins-bad/1.6.3-r20/build/gst-libs/gst/drm'
> > >
> > >    Makefile:1050: recipe for target 'drm' failed
> > >
> > >
> > >
> > >
> > >
> > >    This appears to be related to
> > >    http://git.ti.com/glsdk/gstreamer1-0-plugins-
> > bad/commit/04ee4d353888a210c5ee5792ff402eb8c3d3e6e4.
> > >    Is there a config option to disable the drm allocator?
> > >
> > >
> > >
> > >    I am also curious as to why we are using different versions of these
> > >    plugins for ti33x and ti43x. Should k2 also use that commit? I am
> > >    referring to the lines in gstreamer1.0-plugins-bad_git.bbappend:
> > >
> > >
> > >
> > >      38 SRCREV = "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
> > >
> > >      39 SRCREV_ti43x = "d0160ca810be30bf2b2e7681f5047933402efb52"
> > >
> > >      40 SRCREV_ti33x = "d0160ca810be30bf2b2e7681f5047933402efb52"
> > >
> > >
> > >
> > >
> > >
> > >    Thank you,
> > >
> > >    Jake

