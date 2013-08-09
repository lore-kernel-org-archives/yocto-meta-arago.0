Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 94887529D3
	for <meta-arago@arago-project.org>;
	Fri,  9 Aug 2013 15:13:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r79FDG0E024521;
	Fri, 9 Aug 2013 10:13:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r79FDGJc020493;
	Fri, 9 Aug 2013 10:13:16 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 9 Aug 2013 10:13:16 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r79FDGfT005000;
	Fri, 9 Aug 2013 10:13:16 -0500
Date: Fri, 9 Aug 2013 11:13:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: kiran bobbu <kiran.bobbu@gmail.com>
Message-ID: <20130809151312.GJ25015@edge>
References: <CAO7jpqfv_WvnpmEcbH5rZQ3qOGp2SW1Vq4=z=xpHVZuBDBhg=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO7jpqfv_WvnpmEcbH5rZQ3qOGp2SW1Vq4=z=xpHVZuBDBhg=w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: whats the bitbake target to build X11 for omap5 evm
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
X-List-Received-Date: Fri, 09 Aug 2013 15:13:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 09, 2013 at 04:15:58PM +0530, kiran bobbu wrote:
> Hi,
> I want to build x11 as a part of arago distribution  .but its failing with
> error
> ERROR: Nothing PROVIDES 'xf86-video-omap_git'
> 
> 
> build command used:
> MACHINE=omap5-evm bitbake xf86-video-omap_git

Kiran,

Arago distribution does not enable X11 by default, hence you cannot build X11 
targets w/o changing your configuration first.

-- 
Denys

