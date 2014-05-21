Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C820952A3E
	for <meta-arago@arago-project.org>;
	Wed, 21 May 2014 16:41:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LGfVtI031265
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 11:41:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LGfVY8008980
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 11:41:31 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 May 2014 11:41:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LGfUYs019736;
	Wed, 21 May 2014 11:41:30 -0500
Date: Wed, 21 May 2014 12:41:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20140521164130.GH21819@edge>
References: <1400681214-9143-1-git-send-email-hzhang@ti.com>
	<20140521163934.GB27324@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140521163934.GB27324@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [Re-submit: v3] keystone: tisdk-image: change TARGET_IMAGES from keystone-evm to k2hk-evm
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
X-List-Received-Date: Wed, 21 May 2014 16:41:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 21, 2014 at 12:39:34PM -0400, Denys Dmytriyenko wrote:
> On Wed, May 21, 2014 at 10:06:54AM -0400, hzhang@ti.com wrote:
> > From: Hao Zhang <hzhang@ti.com>
> > 
> > Keystone II SoC family has multiple devices and EVM's: k2hk, k2l and k2e.
> > All the EVM's share the same core tisdk image. The TARGET_IMAGES should
> > be set to keystone SoC family rather than a keystone EVM machine config.
> 
> Hao,
> 
> Just a quick reminder - when you resubmit a new version of the same patch, it 
> helps to include a brief description of what has changed. That normally goes 
> after the --- line below...

That's for the future - no need to resubmit this one again though :)


> > Signed-off-by: Hao Zhang <hzhang@ti.com>
> > ---
> 
> A short description of the changes made to the patch itself...
> 
> 
> >  .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > index f25db51..1dd9d6d 100644
> > --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > @@ -27,7 +27,7 @@ DTB_FILTER_keystone = "k2hk"
> >  TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
> >  
> >  # Some devices do not support display and use a server image instead
> > -TARGET_IMAGES_keystone-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
> > +TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"
> >  
> >  TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
> >  
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

