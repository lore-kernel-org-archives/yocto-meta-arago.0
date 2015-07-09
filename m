Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6AA795299C
	for <meta-arago@arago-project.org>;
	Thu,  9 Jul 2015 23:24:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t69NOCBn027602;
	Thu, 9 Jul 2015 18:24:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t69NOCpY026558;
	Thu, 9 Jul 2015 18:24:12 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Jul 2015 18:23:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t69NOBAG029507;
	Thu, 9 Jul 2015 18:24:12 -0500
Date: Thu, 9 Jul 2015 19:23:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20150709232356.GK15657@edge>
References: <CADySD0Et4JtD7_bZ8yMUkbaBrbrtrt8v8YETaJUHkSm=FbMaTg@mail.gmail.com>
	<CADySD0GJA3Mw4UMuEp9d5rmiChEL+ypZzgCuu-pFxXBLingw1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GJA3Mw4UMuEp9d5rmiChEL+ypZzgCuu-pFxXBLingw1Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: How to build browser (chrome/firefox) for AM335x using meta-arago
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
X-List-Received-Date: Thu, 09 Jul 2015 23:24:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I haven't tried it recently, but you should be able to add meta-browser to 
bblayers.conf file and bitbake the corresponding target.

-- 
Denys


On Fri, Jul 03, 2015 at 04:17:21PM +1200, Ankur Tyagi wrote:
> Hi,
> 
> In case previous one was missed.
> 
> I want to build chrome/firefox browser for my AM335x EVM.
> 
> I am using "arago-daisy-config.txt" to bitbake tisdk-rootfs-image.
> 
> I see there is meta-browser which includes chrome, firefox.
> 
> How can I get them build with my tisdk rootfs ?
> 
> What all do I need to modify in my bblayer and local conf files ?
> 
> thanks
> 
> 
> "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> fruit salad"
> 
> On Fri, Jun 19, 2015 at 7:04 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> 
> > Hi,
> >
> > I want to build chrome/firefox browser for my AM335x EVM.
> >
> > I am using "arago-daisy-config.txt" to bitbake tisdk-rootfs-image.
> >
> > I see there is meta-browser which includes chrome, firefox.
> >
> > How can I get them build with my tisdk rootfs ?
> >
> > What all do I need to modify in my bblayer and local conf files ?
> >
> > thanks
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


