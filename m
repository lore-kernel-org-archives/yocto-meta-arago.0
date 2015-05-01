Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8BF49529DF
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 15:19:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41FJ8dK013444
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 10:19:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41FJ75n028157
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 10:19:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 1 May 2015 10:19:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41FJ7G6010911;
	Fri, 1 May 2015 10:19:07 -0500
Date: Fri, 1 May 2015 11:19:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150501151906.GY29290@edge>
References: <1480745164.301.1430449311116.JavaMail.jenkins@puget>
	<20150501135817.GW29290@edge> <55438D20.6020203@ti.com>
MIME-Version: 1.0
In-Reply-To: <55438D20.6020203@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [nightly] Core TISDK 2015.04 build 2015-04-30_22-00-51
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
X-List-Received-Date: Fri, 01 May 2015 15:19:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I think there's some confusion... Does this link help?

http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controller_User_Guide

-- 
Denys


On Fri, May 01, 2015 at 10:26:40AM -0400, Jacob Stiffler wrote:
> I see the error:
> 
> make[3]: *** No rule to make target
> `../../gst-libs/gst/drm/libgstdrm-1.0.la', needed by
> `libgstwaylandsink.la'.  Stop.
> make[3]: *** Waiting for unfinished jobs....
> 
> Looks like drm is needed for waylandsink. But I thought am3/am4 did
> not have DRM?
> 
> 
> 
> 
> On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> >Jake,
> >
> >gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
> >
> >
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 
> 
> On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> >Jake,
> >
> >gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
> >
> >
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

