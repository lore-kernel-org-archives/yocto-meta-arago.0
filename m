Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3577352A79
	for <meta-arago@arago-project.org>;
	Thu, 13 Jun 2013 19:06:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5DJ6ms8018576;
	Thu, 13 Jun 2013 14:06:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5DJ6mcT028777;
	Thu, 13 Jun 2013 14:06:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 13 Jun 2013 14:06:48 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5DJ6m4h028260;
	Thu, 13 Jun 2013 14:06:48 -0500
Date: Thu, 13 Jun 2013 15:06:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Kovitz <paul.kovitz@welchallyn.com>
Message-ID: <20130613190647.GW3741@edge>
References: <20130613165457.GS3741@edge>
	<CA+edY+RB9HN0JsPJecU1MNO1-5biRUNFqiEW82_q+ztJDtXe7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+edY+RB9HN0JsPJecU1MNO1-5biRUNFqiEW82_q+ztJDtXe7A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Updated Core TI-SDK setup and build instructions
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
X-List-Received-Date: Thu, 13 Jun 2013 19:06:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 13, 2013 at 11:36:10AM -0700, Paul Kovitz wrote:
> Hi Denys.
> 
> Overall, the wiki looks clear. I have some questions.
> 
> The wiki does not address the SDK releases. I want to reproduce exactly
> amsdk-05.07.00.00. Do I use the arago 2011.09 toolchain or the linaro
> toolchain? Also, if I want to reproduce the amsdk-05.07.00.00 release when
> some recipes always get the latest from a git repo or a svn repo, is there
> a list of SRCREV overrides somewhere that I can put in my local.conf so I
> can be sure I build with the version that was tested and released rather
> than the latest version in the repo?

Paul,

Those are all good questions!

There are config files in oe-layersetup repository that correspond to specific 
product releases (coresdk, amsdk and mcsdk). They usually point to the HEAD of 
corresponding layers (same as arago-danny-config, for example) during 
development phase, and locked down to specific tags or commit IDs once the 
release is out. So, in order to reproduce amsdk-05.07.00.00, you'd need to use 
a corresponding amsdk/amsdk-05.07.00.00-config file with oe-layertool-setup 
script. That config file has all the layers locked down to specific tags and 
commit IDs, so the setup doesn't change over time. It also uses amsdk-specific 
integration copies of meta-ti and meta-arago repos for tagging purposes, or if 
there were any last minute fixes/hacks that didn't go into official meta-ti 
and meta-arago. amsdk-05.07.00.00 used the old Arago toolchain 2011.09, so if 
you want to reproduce it exactly, you should use the same toolchain.

Please let me know if you have any additional questions. Thanks.

-- 
Denys


> On Thu, Jun 13, 2013 at 9:54 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > All,
> >
> > Here are the updated instructions on how to setup your build environment
> > for
> > the Yocto Project and OpenEmbedded in order to build our Core TI-SDK images
> > out of "meta-ti" TI BSP layer and "meta-arago" Arago Project distribution:
> >
> > http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> >
> > Please let me know of any comments, questions or feedback. Thanks.
> >
> > --
> > Denys
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

