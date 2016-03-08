Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A16B852AE3
	for <meta-arago@arago-project.org>;
	Tue,  8 Mar 2016 00:57:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u280vITf030742;
	Mon, 7 Mar 2016 18:57:18 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u280vIE6002808;
	Mon, 7 Mar 2016 18:57:18 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Mar 2016 18:57:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u280vIku023979;
	Mon, 7 Mar 2016 18:57:18 -0600
Date: Mon, 7 Mar 2016 19:57:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20160308005702.GL14393@edge>
References: <1457385534-2153-1-git-send-email-denis@denix.org>
	<2E957F12D11D904590FA9AF86D366BD926B90A8B@DLEE08.ent.ti.com>
	<20160307224417.GI14393@edge>
	<2E957F12D11D904590FA9AF86D366BD926B90C50@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926B90C50@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-server-extra-rootfs-image: only add multimedia when alsa is enabled
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
X-List-Received-Date: Tue, 08 Mar 2016 00:57:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, dsp66 gst plugins would go into gst packagegroup anyway. As of demos and 
clips, sure multimedia packagegroup does make sense. But usually you update 
packagegroup at the end, not in the beginning. That's why right now, when I 
looked at it, it didn't make sense to include multimedia packagegroup for all 
keystones. Ok, I will not change it, but only under the assumption that you 
will be submitting mentioned updates in the near future. Thanks.

-- 
Denys


On Mon, Mar 07, 2016 at 06:41:07PM -0500, Gou, Hongmei wrote:
> Hi Denys,
> 
> In the current recipes, packagegroup-arago-tisdk-multimedia is equivalent to 
> packagegroup-*-gst for keystone. We used packagegroup-arago-tisdk-multimedia 
> to allow additions in the future for keystone, e.g., testing clips. For 
> dsp66 gst plugins, we are planning some demos from file to file, or using 
> Ethernet as the input/output source.
> 
> Thanks,
> Hongmei
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, March 07, 2016 5:44 PM
> > To: Gou, Hongmei
> > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] tisdk-server-extra-rootfs-image: only add
> > multimedia when alsa is enabled
> > 
> > Hongmei,
> > 
> > So, why not include packagegroup-*-gst instead if you only need gstreamer?
> > What kind of multimedia there is for Keystone?
> > 
> > --
> > Denys
> > 
> > 
> > On Mon, Mar 07, 2016 at 10:40:43PM +0000, Gou, Hongmei wrote:
> > > Hi Denys,
> > >
> > > Multimedia/gstreamer packagegroup is needed for all K2 platforms due to
> > the reasons below:
> > >
> > > 1. OpenCV is intended for all K2 platforms, which has dependency on
> > gstreamer
> > > 2. The dsp66 GST plugin (a new feature in the coming Processor SDK 2.0.2
> > release) is intended for all K2 platforms, which needs gstreamer also
> > >
> > > Thanks,
> > > Hongmei
> > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Monday, March 07, 2016 4:19 PM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCH] tisdk-server-extra-rootfs-image: only add
> > > > multimedia when alsa is enabled
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  .../recipes-core/images/tisdk-server-extra-rootfs-image.bb              | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-
> > rootfs-
> > > > image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-
> > > > rootfs-image.bb
> > > > index 432f421..51237cb 100644
> > > > --- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-
> > > > image.bb
> > > > +++ b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-
> > > > image.bb
> > > > @@ -3,7 +3,7 @@ require recipes-core/images/tisdk-server-rootfs-
> > image.bb
> > > >  IMAGE_INSTALL += "\
> > > >      packagegroup-arago-test-addons \
> > > >      packagegroup-arago-tisdk-addons-extra \
> > > > -    packagegroup-arago-tisdk-multimedia \
> > > > +    ${@base_contains('MACHINE_FEATURES', 'alsa', 'packagegroup-
> > arago-
> > > > tisdk-multimedia', '',d)} \
> > > >  "
> > > >
> > > >  export IMAGE_BASENAME = "tisdk-server-extra-rootfs-image"
> > > > --
> > > > 2.2.0
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

