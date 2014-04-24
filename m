Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B6FB652998
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 17:10:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OHAgTh031930;
	Thu, 24 Apr 2014 12:10:42 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OHAg4O018130;
	Thu, 24 Apr 2014 12:10:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Apr 2014 12:10:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OHAgIO024823;
	Thu, 24 Apr 2014 12:10:42 -0500
Date: Thu, 24 Apr 2014 13:10:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140424171041.GS18053@edge>
References: <1398282148-11547-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C68D7F2@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C68D7F2@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [oe-layersetup][PATCH 0/5] RFC: cleanup and remove	denzil configs
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
X-List-Received-Date: Thu, 24 Apr 2014 17:10:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 23, 2014 at 08:30:04PM +0000, Cooper Jr., Franklin wrote:
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Wednesday, April 23, 2014 2:42 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [oe-layersetup][PATCH 0/5] RFC: cleanup and remove
> > denzil configs
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > RFC: Remove some cruft of old denzil configs.
> > 
> > I would have left amsdk* and mcsdk* configs alone, if they didn't reference
> > other config files in sample-files/, which I would like to clean up mostly.

> [Franklin] So how about subdirectories in sample-files for each maintenance 
> branch?

Ok, I'll see what I can do...


> I wouldn't mind deleting the generic arago config files from old maintenance 
> branches since most of the time people really care about the sdk specific 
> config files.

Depends on people...


> > This repository is not tagged, but used as a BOM-reference for old release
> > configs. Do we need to preserve those files some other place?
> > 
> > Other alternatives for preserving the configs are:
> > * in a separate "old/deprecated" branch
> > * in a sub-directory of a similar name
> > * tagging the repo before removal

> [Franklin] I envisioned oe-layersetup as a way that you can simply rebuild 
> any sdk no matter how old by simply swapping out config files. So I would 
> prefer a sub-directory approach instead of a branch or tagging approach 
> since that will add complexity for users.
> > 
> > Denys Dmytriyenko (5):
> >   bblayers-denzil: remove denzil-specific bblayers file, deprecated
> >   local-arago-linaro.conf: remove denzil-specific version setting Linaro
> >     TC
> >   mcsdk-03.00.00.xx: remove old denzil-based configs
> >   arago-denzil-config: remove denzil-specific config
> >   amsdk-05.06.00.00: remove denzil-specific config
> > 
> >  configs/amsdk/amsdk-05.06.00.00-config.txt  |  10 --
> >  configs/arago-denzil-config.txt             |  11 --
> >  configs/mcsdk/mcsdk-03.00.00.03-config.txt  |  10 --  configs/mcsdk/mcsdk-
> > 03.00.00.05-config.txt  |  11 --  configs/mcsdk/mcsdk-03.00.00.06-config.txt  |
> > 11 --  configs/mcsdk/mcsdk-03.00.00.07-config.txt  |  11 --
> >  sample-files/bblayers-denzil.conf.sample    |   9 --
> >  sample-files/local-arago-linaro.conf.sample | 160 ----------------------------
> >  8 files changed, 233 deletions(-)
> >  delete mode 100644 configs/amsdk/amsdk-05.06.00.00-config.txt
> >  delete mode 100644 configs/arago-denzil-config.txt  delete mode 100644
> > configs/mcsdk/mcsdk-03.00.00.03-config.txt
> >  delete mode 100644 configs/mcsdk/mcsdk-03.00.00.05-config.txt
> >  delete mode 100644 configs/mcsdk/mcsdk-03.00.00.06-config.txt
> >  delete mode 100644 configs/mcsdk/mcsdk-03.00.00.07-config.txt
> >  delete mode 100644 sample-files/bblayers-denzil.conf.sample
> >  delete mode 100644 sample-files/local-arago-linaro.conf.sample
> > 
> > --
> > 1.9.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

