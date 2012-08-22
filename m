Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9FF0052A7A
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 22:35:45 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MMZi65017953
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 17:35:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MMZiYU004213
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 17:35:44 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 17:35:44 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7MMZikh009623;
	Wed, 22 Aug 2012 17:35:44 -0500
Date: Wed, 22 Aug 2012 18:35:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Prakash, Punya" <pprakash@ti.com>
Message-ID: <20120822223543.GJ21025@edge>
References: <1345644077-4568-1-git-send-email-fcooper@ti.com>
	<20120822220515.GB8846@denix.org>
	<92A683A2-B3B9-4146-8FC0-5CFC1B0569CE@ti.com>
	<03DB3D5A7C754F418CE076FD17499F235D1A0A7D@DLEE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <03DB3D5A7C754F418CE076FD17499F235D1A0A7D@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [meta-arago-extras][PATCH] av-examples: Port av-examples from Arago
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
X-List-Received-Date: Wed, 22 Aug 2012 22:35:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2012 at 06:32:24PM -0400, Prakash, Punya wrote:
> These examples demonstrate features of the display sub-system - such as 
> rotation, color keying et. all. The DSS is supported on AM37x and AM3517 
> based platforms only. I do not see why this cannot be added to the 
> Beagleboard, adding it to the SDK is a different discussion.

Punya,

I see. Calling them av-examples is slightly misleading then, but that explains 
the filtering. I guess a more generic "omap3" SoC should be used instead of 
listing every machine in COMAPTIBLE_MACHINES...

-- 
Denys

> -----Original Message-----
> From: Cooper Jr., Franklin 
> Sent: Wednesday, August 22, 2012 5:25 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org; Prakash, Punya
> Subject: Re: [meta-arago] [meta-arago-extras][PATCH] av-examples: Port av-examples from Arago
> 
> I believe so. We only include it in those devices SDKs for a reason but I am not sure why it is. Seeing MACHINE being passed to make also make me believe its specific to those devices. I know I tried building it for 335x and received a bunch of errors.
> 
> Punya,
> Can you verify that these examples are only for am37 and am35? Is there a reason why beagleboard couldn't be supported? Or will the code run on all of our devices? 
> 
> We can restrict which devices include this app in our SDK but shouldn't exclude other devices from running this app unless there is a reason.
> 
> On Aug 22, 2012, at 5:05 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> 
> > On Wed, Aug 22, 2012 at 09:01:17AM -0500, Franklin S Cooper Jr wrote:
> >> * Add av-examples from Arago
> >> * Convert svn repository to git. Update makefiles to create
> >>  needed directories since git doesn't allow empty directories
> >>  to be stored.
> >> 
> >> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> >> ---
> >> .../av-examples/av-examples_1.0.bb                 |   33 ++++++++++++++++++++
> >> 1 files changed, 33 insertions(+), 0 deletions(-)
> >> create mode 100644 meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> >> 
> >> diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> >> new file mode 100644
> >> index 0000000..1025f96
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> >> @@ -0,0 +1,33 @@
> >> +DESCRIPTION = "Linux Audio Video Example Applications"
> >> +HOMEPAGE = "https://gforge.ti.com/gf/project/av_examples/"
> >> +LICENSE = "BSD"
> >> +LIC_FILES_CHKSUM := "file://COPYING;md5=80ea1ff5788f65d5c5b3206d50d4bc6c"
> >> +SECTION = "system"
> >> +PRIORITY = "optional"
> >> +
> >> +PR = "r0"
> >> +
> >> +DEPENDS += "virtual/kernel"
> >> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> +
> >> +COMPATIBLE_MACHINE = "(am37x-evm|am3517-evm)"
> > 
> > We need to relax our filters for compatible machines. Those are Audio/Video 
> > examples - are they really machine specific?
> > 
> > -- 
> > Denys
> > 
> > 
> >> +BRANCH ?= "master"
> >> +SRCREV = "ac75d09d29a805d89c49dd2741b79f3069e97827"
> >> +
> >> +SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRANCH}"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +# TODO: Export LDFLAGS from Rules.make to eliminate use of INSANE_SKIP which would otherwise lead to discrepancies between host and arago binaries
> >> +INSANE_SKIP_${PN} = "True"
> >> +
> >> +do_compile() {
> >> +    touch debug
> >> +    export CROSS_COMPILE=${TARGET_PREFIX}
> >> +    make release LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" PLATFORM="${MACHINE}"
> >> +}
> >> +
> >> +do_install() {
> >> +    make DESTDIR=${D} install
> >> +}
> >> -- 
> >> 1.7.0.4
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> 

