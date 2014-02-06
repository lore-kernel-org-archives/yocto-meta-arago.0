Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 253FB52A38
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 15:28:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16FS1qG007079
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:28:01 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16FS10s017189
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:28:01 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 09:28:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16FS0ga012652;
	Thu, 6 Feb 2014 09:28:01 -0600
Date: Thu, 6 Feb 2014 10:28:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140206152800.GI18784@edge>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
	<1391630646-9727-4-git-send-email-Chase.Maupin@ti.com>
	<20140206000015.GC22890@denix.org>
	<7D46E86EC0A8354091174257B2FED1015994FE9D@DLEE11.ent.ti.com>
	<20140206151854.GE18784@edge>
	<7D46E86EC0A8354091174257B2FED1015995045B@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015995045B@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/6] arago-base-tisdk-image: add keystone support
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 15:28:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 06, 2014 at 10:24:41AM -0500, Maupin, Chase wrote:
> It has both listed for TARGET_IMAGES

Indeed... Can you remind me what is the purpose?


> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Thursday, February 06, 2014 10:19 AM
> >To: Maupin, Chase
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCH 4/6] arago-base-tisdk-image: add
> >keystone support
> >
> >On Thu, Feb 06, 2014 at 07:45:59AM -0500, Maupin, Chase wrote:
> >> >-----Original Message-----
> >> >From: Dmytriyenko, Denys
> >> >Sent: Wednesday, February 05, 2014 7:00 PM
> >> >To: Maupin, Chase
> >> >Cc: meta-arago@arago-project.org
> >> >Subject: Re: [meta-arago] [PATCH 4/6] arago-base-tisdk-image:
> >add
> >> >keystone support
> >> >
> >> >On Wed, Feb 05, 2014 at 02:04:04PM -0600, Chase Maupin wrote:
> >> >> * Add support to this image for keystone devices
> >> >
> >> >And the server image doesn't use arago-base-tisdk-image
> >directly.
> >>
> >> But the arago-core-tisdk-image does right?  So I still need this
> >support added.
> >
> >But, arago-core-tisdk-image uses server-rootfs image for keystone,
> >so it still
> >skips this...
> >
> >
> >> >So, I'll push the first 3 patches from the series.
> >> >
> >> >
> >> >> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >> >> ---
> >> >>  .../recipes-core/images/arago-base-tisdk-image.bb  |    2 +-
> >> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >> >>
> >> >> diff --git a/meta-arago-distro/recipes-core/images/arago-
> >base-
> >> >tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-
> >base-
> >> >tisdk-image.bb
> >> >> index 2c0e217..ef47dc0 100644
> >> >> --- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-
> >> >image.bb
> >> >> +++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-
> >> >image.bb
> >> >> @@ -4,7 +4,7 @@
> >> >>  require arago-image.inc
> >> >>  inherit remove-net-rules
> >> >>
> >> >> -COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-
> >> >a15"
> >> >> +COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-
> >> >a15|keystone"
> >> >>
> >> >>  IMAGE_INSTALL += "\
> >> >>      packagegroup-arago-base \
> >> >> --
> >> >> 1.7.0.4
> >> >>
> >> >> _______________________________________________
> >> >> meta-arago mailing list
> >> >> meta-arago@arago-project.org
> >> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> >>

