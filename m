Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C276752972
	for <meta-arago@arago-project.org>;
	Tue, 30 Sep 2014 21:24:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8ULNxIj003721
	for <meta-arago@arago-project.org>; Tue, 30 Sep 2014 16:24:00 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8ULNxFp002987
	for <meta-arago@arago-project.org>; Tue, 30 Sep 2014 16:23:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 30 Sep 2014 16:23:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8ULNxh4029815;
	Tue, 30 Sep 2014 16:23:59 -0500
Date: Tue, 30 Sep 2014 17:23:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140930212359.GU6303@edge>
References: <1409844854-17247-1-git-send-email-a0393906@ti.com>
	<1409844854-17247-2-git-send-email-a0393906@ti.com>
	<20140911222951.GL18620@edge>
MIME-Version: 1.0
In-Reply-To: <20140911222951.GL18620@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master] [PATCH 1/3] tisdk-connectivity: Add support for omap-a15 based targets
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
X-List-Received-Date: Tue, 30 Sep 2014 21:24:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 11, 2014 at 06:29:51PM -0400, Denys Dmytriyenko wrote:
> On Thu, Sep 04, 2014 at 09:04:12PM +0530, Karthik Ramanan wrote:
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> > index f6c8660..7c5c565 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install wireless packages into the target FS"
> >  LICENSE = "MIT"
> > -PR = "r29"
> > +PR = "r30"
> >  
> >  inherit packagegroup
> >  
> > @@ -63,6 +63,13 @@ CONNECTIVITY_RDEPENDS_ti43x = "\
> >      ${FIRMWARE_AND_DRIVERS} \
> >  "
> >  
> > +CONNECTIVITY_RDEPENDS_omap-a15 = "\
> > +    ${WLAN_COMMON} \
> > +    ${BLUETOOTH_STACK} \
> > +    ${@base_contains('ARAGO_BRAND','glsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
> > +    bt-firmware \
> 
> So, I see that wlan and by components are added to omap-a15 SOC, while 
> firmware and drivers are only enabled when built for GLSDK. I'm wondering if 
> that will affect negatively other platforms based on the same SOC, including 
> am57x... And wasn't BT support completely dropped by Sitara? Is it still the 
> case?

Ping on this one - this will re-enable BT for the entire SOC family, that will 
affect DRA7xx as well AM57x. I'm not sure that is intended for other SDK 
products. Should those be conditional on ARAGO_BRAND set to glsdk as well?


> > +"
> > +
> >  RDEPENDS_${PN} = "\
> >      ${CONNECTIVITY_RDEPENDS} \
> >  "
> > -- 
> > 2.0.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

