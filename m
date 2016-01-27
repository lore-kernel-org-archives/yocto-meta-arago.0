Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DE67F52961
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 20:15:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RKFlK4006341
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 14:15:47 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RKFld3004956
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 14:15:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 14:15:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RKFkTT022656;
	Wed, 27 Jan 2016 14:15:46 -0600
Date: Wed, 27 Jan 2016 15:15:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160127201531.GV11314@edge>
References: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
	<1453924469-27790-7-git-send-email-j-stiffler@ti.com>
	<20160127201338.GU11314@edge>
MIME-Version: 1.0
In-Reply-To: <20160127201338.GU11314@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 6/6] tisdk-server-rootfs-image: Add unnecessary dev packages to BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 27 Jan 2016 20:15:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 27, 2016 at 03:13:38PM -0500, Denys Dmytriyenko wrote:
> Can you please summarize why those packages get pulled in the first place?
> 
> On Wed, Jan 27, 2016 at 02:54:29PM -0500, Jacob Stiffler wrote:
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> > index 3928948..89272f0 100644
> > --- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> > @@ -13,4 +13,11 @@ IMAGE_INSTALL += "\
> >      gdb \
> >  "
> >  
> > +BAD_RECOMMENDATIONS += " \
> > +    ti-llvm3.3-dev \

Moreover, wasn't ti-llvm3.3-dev updated to ti-llvm3.6-dev by patch #1/6?


> > +    opencl-monitor-dev \
> > +    libulm-dev \
> > +    gdbserver-c6x-dev \
> > +"
> > +
> >  export IMAGE_BASENAME = "tisdk-server-rootfs-image"
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

