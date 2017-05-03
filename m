Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B9B1F529A8
	for <meta-arago@arago-project.org>;
	Wed,  3 May 2017 18:55:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v43ItPEY005389
	for <meta-arago@arago-project.org>; Wed, 3 May 2017 13:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493837725;
	bh=ZdLOUGW2Y55WSXyLJ3P5gmRM6KxRl47qn0qSybowRGY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bvKHi6SzQQMUw1QOK4cBBNcaFf5bT2/yYOHAgaqZIVhKxKz+2F1VSP0YpycszWID2
	zmgK/2LxwUg91H2mQ8SOWvKmbDgnDHZbzSu6nqKjm2oLNX0InopnMJFY1sqVJF+8Rw
	jN3pr7Zq4QksSEtzEWuVPQMHt81Xpi6WtHrhDKzU=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v43ItP81019472
	for <meta-arago@arago-project.org>; Wed, 3 May 2017 13:55:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 3 May 2017 13:55:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v43ItOj2020099;
	Wed, 3 May 2017 13:55:24 -0500
Date: Wed, 3 May 2017 14:55:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170503185523.GE16330@edge>
References: <1493410824-49935-1-git-send-email-sam.nelson@ti.com>
	<1493410824-49935-2-git-send-email-sam.nelson@ti.com>
	<20170501214828.GX31608@edge>
MIME-Version: 1.0
In-Reply-To: <20170501214828.GX31608@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v3 2/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package
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
X-List-Received-Date: Wed, 03 May 2017 18:55:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 01, 2017 at 05:48:28PM -0400, Denys Dmytriyenko wrote:
> On Fri, Apr 28, 2017 at 04:20:24PM -0400, Sam Nelson wrote:
> > ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
> > examples
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > 
> > ---
> > Changes from previous patch
> > Remove for omap-a15
> 
> Does it mean omap-a15 won't have ipc examples? Don't you need to add them to 
> another packagegroup?

Sam,

Just a gentle reminder that patch #2 has not been merged in, so there are no 
ipc examples in any of the rootfs. Let me know if you have further questions. 
Thanks.

-- 
Denys


> > ---
> > ---
> >  .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb         | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> > index 784c5b4..56be64e 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> > @@ -106,6 +106,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
> >      ipsecmgr-mod \
> >      k2-initramfs \
> >      parse-ip \
> > +    ti-ipc-examples-linux \
> >      "
> >  
> >  # The following packages are not yet ready for k2g-evm
> > @@ -116,6 +117,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
> >  
> >  ARAGO_TI_PKGS = ""
> >  ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
> > +ARAGO_TI_PKGS_append_omapl138 = " ti-ipc-examples-linux"
> >  
> >  # Disable netapi due to libnl and xfrm conflict
> >  #    netapi
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

